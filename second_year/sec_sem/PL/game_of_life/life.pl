:- module(life, [start/0]).
:- use_module(library(pce)).
:- use_module(library(lists)).

% Configuração
grid_size(50, 50).
cell_size(10).  % Tamanho em pixels

% Estruturas de dados
:- dynamic world/1.
:- dynamic running/1.

% Inicialização do mundo
init_world :-
    retractall(world(_)),
    retractall(running(_)),
    assert(world(world{cells:[], generation:0, stats:stats{total:0, born:0, died:0, max_pop:0}, history:[]})),
    assert(running(false)).

% Main
start :-
    init_world,
    new(@window, picture('Game of Life')),
    send(@window, size, size(600, 600)),
    init_controls,
    init_grid,
    send(@window, open).

% Interface gráfica
init_grid :-
    cell_size(Size),
    grid_size(W, H),
    new(@grid, box(W*Size, H*Size)),
    send(@grid, fill_pattern, colour(white)),
    send(@window, display, @grid, point(50,50)).

init_controls :-
    new(@controls, dialog('Controls')),
    send(@controls, append, button('Start/Stop', message(@prolog, toggle_run))),
    send(@controls, append, button('Reset', message(@prolog, reset))),
    send(@controls, append, button('Glider', message(@prolog, insert_glider))),
    send(@window, display, @controls, point(50,5)).

% Controles
toggle_run :-
    running(Status),
    retract(running(_)),
    (Status == true -> 
        assert(running(false))
    ; 
        assert(running(true)),
        run
    ).

reset :-
    init_world,
    send(@grid, clear).

% Lógica principal
run :-
    running(true),
    get_world(World),
    next_generation(World, NewWorld),
    update_display(NewWorld),
    thread_send_message(main, update_done),
    delay(0.1),
    run.

get_world(World) :-
    world(World).

set_world(World) :-
    retract(world(_)),
    assert(world(World)).

next_generation(World, NewWorld) :-
    world{cells:Cells, generation:Gen, stats:Stats, history:Hist} = World,
    findall(Cell, (member(Cell, Cells), survive(2, 3, Cell, Cells)), Surviving),
    findall(Cell, (empty_neighbor(Cells, Cell), born(3, Cell, Cells)), NewBorn),
    append(Surviving, NewBorn, NewCells),
    NewGen is Gen + 1,
    update_stats(World, NewCells, NewStats),
    append(Hist, [Cells], NewHist),
    make_world(NewCells, NewGen, NewStats, NewHist, NewWorld).

% Regras do jogo
survive(Min, Max, Cell, Cells) :-
    count_neighbors(Cell, Cells, Count),
    between(Min, Max, Count).

born(Req, Cell, Cells) :-
    count_neighbors(Cell, Cells, Req).

count_neighbors(cell(X,Y), Cells, Count) :-
    findall(1, (
        between(-1, 1, DX),
        between(-1, 1, DY),
        (DX =\= 0 ; DY =\= 0),
        grid_size(W, H),
        NX is (X + DX) mod W,
        NY is (Y + DY) mod H,
        member(cell(NX, NY), Cells)
    ), Neighbors),
    length(Neighbors, Count).

empty_neighbor(Cells, cell(X,Y)) :-
    member(cell(CX,CY), Cells),
    between(-1, 1, DX),
    between(-1, 1, DY),
    (DX =\= 0 ; DY =\= 0),
    grid_size(W, H),
    X is (CX + DX) mod W,
    Y is (CY + DY) mod H,
    \+ member(cell(X,Y), Cells).

% Atualização de estatísticas
update_stats(World, NewCells, NewStats) :-
    world{cells:Cells, stats:Stats} = World,
    length(Cells, OldCount),
    length(NewCells, NewCount),
    Born is max(0, NewCount - OldCount),
    Died is max(0, OldCount - NewCount),
    NewStats = stats{
        total:NewCount,
        born:Stats.born + Born,
        died:Stats.died + Died,
        max_pop:max(Stats.max_pop, NewCount)
    }.

% Padrões conhecidos
insert_glider :-
    get_world(World),
    world{cells:Cells} = World,
    grid_size(W, H),
    X is W // 2, Y is H // 2,
    Glider = [cell(X+1,Y), cell(X,Y+1), cell(X+1,Y+1), cell(X+2,Y+1), cell(X+1,Y+2)],
    union(Cells, Glider, NewCells),
    set_world(World.put(cells, NewCells)),
    update_display(World.put(cells, NewCells)).

% Visualização
update_display(World) :-
    world{cells:Cells} = World,
    send(@grid, clear),
    cell_size(Size),
    forall(
        member(cell(X,Y), Cells),
        (send(@grid, display, box(Size,Size), point(X*Size, Y*Size),
         send(@box, fill_pattern, colour(black)))
    )).

% Utilitários
make_world(Cells, Gen, Stats, Hist, world{cells:Cells, generation:Gen, stats:Stats, history:Hist}).

delay(Seconds) :-
    get_time(Now),
    Finish is Now + Seconds,
    repeat,
    get_time(Now2),
    (Now2 >= Finish -> ! ; fail).