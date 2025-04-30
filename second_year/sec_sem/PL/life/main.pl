:- module(main, [main/0]).
:- use_module(life).
:- use_module(life_tests).

main :-
    print_welcome,
    print_commands.

print_welcome :-
    format('=== LIFE - Game of Life in Prolog ===~n~n'),
    format('Uma implementação avançada do Jogo da Vida de Conway~n~n').

print_commands :-
    format('Comandos disponíveis:~n~n'),
    format('1. Iniciar simulação:~n'),
    format('   ?- life(glider, world_window(40,40)).~n'),
    format('   ?- life([cell(0,0), cell(1,1)], world_window(20,20)).~n~n'),
    format('2. Alterar regras:~n'),
    format('   ?- set_rule(birth, [3,6]). % HighLife~n~n'),
    format('3. Executar testes:~n'),
    format('   ?- run_tests.~n~n'),
    format('4. Padrões disponíveis: glider, blinker~n~n').

:- initialization(main, main).