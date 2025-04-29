:- begin_tests(agent).

:- use_module(agent).

test(detect_glider_pattern) :-
    Glider = [
        [0,1,0],
        [0,0,1],
        [1,1,1]
    ],
    detect_patterns(Glider, Patterns),
    member(glider(0,0), Patterns).

test(suggest_isolation_action) :-
    Glider = [
        [0,1,0],
        [0,0,1],
        [1,1,1]
    ],
    suggest_action(Glider, Recommendations),
    member(recommendation(isolate_glider(0,0)), Recommendations).

test(analyze_state_stable) :-
    Board = [[1,1],
             [1,1]],
    analyze_state(Board, [Board], stable).

test(analyze_state_oscillating) :-
    Blinker1 = [[0,0,0],
                [1,1,1],
                [0,0,0]],
    Blinker2 = [[0,1,0],
                [0,1,0],
                [0,1,0]],
    analyze_state(Blinker1, [Blinker2, Blinker1], oscillating).

test(analyze_state_extinct) :-
    Board = [[0,0],
             [0,0]],
    analyze_state(Board, _, extinct).

test(analyze_state_unknown) :-
    Board = [[0,1],
             [1,0]],
    analyze_state(Board, [], unknown).

:- end_tests(agent).