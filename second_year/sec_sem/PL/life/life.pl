:- module(life, [
    start/0,
    run_simulation/2,
    set_rule/2,
    set_boundary/1,
    save_world/1,
    load_world/1,
    detect_patterns/0,
    generate_random/1
]).

:- use_module(core/rules).
:- use_module(core/evolution).
:- use_module(core/boundaries).
:- use_module(core/statistics).
:- use_module(gui/window).
:- use_module(gui/controls).
:- use_module(patterns/library).
:- use_module(patterns/detection).
:- use_module(persistence/save_load).
:- use_module(persistence/export).
:- use_module(utils/helpers).
:- use_module(utils/config).

% Inicialização do sistema
start :-
    init_config,
    init_gui,
    init_simulation.

% Controle principal da simulação
run_simulation(PatternName, Generations) :-
    load_pattern(PatternName, Cells),
    create_world(Cells, World),
    simulation_loop(World, Generations).

% Configuração de regras
set_rule(Type, Values) :-
    validate_rule_type(Type),
    validate_values(Values),
    update_rules(Type, Values).