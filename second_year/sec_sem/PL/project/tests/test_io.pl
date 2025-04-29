:- begin_tests(io).

:- use_module(io).

setup :-
    ensure_directory('test_patterns'),
    open('test_patterns/glider.txt', write, Stream),
    writeln(Stream, '.O.'),
    writeln(Stream, '..O'),
    writeln(Stream, 'OOO'),
    close(Stream).

cleanup :-
    delete_file('test_patterns/glider.txt'),
    delete_directory('test_patterns').

test(load_pattern, [setup, cleanup]) :-
    load_pattern('test_patterns/glider.txt', Board),
    Board == [
        [0,1,0],
        [0,0,1],
        [1,1,1]
    ].

test(save_and_load_roundtrip, [setup(setup), cleanup(cleanup)]) :-
    Original = [
        [1,0,1],
        [0,1,0],
        [1,0,1]
    ],
    save_board('test_patterns/test.txt', Original),
    load_pattern('test_patterns/test.txt', Loaded),
    Original == Loaded.

test(print_board_output) :-
    Board = [[1,0],
             [0,1]],
    with_output_to(string(Output), print_board(Board)),
    sub_string(Output, _, _, _, "■"), % Verifica se contém o caractere de célula viva
    sub_string(Output, _, _, _, "0").  % Verifica se contém os cabeçalhos

% Teste para read_coordinates seria mais complexo e exigiria mock de input
% Seria melhor implementado com um framework de teste mais avançado

:- end_tests(io).