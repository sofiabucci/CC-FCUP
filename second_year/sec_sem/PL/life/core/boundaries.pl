:- module(boundaries, [
    set_boundary_type/1,
    neighbor/2
]).

:- dynamic boundary_type/1.
boundary_type(toroidal). % Padrão

% Toroidal (bordas conectadas)
neighbor(cell(X,Y), cell(XN,YN)) :-
    boundary_type(toroidal),
    config(grid_size, (W,H)),
    between(-1, 1, DX), between(-1, 1, DY),
    (DX =\= 0 ; DY =\= 0),
    XN is (X + DX) mod W,
    YN is (Y + DY) mod H.

% Finito (bordas sólidas)
neighbor(cell(X,Y), cell(XN,YN)) :-
    boundary_type(finite),
    config(grid_size, (W,H)),
    between(-1, 1, DX), between(-1, 1, DY),
    (DX =\= 0 ; DY =\= 0),
    XN is X + DX, YN is Y + DY,
    XN >= 0, XN < W, YN >= 0, YN < H.