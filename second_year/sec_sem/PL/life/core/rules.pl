:- module(rules, [
    set_rule/2,
    apply_rules/3,
    validate_rules/2,
    current_rules/1
]).

:- dynamic rule/2.

% Regras padrão (Conway)
rule(birth, [3]).
rule(survival, [2,3]).

apply_rules(live, N, live) :-
    rule(survival, S),
    member(N, S).
apply_rules(dead, N, live) :-
    rule(birth, B),
    member(N, B).
apply_rules(_, _, dead).

validate_rules(Type, Values) :-
    member(Type, [birth, survival]),
    is_list(Values),
    maplist(integer, Values).