:- begin_tests(patterns).

:- use_module(patterns).

test(match_glider_at_origin) :-
    Glider = [
        [0,1,0],
        [0,0,1],
        [1,1,1]
    ],
    match_glider(Glider, 0, 0).

test(match_glider_offset) :-
    Board = [
        [0,0,0,0,0],
        [0,0,1,0,0],
        [0,0,0,1,0],
        [0,1,1,1,0],
        [0,0,0,0,0]
    ],
    match_glider(Board, 1, 1).

test(match_blinker_vertical) :-
    Blinker = [
        [0,1,0],
        [0,1,0],
        [0,1,0]
    ],
    match_blinker(Blinker, 0, 1).

test(match_blinker_horizontal) :-
    Blinker = [
        [0,0,0],
        [1,1,1],
        [0,0,0]
    ],
    match_blinker(Blinker, 1, 0).

test(match_block) :-
    Block = [
        [1,1],
        [1,1]
    ],
    match_block(Block, 0, 0).

test(detect_multiple_patterns) :-
    Board = [
        [1,1,0,0,0],
        [1,1,0,1,0],
        [0,0,0,0,1],
        [0,1,0,1,1],
        [0,0,1,1,1]
    ],
    detect_patterns(Board, Patterns),
    member(block(0,0), Patterns),
    member(glider(2,3), Patterns).

:- end_tests(patterns).