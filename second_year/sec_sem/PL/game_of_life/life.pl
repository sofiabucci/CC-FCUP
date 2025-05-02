:- use_module(library(pce)).
:- dynamic cell/2.
:- dynamic width/1, height/1.
:- dynamic dialog_window/1, browser_window/1.

% Initialize grid dimensions
width(60).  % Colunas
height(30). % Linhas

% Clear all cells
clear_cells :-
    retractall(cell(_, _)).

% Examples of starting patterns
block :-
    clear_cells,
    assertz(cell(1,1)), assertz(cell(1,2)),
    assertz(cell(2,2)), assertz(cell(2,1)).

blinker :-
    clear_cells,
    assertz(cell(1,2)), assertz(cell(2,2)), assertz(cell(3,2)).

glider :-
    clear_cells,
    assertz(cell(4,2)), assertz(cell(2,3)),
    assertz(cell(4,3)), assertz(cell(3,4)), assertz(cell(4,4)).

% Check if a position has a cell
is_alive(X, Y) :-
    cell(X, Y).

is_empty(X, Y) :-
    \+ is_alive(X, Y).

% Get the 8 neighbors of a position
neighbors(X, Y, Neighbors) :-
    X1 is X-1, Y1 is Y-1,
    X2 is X,   Y2 is Y-1,
    X3 is X+1, Y3 is Y-1,
    X4 is X-1, Y4 is Y,
    X5 is X+1, Y5 is Y,
    X6 is X-1, Y6 is Y+1,
    X7 is X,   Y7 is Y+1,
    X8 is X+1, Y8 is Y+1,
    maplist(wrap_pos, [(X1,Y1), (X2,Y2), (X3,Y3), (X4,Y4),
                       (X5,Y5), (X6,Y6), (X7,Y7), (X8,Y8)], Neighbors).

% Wrap a single position to stay within grid bounds
wrap_pos((X,Y), (WX,WY)) :-
    width(W),
    height(H),
    WX is 1 + ((X-1) mod W),
    WY is 1 + ((Y-1) mod H).

% Count live neighbors
live_neighbors(X, Y, Count) :-
    neighbors(X, Y, Neighbors),
    include(is_alive_pair, Neighbors, LiveNeighbors),
    length(LiveNeighbors, Count).

is_alive_pair((X,Y)) :-
    is_alive(X, Y).

% Survivors are cells with 2 or 3 live neighbors
survivors(Survivors) :-
    findall((X,Y), (cell(X,Y), live_neighbors(X, Y, N), (N=2; N=3)), Survivors).

% Births are empty positions with exactly 3 live neighbors
births(Births) :-
    findall((X,Y), (
        cell(X1, Y1),
        neighbors(X1, Y1, Neighbors),
        member((X,Y), Neighbors),
        is_empty(X, Y),
        live_neighbors(X, Y, 3)
    ), AllBirths),
    sort(AllBirths, Births).

% Next generation is survivors plus births
next_generation :-
    survivors(Survivors),
    births(Births),
    clear_cells,
    assert_cells(Survivors),
    assert_cells(Births).

assert_cells([]).
assert_cells([(X,Y)|Rest]) :-
    assertz(cell(X, Y)),
    assert_cells(Rest).

% Single step generation with display update
step_generation :-
    next_generation,
    update_display.

% Visualization in a dialog window
create_dialog :-
    width(W),
    height(H),
    % Tamanho aproximado de um caractere em pixels
    CharWidth = 10,
    CharHeight = 16,
    
    % Calcular tamanho da janela
    WindowWidth is W * CharWidth + 40,
    WindowHeight is H * CharHeight + 60,
    
    % Criar a janela
    new(D, dialog('Game of Life')),
    send(D, size, size(WindowWidth, WindowHeight)),
    
    % Criar o browser para mostrar o grid
    new(B, browser),
    send(B, font, font(monospace, normal, 12)),
    send(B, size, size(WindowWidth-20, WindowHeight-50)),
    send(D, append, B),
    
    % Adicionar botões de controle
    new(StartBtn, button('Iniciar', message(@prolog, start_simulation))),
    new(StepBtn, button('Passo', message(@prolog, step_generation))),
    new(CloseBtn, button('Fechar', message(D, destroy))),
    send(D, append, StartBtn, right),
    send(D, append, StepBtn, right),
    send(D, append, CloseBtn, right),
    
    send(D, open),
    asserta(dialog_window(D)),
    asserta(browser_window(B)).

update_display :-
    browser_window(B),
    width(W),
    height(H),
    findall(Line, (
        between(1, H, Y),
        findall(Char, (
            between(1, W, X),
            (is_alive(X, Y) -> Char = 'O'; Char = '.')
        ), Chars),
        atom_chars(Line, Chars)
    ), Lines),
    send(B, clear),
    forall(member(Line, Lines), send(B, append, Line)).

% Run simulation for N generations
life(N) :-
    update_display,
    sleep(0.1),
    next_generation,
    N1 is N - 1,
    (N1 > 0 -> life(N1); true).

start_simulation :-
    life(100).

% Random cells initialization
random_cells(N) :-
    clear_cells,
    width(W),
    height(H),
    random_cells(N, W, H).

random_cells(0, _, _) :- !.
random_cells(N, W, H) :-
    N > 0,
    random(1, W, X),
    random(1, H, Y),
    assertz(cell(X, Y)),
    N1 is N - 1,
    random_cells(N1, W, H).

% Main entry point
start :-
    random_cells(500),
    create_dialog,
    update_display.