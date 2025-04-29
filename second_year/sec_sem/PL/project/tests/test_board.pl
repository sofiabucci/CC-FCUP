:- begin_tests(board).

:- use_module(board).

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

test(copy_board_creates_independent_copy) :-
    init_board(2, 2, B0),
    set_cell(B0, 0, 0, 1, B1),
    copy_board(B1, B2),
    set_cell(B2, 0, 0, 0, B3),
    get_cell(B1, 0, 0, 1), % Original não mudou
    get_cell(B3, 0, 0, 0).

test(clear_board_keeps_dimensions) :-
    init_board(3, 3, B0),
    set_cell(B0, 1, 1, 1, B1),
    clear_board(B1, B2),
    board_size(B2, 3, 3),
    get_cell(B2, 1, 1, 0).

:- end_tests(board).