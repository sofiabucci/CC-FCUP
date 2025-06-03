:- use_module(library(pce)).
:- dynamic cell/2.
:- dynamic width/1, height/1.
:- dynamic cell_box/3.
:- dynamic dialog_window/1.
:- dynamic running/0.
:- dynamic simulation_thread/1.
:- dynamic max_generations/1.
:- dynamic current_generation/1.
:- dynamic paused/0.

% Grid parameters
width(60).
height(30).

% Initial patterns
clear_cells :- retractall(cell(_, _)).

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

is_alive_pair((X,Y)) :- is_alive(X,Y).

live_neighbors(X, Y, Count) :-
    neighbors(X, Y, Neighs),
    include(is_alive_pair, Neighs, Alive),
    length(Alive, Count).

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

% Graphical interface with dark theme
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
    % Dark background for main dialog
    send(D, background, colour(grey20)),

    % Main game grid
    new(P, picture),
    send(P, size, size(GridWidth, GridHeight)),
    send(P, scrollbars, none),
    % Dark background for grid
    send(P, background, colour(grey10)),
    send(D, append, P),

    % Create grid cells with dark theme
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

    % Control panel with dark theme
    new(ControlPanel, dialog_group(controls)),
    send(ControlPanel, gap, size(5, 5)),
    
    % Control elements with dark theme styling
    new(SpeedLabel, label(text, 'Speed (ms):')),
    send(SpeedLabel, colour, colour(white)),
    send(ControlPanel, append, SpeedLabel),
    
    send(ControlPanel, append, new(Speed, int_item(speed, 100))),
    
    new(GenLabel, label(text, 'Generations:')),
    send(GenLabel, colour, colour(white)),
    send(ControlPanel, append, GenLabel),
    
    send(ControlPanel, append, new(MaxGens, int_item(generations, 100))),
    
    % Dark themed buttons
    new(StartBtn, button('Start', message(@prolog, start_simulation, Speed?selection, MaxGens?selection))),
    send(ControlPanel, append, StartBtn),
    
    new(PauseBtn, button('Pause', message(@prolog, pause_simulation))),
    send(ControlPanel, append, PauseBtn),
    
    new(NextBtn, button('Next', message(@prolog, next_generation), update_display)),
    send(ControlPanel, append, NextBtn),
    
    new(StopBtn, button('Stop', message(@prolog, stop_simulation))),
    send(ControlPanel, append, StopBtn),
    
    new(RandomBtn, button('Random', message(@prolog, random_pattern))),
    send(ControlPanel, append, RandomBtn),
    
    new(ClearBtn, button('Clear', message(@prolog, clear_pattern))),
    send(ControlPanel, append, ClearBtn),
    
    new(QuitBtn, button('Quit', message(D, destroy))),
    send(ControlPanel, append, QuitBtn),

    send(D, append, ControlPanel, right),
    send(D, open),
    asserta(dialog_window(D)).

update_display :-
    forall(cell_box(X, Y, Box),
        (is_alive(X, Y) ->
            % Bright cyan for alive cells
            send(Box, fill_pattern, colour(darkcyan))
        ;
            % Dark grey for dead cells
            send(Box, fill_pattern, colour(grey15))
        )
    ).

% Simulation control
start_simulation(Speed, MaxGenerations) :-
    stop_simulation,
    retractall(max_generations(_)),
    retractall(current_generation(_)),
    retractall(paused),
    asserta(max_generations(MaxGenerations)),
    asserta(current_generation(0)),
    asserta(running),
    thread_create(
        (   catch(
                simulation_loop(Speed),
                Error,
                (   print_message(warning, Error),
                    stop_simulation
                )
            )
        ),
        Thread,
        [detached(true)]
    ),
    asserta(simulation_thread(Thread)).

pause_simulation :-
    (   paused ->
        retractall(paused),
        send(@display, inform, 'Simulation resumed')
    ;   asserta(paused),
        send(@display, inform, 'Simulation paused')
    ).

stop_simulation :-
    retractall(running),
    retractall(paused),
    (   retract(simulation_thread(Thread)) ->
        catch(thread_signal(Thread, abort), _, true),
        catch(thread_join(Thread, _), _, true),
        retractall(simulation_thread(_))
    ;   true
    ),
    retractall(max_generations(_)),
    retractall(current_generation(_)).

simulation_loop(Speed) :-
    (   running,
        current_generation(Current),
        max_generations(Max),
        Current < Max
    ->
        (   paused ->
            sleep(0.1),
            simulation_loop(Speed)
        ;   next_generation,
            update_display,
            NewCurrent is Current + 1,
            retractall(current_generation(_)),
            asserta(current_generation(NewCurrent)),
            SleepTime is Speed/1000,
            sleep(SleepTime),
            simulation_loop(Speed)
        )
    ;   stop_simulation
    ).

% Pattern buttons
random_pattern :-
    stop_simulation,
    random_cells(500),
    update_display.

clear_pattern :-
    stop_simulation,
    clear_cells,
    update_display.

% Main entry point
start :-
    random_cells(500),
    create_dialog,
    update_display.