:- begin_tests(utils).

:- use_module(utils).

test(run_generations_zero) :-
    Board = [[1,1],
             [1,1]],
    run_generations(Board, 0, FinalBoard, [], History),
    Board == FinalBoard,
    History == [].

test(run_generations_multiple) :-
    Blinker1 = [[0,0,0],
                [1,1,1],
                [0,0,0]],
    Blinker2 = [[0,1,0],
                [0,1,0],
                [0,1,0]],
    run_generations(Blinker1, 2, FinalBoard, [], History),
    Blinker1 == FinalBoard,
    length(History, 2).

test(count_alive_empty) :-
    Board = [[0,0],
             [0,0]],
    count_alive(Board, 0).

test(count_alive_full) :-
    Board = [[1,1],
             [1,1]],
    count_alive(Board, 4).

test(board_density) :-
    Board = [[1,0],
             [0,1]],
    board_density(Board, 50.0).

test(replace_in_list) :-
    replace_in_list(1, x, [a,b,c,d], [a,x,c,d]).

test(string_to_number_valid) :-
    string_to_number("42", 42).

test(string_to_number_invalid, [fail]) :-
    string_to_number("abc", _).

:- end_tests(utils).