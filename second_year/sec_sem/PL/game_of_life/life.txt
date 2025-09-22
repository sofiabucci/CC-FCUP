% ----------------------------
% Biblioteca gráfica XPCE
% ----------------------------
:- use_module(library(pce)).

% ----------------------------
% Declaração de predicados dinâmicos
% ----------------------------
:- dynamic cell/2.                  % Representa células vivas (X, Y)
:- dynamic width/1, height/1.       % Dimensões da grade
:- dynamic cell_box/3.              % Elemento gráfico associado à célula
:- dynamic dialog_window/1.         % Janela principal
:- dynamic running/0.               % Indica se a simulação está em execução
:- dynamic paused/0.                % Indica se a simulação está pausada
:- dynamic simulation_thread/1.     % Thread da simulação
:- dynamic max_generations/1.       % Máximo de gerações a serem simuladas
:- dynamic current_generation/1.    % Geração atual

% ----------------------------
% Parâmetros da grade
% ----------------------------
width(60).
height(30).

% ----------------------------
% Inicialização e padrões
% ----------------------------

% Remove todas as células vivas
clear_cells :- retractall(cell(_, _)).

% Gera N células vivas aleatórias
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

% ----------------------------
% Lógica do jogo da vida
% ----------------------------

% Verifica se a célula está viva
is_alive(X, Y) :- cell(X, Y).

% Verifica se a célula está morta
is_empty(X, Y) :- \+ cell(X, Y).

% Aplica efeito de "wrap around" (borda infinita)
wrap_pos((X,Y), (WX,WY)) :-
    width(W), height(H),
    WX is ((X - 1) mod W) + 1,
    WY is ((Y - 1) mod H) + 1.

% Retorna todas as posições vizinhas de uma célula
neighbors(X, Y, Neighs) :-
    findall(Pos, (
        between(-1,1,DX), between(-1,1,DY),
        (DX \= 0 ; DY \= 0),
        NX is X + DX, NY is Y + DY,
        wrap_pos((NX, NY), Pos)
    ), Neighs).

% Verifica se uma posição está viva (usado por include)
is_alive_pair((X,Y)) :- is_alive(X,Y).

% Conta o número de vizinhos vivos de uma célula
live_neighbors(X, Y, Count) :-
    neighbors(X, Y, Neighs),
    include(is_alive_pair, Neighs, Alive),
    length(Alive, Count).

% Retorna lista de células sobreviventes (com 2 ou 3 vizinhos vivos)
survivors(Survivors) :-
    findall((X,Y), (cell(X,Y), live_neighbors(X,Y,N), (N=2; N=3)), Survivors).

% Retorna lista de novas células que nascerão (3 vizinhos vivos)
births(Births) :-
    findall((X,Y), (
        cell(X1,Y1),
        neighbors(X1,Y1,Neighs),
        member((X,Y), Neighs),
        is_empty(X,Y),
        live_neighbors(X,Y,3)
    ), Temp),
    sort(Temp, Births).

% Gera a próxima geração
next_generation :-
    survivors(S),
    births(B),
    clear_cells,
    assert_cells(S),
    assert_cells(B).

% Adiciona células vivas à base de dados
assert_cells([]).
assert_cells([(X,Y)|T]) :-
    assertz(cell(X,Y)),
    assert_cells(T).

