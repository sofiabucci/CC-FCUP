:- module(main, [main/0]).

:- use_module(core/rules).
:- use_module(core/evolution).
:- use_module(core/boundaries).
:- use_module(core/statistics).
:- use_module(gui/window).
:- use_module(patterns/library).
:- use_module(persistence/save_load).
:- use_module(utils/config).

main :-
    config:init_config,
    window:create_window.
