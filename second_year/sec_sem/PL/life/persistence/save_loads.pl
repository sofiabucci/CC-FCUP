:- module(save_load, [
    save_world/1,
    load_world/1
]).

save_world(Filename) :-
    current_world(World),
    open(Filename, write, Stream),
    write(Stream, World),
    close(Stream).

load_world(Filename) :-
    open(Filename, read, Stream),
    read(Stream, World),
    close(Stream),
    retractall(current_world(_)),
    assertz(current_world(World)).