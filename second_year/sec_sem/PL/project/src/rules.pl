:- module(rules, [
    next_generation/2,
    count_neighbors/4,
    cell_next_state/3
]).

:- use_module(board).
:- use_module(utils).



next_generation(CurrentBoard, NextBoard) :-
    board_size(CurrentBoard, Rows, Cols),
    (   Rows =:= 0 ; Cols =:= 0
    ->  NextBoard = []
    ;   findall(NewRow,
            (between(0, Rows-1, X),
             findall(NewCell,
                 (between(0, Cols-1, Y),
                 (get_cell(CurrentBoard, X, Y, CurrentState),
                  count_neighbors(CurrentBoard, X, Y, Neighbors),
                  cell_next_state(CurrentState, Neighbors, NewCell))),
             NewRow),
            NextBoard)
    ).



count_neighbors(Board, X, Y, Count) :-
    board_size(Board, Rows, Cols),
    findall(State,
            (between(-1, 1, DX),
             between(-1, 1, DY),
             (DX =\= 0 ; DY =\= 0), % Exclui a própria célula
             NX is (X + DX + Rows) mod Rows,
             NY is (Y + DY + Cols) mod Cols,
             get_cell(Board, NX, NY, State)),
            Neighbors),
    sum_list(Neighbors, Count).



cell_next_state(1, N, 1) :- N >= 2, N =< 3, !.
cell_next_state(0, 3, 1) :- !.
cell_next_state(_, _, 0).

:- begin_tests(rules).

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

:- end_tests(rules).