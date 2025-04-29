:- module(utils, [
    run_generations/5,
    count_alive/2,
    board_density/2,
    replace_in_list/4,
    read_number/1,
    string_to_number/2
]).

:- use_module(board).
:- use_module(rules).

%! run_generations(+Board, +N, -FinalBoard, +History, -FinalHistory) is det.
%  Executa N gerações do jogo, mantendo o histórico.
run_generations(Board, 0, Board, History, History) :- !.
run_generations(Board, N, FinalBoard, History, FinalHistory) :-
    N > 0,
    next_generation(Board, NextBoard),
    N1 is N - 1,
    run_generations(NextBoard, N1, FinalBoard, [Board|History], FinalHistory).

%! count_alive(+Board, -Count) is det.
%  Conta o número de células vivas no tabuleiro.
count_alive(Board, Count) :-
    flatten(Board, Cells),
    include(=(1), Cells, Alive),
    length(Alive, Count).

%! board_density(+Board, -Density) is det.
%  Calcula a densidade (porcentagem de células vivas).
board_density(Board, Density) :-
    board_size(Board, Rows, Cols),
    TotalCells is Rows * Cols,
    (   TotalCells =:= 0
    ->  Density = 0.0
    ;   count_alive(Board, Alive),
        Density is (Alive / TotalCells) * 100
    ).

%! replace_in_list(+Index, +Value, +List, -NewList) is det.
%  Substitui o elemento em Index por Value na List.
replace_in_list(0, Value, [_|T], [Value|T]).
replace_in_list(Index, Value, [H|T], [H|NewT]) :-
    Index > 0,
    Index1 is Index - 1,
    replace_in_list(Index1, Value, T, NewT).

% Helpers para leitura de entrada
read_number(N) :-
    read_line_to_string(user_input, Line),
    string_to_number(Line, N).

string_to_number(Str, N) :-
    string(Str),
    number_string(N, Str),
    integer(N),
    N >= 0.