% ----------------------------
% Interface gráfica (tema escuro)
% ----------------------------
create_dialog :-
    width(W), height(H),
    BoxSize = 15,
    GridWidth is W * BoxSize,
    GridHeight is H * BoxSize,
    ControlWidth = 470,
    WindowWidth is GridWidth + ControlWidth,
    WindowHeight is GridHeight,

    new(D, dialog('Game of Life')),
    send(D, size, size(WindowWidth, WindowHeight)),
    send(D, scrollbars, none),
    send(D, background, colour(grey20)),

    new(P, picture),
    send(P, size, size(GridWidth, GridHeight)),
    send(P, scrollbars, none),
    send(P, background, colour(grey10)),
    send(D, append, P),

    % Criação de caixas da grade
    forall(between(1, W, X),
        forall(between(1, H, Y),
            (
                XPos is (X - 1) * BoxSize,
                YPos is (Y - 1) * BoxSize,
                new(Box, box(BoxSize, BoxSize)),
                send(Box, pen, 1),
                send(Box, fill_pattern, colour(grey15)),
                send(P, display, Box, point(XPos, YPos)),
                asserta(cell_box(X, Y, Box))
            )
        )
    ),

    % Painel de controle
    new(ControlPanel, dialog_group(controls)),
    send(ControlPanel, gap, size(5, 5)),

    % Controle de velocidade
    new(SpeedLabel, label(text, 'Speed (ms):')),
    send(SpeedLabel, colour, colour(white)),
    send(ControlPanel, append, SpeedLabel),
    send(ControlPanel, append, new(Speed, int_item(speed, 100))),

    % Controle de gerações
    new(GenLabel, label(text, 'Generations:')),
    send(GenLabel, colour, colour(white)),
    send(ControlPanel, append, GenLabel),
    send(ControlPanel, append, new(MaxGens, int_item(generations, 100))),

    % Botões de controle
    new(StartBtn, button('Start', message(@prolog, start_simulation, Speed?selection, MaxGens?selection))),
    send(ControlPanel, append, StartBtn),

    new(PauseBtn, button('Pause/Resume', message(@prolog, toggle_pause))),
    send(ControlPanel, append, PauseBtn),

    new(NextBtn, button('Next', 
         and(message(@prolog, stop_simulation),
             message(@prolog, next_generation),
             message(@prolog, update_display)))),
    send(ControlPanel, append, NextBtn),

    new(RandomBtn, button('Random', message(@prolog, random_pattern))),
    send(ControlPanel, append, RandomBtn),

    new(ClearBtn, button('Clear', message(@prolog, clear_pattern))),
    send(ControlPanel, append, ClearBtn),

    new(QuitBtn, button('Quit', message(D, destroy))),
    send(ControlPanel, append, QuitBtn),

    send(D, append, ControlPanel, right),
    send(D, open),
    asserta(dialog_window(D)).

% Atualiza as cores das células na interface
update_display :-
    forall(cell_box(X, Y, Box),
        (is_alive(X, Y) ->
            send(Box, fill_pattern, colour(darkcyan))
        ;
            send(Box, fill_pattern, colour(grey15))
        )
    ).

% ----------------------------
% Controle da simulação
% ----------------------------

% Encerra a thread de simulação, se existir
cleanup_threads :-
    (   simulation_thread(Thread) ->
        catch(thread_join(Thread, _), _, true),
        retractall(simulation_thread(_))
    ;   true
    ).

% Inicia a simulação em uma nova thread
start_simulation(Speed, MaxGenerations) :-
    stop_simulation,
    retractall(max_generations(_)),
    retractall(current_generation(_)),
    asserta(max_generations(MaxGenerations)),
    asserta(current_generation(0)),
    asserta(running),
    thread_create(
        simulation_loop(Speed),
        Thread,
        [detached(true)]
    ),
    asserta(simulation_thread(Thread)).

% Interrompe completamente a simulação
stop_simulation :-
    retractall(running),
    retractall(paused),
    cleanup_threads,
    retractall(max_generations(_)),
    retractall(current_generation(_)).

% Alterna entre pausar e continuar a simulação
toggle_pause :-
    (   paused -> retract(paused)
    ;   asserta(paused)
    ).

% Loop principal da simulação (executado em thread)
simulation_loop(Speed) :-
    catch(running, _, fail),
    (
        paused ->
            sleep(0.1),
            simulation_loop(Speed)
    ;
        current_generation(Current),
        max_generations(Max),
        Current < Max ->
            next_generation,
            update_display,
            NewCurrent is Current + 1,
            retractall(current_generation(_)),
            asserta(current_generation(NewCurrent)),
            Delay is Speed / 1000.0,
            sleep(Delay),
            simulation_loop(Speed)
    ;
        true  % fim da simulação
    ).

% ----------------------------
% Padrões e inicialização
% ----------------------------

% Gera padrão aleatório
random_pattern :-
    stop_simulation,
    random_cells(500),
    update_display.

% Limpa a grade
clear_pattern :-
    stop_simulation,
    clear_cells,
    update_display.

% Ponto de entrada principal
start :-
    random_cells(500),
    create_dialog,
    update_display.
