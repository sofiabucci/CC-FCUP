:- module(evolution, [
    evolve/2,
    next_generation/2,
    count_neighbors/3
]).

evolve(World, NewWorld) :-
    world{cells: Cells} = World,
    findall(Cell, (
        (member(Cell, Cells) -> State = live ; State = dead),
        count_neighbors(Cell, Cells, N),
        apply_rules(State, N, NewState),
        NewState == live
    ), NewCells),
    update_statistics(World, NewCells, NewWorld).

count_neighbors(Cell, LiveCells, Count) :-
    findall(N, (neighbor(Cell, N), member(N, LiveCells)), Neighbors),
    length(Neighbors, Count).