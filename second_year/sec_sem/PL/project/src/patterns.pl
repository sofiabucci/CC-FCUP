:- module(patterns, [detect_patterns/2, match_glider/3, match_blinker/3, match_block/3]).

:- use_module(board).


detect_patterns(Board, Patterns) :-
    findall(Pattern, 
            (detected_pattern(Board, Pattern)), 
            Patterns).

detected_pattern(Board, glider(X,Y)) :-
    match_glider(Board, X, Y).
detected_pattern(Board, blinker(X,Y)) :-
    match_blinker(Board, X, Y).
detected_pattern(Board, block(X,Y)) :-
    match_block(Board, X, Y).


match_glider(Board, X, Y) :-
    subgrid(Board, X, Y, 3, 3, [
        [0,1,0],
        [0,0,1],
        [1,1,1]
    ]).

match_blinker(Board, X, Y) :-
    subgrid(Board, X, Y, 3, 1, [
        [1],
        [1],
        [1]
    ]).

match_block(Board, X, Y) :-
    subgrid(Board, X, Y, 2, 2, [
        [1,1],
        [1,1]
    ]).


subgrid(Board, X, Y, W, H, Pattern) :-
    board_size(Board, Rows, Cols),
    between(0, Rows-H, X),
    between(0, Cols-W, Y),
    extract_subgrid(Board, X, Y, W, H, Pattern).

extract_subgrid(Board, X, Y, W, H, Subgrid) :-
    findall(Row,
        (between(0, H-1, DX),
         RowY is X + DX,
         nth0(RowY, Board, FullRow),
         extract_row(FullRow, Y, W, Row)
        ), Subgrid).

extract_row(Row, Start, Length, Subrow) :-
    findall(Element,
        (between(0, Length-1, DY),
         ColX is Start + DY,
         nth0(ColX, Row, Element)
        ), Subrow).