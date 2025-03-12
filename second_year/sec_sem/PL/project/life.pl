% Representação de células (1 = viva, 0 = morta)
% Tabuleiro representado como uma lista de listas.

% Contagem de vizinhos vivos em uma posição (X, Y)
count_neighbors(Board, X, Y, Count) :-
    findall(1, (
        neighbor(X, Y, NX, NY),           % Encontra posições vizinhas
        nth0(NY, Board, Row),             % Acha a linha correspondente
        nth0(NX, Row, 1)                  % Confere se a célula vizinha está viva
    ), Neighbors),
    length(Neighbors, Count).

% Definição das posições vizinhas válidas
neighbor(X, Y, NX, NY) :-
    DX in -1..1, DY in -1..1,            % Variações nas coordenadas (-1, 0, 1)
    (DX \= 0 ; DY \= 0),                 % Evita contar a própria célula
    NX #= X + DX, NY #= Y + DY.          % Calcula novas coordenadas

% Regras do Jogo da Vida: Evolução de uma célula
next_state(Board, X, Y, NewState) :-
    count_neighbors(Board, X, Y, Count),
    nth0(Y, Board, Row), nth0(X, Row, State),
    (
        (State = 1, (Count = 2; Count = 3) -> NewState = 1; NewState = 0);
        (State = 0, Count = 3 -> NewState = 1; NewState = 0)
    ).

% Geração do próximo tabuleiro
next_generation(Board, NewBoard) :-
    findall(NewRow, (
        nth0(Y, Board, Row),
        findall(NewState, (
            nth0(X, Row, _),
            next_state(Board, X, Y, NewState)
        ), NewRow)
    ), NewBoard).

% Exibição do tabuleiro
print_board([]).
print_board([Row | Rest]) :-
    print_row(Row),
    nl,
    print_board(Rest).

print_row([]).
print_row([Cell | Rest]) :-
    (Cell = 1 -> write('█ ') ; write('. ')), % Representação visual
    print_row(Rest).

% Rodar o Jogo da Vida por N gerações
run_life(Board, 0) :- print_board(Board).
run_life(Board, N) :-
    N > 0,
    print_board(Board),
    nl,
    next_generation(Board, NextBoard),
    N1 is N - 1,
    run_life(NextBoard, N1).

% Tabuleiro inicial de teste
start :-
    Board = [
        [0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0],
        [1, 1, 1, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
    ],
    run_life(Board, 10).  % Simula 10 gerações
