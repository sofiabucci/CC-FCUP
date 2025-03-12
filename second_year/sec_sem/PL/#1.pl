/* graphs */

node(a).
node(b).
node(c).

vert(a, b).
vert(b, c).
vert(c, d).

vnd(X, Y) :- vert(X, Y).
vnd(X, Y) :- vert(Y, X).

path(X, Y) :- vert(X, Y).
path(X, Y) :- 
    vert(X, Z),
    path(Z, Y).


/* last element */

last([X], X).
last([_|Y], X) :- last(Y, X).


/* find element */

find(X, [X|_]).
find(X, [_|Y]) :- find(X, Y).

/* find element in position */

find(X, [X|_], 0).
find(X, [_|Y], N) :- 
    N > 0,
    N1 is N-1,
    find(X, Y, N1).


/*  */

