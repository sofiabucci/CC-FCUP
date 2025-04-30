:- module(config, [
    init_config/0,
    set_config/2,
    get_config/2
]).

:- dynamic config/2.

init_config :-
    set_config(grid_size, 60, 40),
    set_config(simulation_speed, 0.5).

set_config(Key, Value) :-
    retractall(config(Key, _)),
    assertz(config(Key, Value)).

get_config(Key, Value) :-
    config(Key, Value).