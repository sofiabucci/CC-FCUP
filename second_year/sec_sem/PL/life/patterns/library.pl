:- module(library, [
    pattern/2,
    load_pattern/2,
    known_patterns/1
]).

% Padrões clássicos
pattern(glider, [cell(1,0), cell(2,1), cell(0,2), cell(1,2), cell(2,2)]).
pattern(blinker, [cell(1,0), cell(1,1), cell(1,2)]).
pattern(gosper_glider_gun, [
    cell(1,5), cell(2,5), cell(1,6), cell(2,6),
    % ... (células completas)
]).

% Carrega padrão pelo nome
load_pattern(Name, Cells) :-
    pattern(Name, Cells).