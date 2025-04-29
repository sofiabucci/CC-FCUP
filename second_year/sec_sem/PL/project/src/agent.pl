:- module(agent, [suggest_action/2, detect_patterns/2, analyze_state/3]).

:- use_module(board).
:- use_module(rules).
:- use_module(patterns).


analyze_state(Board, History, Status) :-
    (   Board == [] -> Status = extinct
    ;   History == [] -> Status = unknown
    ;   Board == History -> Status = stable
    ;   member(Board, History) -> Status = oscillating
    ;   Status = evolving
    ).


suggest_action(Board, Recommendations) :-
    detect_patterns(Board, Patterns),
    findall(Recommendation, 
            (member(Pattern, Patterns),
             pattern_recommendation(Pattern, Recommendation)),
    (   Recommendations == [] -> Recommendations = [recommendation(monitor)]
    ;   true
    ).

pattern_recommendation(glider(X,Y), recommendation(isolate_glider(X,Y))).
pattern_recommendation(blinker(X,Y), recommendation(monitor_blinker(X,Y))).
pattern_recommendation(block(X,Y), recommendation(no_action_needed)).


:- begin_tests(agent).

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

:- end_tests(agent).