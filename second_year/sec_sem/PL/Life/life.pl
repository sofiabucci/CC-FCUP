% vim, please detect prolog
% Comentário para o editor Vim detectar que este arquivo é escrito em Prolog.

% Regras para o estado das células:
cell_new_state(dead_cell, 3, live_cell).
% Uma célula morta com exatamente 3 vizinhos vivos se torna viva.

cell_new_state(live_cell, Neighbours, live_cell) :-
  member(Neighbours, [2, 3]).
% Uma célula viva permanece viva se tiver 2 ou 3 vizinhos vivos.

cell_new_state(_, _, dead_cell).
% Em qualquer outro caso, a célula morre ou permanece morta.

% Definições para calcular células vizinhas:
north(cell(X, Y), cell(X, NY)) :- NY is Y - 1.
% Calcula a célula ao norte de (X, Y), que é (X, Y-1).

south(cell(X, Y), cell(X, NY)) :- NY is Y + 1.
% Calcula a célula ao sul de (X, Y), que é (X, Y+1).

west(cell(X, Y), cell(NX, Y)) :- NX is X - 1.
% Calcula a célula a oeste de (X, Y), que é (X-1, Y).

east(cell(X, Y), cell(NX, Y)) :- NX is X + 1.
% Calcula a célula a leste de (X, Y), que é (X+1, Y).

south_east(cell(X, Y), cell(NX, NY)) :-
  south(cell(X, Y), cell(SX, SY)),
  east(cell(SX, SY), cell(NX, NY)).
% Calcula a célula ao sudeste de (X, Y), que é (X+1, Y+1).

south_west(cell(X, Y), cell(NX, NY)) :-
  south(cell(X, Y), cell(SX, SY)),
  west(cell(SX, SY), cell(NX, NY)).
% Calcula a célula ao sudoeste de (X, Y), que é (X-1, Y+1).

north_west(cell(X, Y), cell(NX, NY)) :-
  north(cell(X, Y), cell(SX, SY)),
  west(cell(SX, SY), cell(NX, NY)).
% Calcula a célula ao noroeste de (X, Y), que é (X-1, Y-1).

north_east(cell(X, Y), cell(NX, NY)) :-
  north(cell(X, Y), cell(SX, SY)),
  east(cell(SX, SY), cell(NX, NY)).
% Calcula a célula ao nordeste de (X, Y), que é (X+1, Y-1).

neighbours(Cell, Neighbours) :-
  north_west(Cell, NW),
  north(Cell, N),
  north_east(Cell, NE),
  east(Cell, E),
  south_east(Cell, SE),
  south(Cell, S),
  south_west(Cell, SW),
  west(Cell, W),
  list_to_set([NW, N, NE, E, SE, S, SW, W], Neighbours).
% Calcula todos os vizinhos de uma célula, removendo duplicatas com list_to_set.

% Definições para manipulação do mundo:
empty_world(world([], [])).
% Define um mundo vazio, sem células vivas ou mortas.

world_add_cell(world(LiveCells, DeadCells), Cell, world(UnionLiveCells, NewDeadCells)) :-
  union([Cell], LiveCells, UnionLiveCells),
  neighbours(Cell, Neighbours),
  union(DeadCells, Neighbours, DeadCellsUnion),
  subtract(DeadCellsUnion, UnionLiveCells, NewDeadCells).
% Adiciona uma célula viva ao mundo, atualizando as listas de células vivas e mortas.

world_add_cells(World, [], World).
% Caso base para adicionar células: se a lista de células for vazia, o mundo permanece inalterado.

world_add_cells(World, [H|T], NewWorld) :-
  world_add_cell(World, H, IntermediateWorld),
  world_add_cells(IntermediateWorld, T, NewWorld).
% Adiciona uma lista de células ao mundo, uma por uma.

% Definições para evolução do mundo:
evolve(World, NextGenWorld) :-
  empty_world(EmptyWorld),
  evolve_util(World, World, EmptyWorld, NextGenWorld).
% Calcula a próxima geração do mundo, começando com um mundo vazio.

evolve_util(InitialWorld, world(LiveCells, DeadCells), PartialNextGenWorld, NextGenWorld) :-
  evolve_util_for_cells_set(live_cell, InitialWorld, LiveCells, PartialNextGenWorld, NextGenLiveEvolved),
  evolve_util_for_cells_set(dead_cell, InitialWorld, DeadCells, NextGenLiveEvolved, NextGenWorld).
% Evolui o mundo para a próxima geração, processando células vivas e mortas.

evolve_util_for_cells_set(_, _, [], NextGenWorld, NextGenWorld).
% Caso base para evolução: se não há mais células para processar, retorna o mundo evoluído.

evolve_util_for_cells_set(ExpectedCellState, InitialWorld, [Cell|LiveTail], PartialNextGenWorld, NextGenWorld) :-
  live_neighbours(InitialWorld, Cell, LiveNeighbours),
  length(LiveNeighbours, NLiveNeighbours),
  cell_new_state(ExpectedCellState, NLiveNeighbours, NewCellState),
  try_to_insert_cell_new_world(PartialNextGenWorld, Cell, NewCellState, LessPartialNextGenWorld),
  subtract([Cell|LiveTail], [Cell], LiveRemains),
  evolve_util_for_cells_set(ExpectedCellState, InitialWorld, LiveRemains, LessPartialNextGenWorld, NextGenWorld).
% Processa uma célula e atualiza o mundo parcialmente evoluído.

% Definições para visualização do mundo:
world_to_string(World, Window, WorldString) :-
  world_to_string_codes(World, Window, WorldArray),
  string_to_list(WorldString, WorldArray).
% Converte o mundo em uma string para exibição.

% Loop principal do jogo:
game_of_life_main_loop(World, Window) :-
  world_to_string(World, Window, WorldString),
  evolve(World, EvolvedWorld),
  sleep(1),
  write('\e[H\e[2J'),
  write(WorldString),
  game_of_life_main_loop(EvolvedWorld, Window).
% Loop principal que exibe o mundo, evolui para a próxima geração e repete o processo.

game_of_life(Cells, Window) :-
  empty_world(EmptyWorld),
  world_add_cells(EmptyWorld, Cells, NewWorld),
  game_of_life_main_loop(NewWorld, Window).
% Inicia o Jogo da Vida com uma lista de células vivas e uma janela de visualização.