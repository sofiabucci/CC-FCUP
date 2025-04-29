:- module(board, [
    init_board/3,
    set_cell/5,
    get_cell/4,
    board_size/3,
    copy_board/2,
    clear_board/2
]).

:- use_module(utils).


init_board(Rows, Cols, Board) :-
    must_be(positive_integer, Rows),
    must_be(positive_integer, Cols),
    length(Row, Cols),
    maplist(=(0), Row),
    length(Board, Rows),
    maplist(copy_term(Row), Board).



set_cell(Board, Row, Col, Value, NewBoard) :-
    board_size(Board, Rows, Cols),
    Row >= 0, Row < Rows,
    Col >= 0, Col < Cols,
    nth0(Row, Board, OldRow),
    replace_in_list(Col, Value, OldRow, NewRow),
    replace_in_list(Row, NewRow, Board, NewBoard).


get_cell(Board, Row, Col, Value) :-
    board_size(Board, Rows, Cols),
    Row >= 0, Row < Rows,
    Col >= 0, Col < Cols,
    nth0(Row, Board, TheRow),
    nth0(Col, TheRow, Value).



board_size(Board, Rows, Cols) :-
    length(Board, Rows),
    (   Rows > 0 -> nth0(0, Board, FirstRow), length(FirstRow, Cols)
    ;   Cols = 0
    ).


copy_board(Original, Copy) :-
    maplist(copy_row, Original, Copy).
copy_row(Row, Copy) :- copy_term(Row, Copy).


clear_board(Board, ClearedBoard) :-
    board_size(Board, Rows, Cols),
    init_board(Rows, Cols, ClearedBoard).


replace_in_list(Index, Value, List, NewList) :-
    nth0(Index, List, _, Temp),
    nth0(Index, NewList, Value, Temp).

:- begin_tests(board).

test(init_board_creates_correct_size) :-
    init_board(3, 4, Board),
    board_size(Board, 3, 4),
    flatten(Board, Cells),
    maplist(=(0), Cells).

test(set_and_get_cell_work) :-
    init_board(3, 3, B0),
    set_cell(B0, 1, 1, 1, B1),
    get_cell(B1, 1, 1, 1).

test(set_cell_fails_silently_for_invalid_coords, [fail]) :-
    init_board(2, 2, B0),
    set_cell(B0, 3, 0, 1, _).

test(board_size_for_empty_board) :-
    board_size([], 0, 0).

:- end_tests(board).