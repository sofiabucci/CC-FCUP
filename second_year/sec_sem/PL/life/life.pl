:- module(life, [
    life/2,
    life/3,
    set_rule/2,
    empty_world/1,
    world_add_cells/3,
    run_simulation/2
]).

:- use_module(library(clpfd)).
:- use_module(library(record)).

:- dynamic rule/2.
rule(birth, [3]).       % Conway padrão (B3/S23)
rule(survival, [2, 3]). % Célula viva sobrevive com 2 ou 3 vizinhos

:- record(world(
    live_cells:list=[],
    dead_cells:list=[],
    generation:integer=0,
    stats:list=[cells(0), born(0), died(0)]
)).

% Interface principal
set_rule(Type, Values) :-
    must_be(oneof([birth, survival]), Type),
    must_be(list, Values),
    retractall(rule(Type, _)),
    assertz(rule(Type, Values)).

empty_world(world{}.).

world_add_cells(World, Cells, NewWorld) :-
    sort(Cells, SortedCells),
    NewWorld = World.put([
        live_cells:SortedCells,
        stats:[cells(length(SortedCells)), born(0), died(0)]
    ]).

% Regras de evolução
cell_new_state(dead_cell, N, live_cell) :-
    rule(birth, B),
    member(N, B).

cell_new_state(live_cell, N, live_cell) :-
    rule(survival, S),
    member(N, S).

cell_new_state(_, _, dead_cell).

count_neighbors(Cell, LiveCells, Count) :-
    findall(1, (
        neighbor(Cell, Neighbor),
        member(Neighbor, LiveCells)
    ), Neighbors),
    length(Neighbors, Count).

neighbor(cell(X,Y), cell(XN,YN)) :-
    between(-1, 1, DX),
    between(-1, 1, DY),
    (DX =\= 0; DY =\= 0),
    XN is X + DX,
    YN is Y + DY.

% Evolução do mundo
evolve(World, NextWorld) :-
    world_generation(World, Gen),
    findall(C, (
        member(C, World.live_cells),
        count_neighbors(C, World.live_cells, N),
        cell_new_state(live_cell, N, live_cell)
    ), Surviving),
    findall(C, (
        member(C, World.dead_cells),
        count_neighbors(C, World.live_cells, N),
        cell_new_state(dead_cell, N, live_cell)
    ), Born),
    append(Surviving, Born, NewLive),
    update_neighbors(NewLive, NewDead),
    calculate_stats(World.live_cells, NewLive, Stats),
    NextWorld = world{
        live_cells:NewLive,
        dead_cells:NewDead,
        generation:Gen + 1,
        stats:Stats
    }.

update_neighbors(LiveCells, DeadCells) :-
    findall(N, (
        member(C, LiveCells),
        neighbor(C, N),
        \+ member(N, LiveCells)
    ), AllNeighbors),
    sort(AllNeighbors, DeadCells).

calculate_stats(OldLive, NewLive, Stats) :-
    length(OldLive, OldCount),
    length(NewLive, NewCount),
    Born is max(0, NewCount - OldCount),
    Died is max(0, OldCount - NewCount),
    Stats = [cells(NewCount), born(Born), died(Died)].

% Visualização
world_to_string(World, Window, Str) :-
    world_window(Width, Height, _, _) = Window,
    findall(Line, (
        between(0, Height, Y),
        get_line(World, Width, Y, Line)
    ), Lines),
    atomic_list_concat(Lines, '\n', Str).

get_line(World, Width, Y, Line) :-
    findall(Char, (
        between(0, Width, X),
        (member(cell(X,Y), World.live_cells) -> Char = '■'; Char = '□')
    ), Chars),
    atom_chars(Line, Chars).

print_world(World) :-
    format('Generation: ~d | Cells: ~d | Born: ~d | Died: ~d~n~n', 
           [World.generation, World.stats.cells, World.stats.born, World.stats.died]),
    world_to_string(World, world_window(20, 20, 10, 40), Str),
    write(Str).

% Padrões predefinidos
pattern(glider, [cell(1,0), cell(2,1), cell(0,2), cell(1,2), cell(2,2)]).
pattern(blinker, [cell(1,0), cell(1,1), cell(1,2)]).

% Controle da simulação
run_simulation(World, Window) :-
    print_world(World),
    sleep(1),
    evolve(World, NextWorld),
    clear_screen,
    run_simulation(NextWorld, Window).

clear_screen :- write('\033[H\033[2J').

life(PatternName, Window) :-
    pattern(PatternName, Cells),
    life(Cells, Window).

life(Cells, Window) :-
    empty_world(Empty),
    world_add_cells(Empty, Cells, World),
    run_simulation(World, Window).