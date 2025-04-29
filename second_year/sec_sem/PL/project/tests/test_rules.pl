:- begin_tests(rules).

:- use_module(rules).

test(underpopulation_cell_dies) :-
    Board = [[0,0,0],
             [0,1,0],
             [0,0,0]],
    next_generation(Board, Next),
    get_cell(Next, 1, 1, 0).

test(reproduction_cell_born) :-
    Board = [[1,0,1],
             [0,0,0],
             [1,0,0]],
    next_generation(Board, Next),
    get_cell(Next, 1, 1, 1).

test(block_is_stable) :-
    Block = [[1,1],
             [1,1]],
    next_generation(Block, Block).

test(blinker_oscillates) :-
    Blinker1 = [[0,0,0],
                [1,1,1],
                [0,0,0]],
    Blinker2 = [[0,1,0],
                [0,1,0],
                [0,1,0]],
    next_generation(Blinker1, Blinker2),
    next_generation(Blinker2, Blinker1).

test(count_neighbors_for_corner_cell) :-
    Board = [[1,0,1],
             [0,1,0],
             [1,0,0]],
    count_neighbors(Board, 0, 0, Count),
    Count =:= 2.

test(count_neighbors_with_wrapping) :-
    Board = [[1,0,0],
             [0,0,0],
             [0,0,1]],
    count_neighbors(Board, 0, 0, Count),
    Count =:= 1. % A célula (2,2) é vizinha de (0,0) por wrapping

test(empty_board_remains_empty) :-
    Board = [],
    next_generation(Board, Next),
    Next == [].

:- end_tests(rules).