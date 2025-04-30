:- module(window, [
    init_gui/0,
    update_display/1,
    draw_cell/2
]).

:- use_module(library(pce)).

init_gui :-
    new(Main, window('Game of Life 5★', size(1200, 800))),
    new(Canvas, device(Main)),
    send(Canvas, size, size(1000, 700)),
    send(Main, open).

update_display(World) :-
    world{cells: Cells} = World,
    send(Canvas, clear),
    forall(member(cell(X,Y), Cells),
           draw_cell(X, Y)).

draw_cell(X, Y) :-
    new(Box, box(10,10)),
    send(Box, fill_pattern, color(black)),
    send(Canvas, display, Box, point(X*10, Y*10)).