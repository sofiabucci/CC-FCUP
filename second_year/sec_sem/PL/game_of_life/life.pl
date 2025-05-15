:- use_module(library(pce)).
:- dynamic cell/2.
:- dynamic width/1, height/1.
:- dynamic cell_box/3.
:- dynamic dialog_window/1.

% Grid parameters
width(60).
height(30).

% Initial patterns
clear_cells :- retractall(cell(_, _)).

block :-
    clear_cells,
    assertz(cell(1,1)), assertz(cell(1,2)),
    assertz(cell(2,1)), assertz(cell(2,2)).

blinker :-
    clear_cells,
    assertz(cell(1,2)), assertz(cell(2,2)), assertz(cell(3,2)).

glider :-
    clear_cells,
    assertz(cell(4,2)), assertz(cell(2,3)),
    assertz(cell(4,3)), assertz(cell(3,4)), assertz(cell(4,4)).

random_cells(N) :-
    clear_cells,
    width(W), height(H),
    random_cells(N, W, H).

random_cells(0, _, _) :- !.
random_cells(N, W, H) :-
    random_between(1, W, X),
    random_between(1, H, Y),
    assertz(cell(X, Y)),
    N1 is N - 1,
    random_cells(N1, W, H).

% Game logic
is_alive(X, Y) :- cell(X, Y).
is_empty(X, Y) :- \+ cell(X, Y).

wrap_pos((X,Y), (WX,WY)) :-
    width(W), height(H),
    WX is 1 + ((X-1) mod W),
    WY is 1 + ((Y-1) mod H).

neighbors(X, Y, Neighs) :-
    findall(Pos, (
        between(-1,1,DX), between(-1,1,DY),
        (DX \= 0 ; DY \= 0),
        NX is X + DX, NY is Y + DY,
        wrap_pos((NX, NY), Pos)
    ), Neighs).

live_neighbors(X, Y, Count) :-
    neighbors(X, Y, Neighs),
    include(is_alive_pair, Neighs, Alive),
    length(Alive, Count).

is_alive_pair((X,Y)) :- is_alive(X,Y).

survivors(Survivors) :-
    findall((X,Y), (cell(X,Y), live_neighbors(X,Y,N), (N=2; N=3)), Survivors).

births(Births) :-
    findall((X,Y), (
        cell(X1,Y1),
        neighbors(X1,Y1,Neighs),
        member((X,Y), Neighs),
        is_empty(X,Y),
        live_neighbors(X,Y,3)
    ), Temp),
    sort(Temp, Births).

next_generation :-
    survivors(S),
    births(B),
    clear_cells,
    assert_cells(S),
    assert_cells(B).

assert_cells([]).
assert_cells([(X,Y)|T]) :-
    assertz(cell(X,Y)),
    assert_cells(T).

step_generation :-
    next_generation,
    update_display.

% Graphical interface
create_dialog :-
    width(W), height(H),
    BoxSize = 15,
    WindowWidth is W * BoxSize + 550,
    WindowHeight is H * BoxSize + 60,

    new(D, dialog('Game of Life')),
    send(D, size, size(WindowWidth, WindowHeight)),

    % Main game grid
    new(P, picture),
    send(P, size, size(W * BoxSize, H * BoxSize)),
    send(D, append, P),

    % Create grid cells
    forall(between(1, W, X),
        forall(between(1, H, Y),
            (
                X1 is (X - 1) * BoxSize,
                Y1 is (Y - 1) * BoxSize,
                new(Box, box(BoxSize, BoxSize)),
                send(Box, pen, 1),
                send(Box, fill_pattern, colour(black)),
                send(P, display, Box, point(X1, Y1)),
                asserta(cell_box(X, Y, Box))
            )
        )
    ),

    % Create control panel using a dialog_group
    new(ControlPanel, dialog_group(controls)),
    send(ControlPanel, append, label(text, 'Generations:')),
    send(ControlPanel, append, new(Gens, int_item(gens, 100))),
    send(ControlPanel, append, button('Start', message(@prolog, start_simulation, Gens?selection))),
    send(ControlPanel, append, button('Step', message(@prolog, step_generation))),
    send(ControlPanel, append, new(_, label(text, ''))), % Spacer
    send(ControlPanel, append, label(text, 'Patterns:')),
    send(ControlPanel, append, button('Glider', message(@prolog, glider_pattern))),
    send(ControlPanel, append, button('Blinker', message(@prolog, blinker_pattern))),
    send(ControlPanel, append, button('Block', message(@prolog, block_pattern))),
    send(ControlPanel, append, button('Random', message(@prolog, random_pattern))),
    send(ControlPanel, append, button('Clear', message(@prolog, clear_pattern))),
    send(ControlPanel, append, new(_, label(text, ''))), % Spacer
    send(ControlPanel, append, button('Quit', message(D, destroy))),

    % Add control panel to dialog
    send(D, append, ControlPanel, right),

    send(D, open),
    asserta(dialog_window(D)).

update_display :-
    forall(cell_box(X, Y, Box),
        (is_alive(X, Y) ->
            send(Box, fill_pattern, colour(green))
        ;
            send(Box, fill_pattern, colour(red))
        )
    ).

start_simulation(N) :-
    simulation_loop(N).

simulation_loop(0) :- !.
simulation_loop(N) :-
    step_generation,
    sleep(0.1),
    N1 is N - 1,
    simulation_loop(N1).

% Pattern buttons
glider_pattern :- glider, update_display.
blinker_pattern :- blinker, update_display.
block_pattern :- block, update_display.
random_pattern :- random_cells(500), update_display.
clear_pattern :- clear_cells, update_display.

% Main entry point
start :-
    random_cells(500),
    create_dialog,
    update_display.