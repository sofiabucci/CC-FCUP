:- module(life_tests, []).
:- use_module(life).
:- use_module(library(plunit)).

:- begin_tests(life).

test(empty_world) :-
    empty_world(World),
    World.live_cells == [],
    World.generation == 0.

test(rule_application) :-
    set_rule(birth, [3]),
    set_rule(survival, [2,3]),
    cell_new_state(dead_cell, 3, live_cell),
    cell_new_state(live_cell, 2, live_cell),
    \+ cell_new_state(live_cell, 4, live_cell).

test(neighbor_count) :-
    World = world{live_cells:[cell(1,1), cell(1,2), cell(2,1)]},
    count_neighbors(cell(2,2), World.live_cells, 3).

test(evolution) :-
    World = world{live_cells:[cell(1,1), cell(1,2), cell(2,1)]},
    evolve(World, NextWorld),
    member(cell(2,2), NextWorld.live_cells).

test(pattern_loading) :-
    pattern(glider, Cells),
    length(Cells, 5),
    member(cell(1,0), Cells).

:- end_tests(life).