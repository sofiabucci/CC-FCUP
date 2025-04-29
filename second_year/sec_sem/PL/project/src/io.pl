:- module(io, [
    print_board/1,
    load_pattern/2,
    save_board/2,
    display_menu/0,
    read_coordinates/3
]).

:- use_module(board).
:- use_module(utils).

%! print_board(+Board) is det.
%  Exibe o tabuleiro no console com formato legível.
print_board(Board) :-
    board_size(Board, Rows, _),
    format('~`=t~72|~n'),
    format('   '),
    print_column_headers(Cols),
    print_board_rows(Board, 0),
    format('~`=t~72|~n').

print_column_headers(Cols) :-
    forall(between(0, Cols-1, Col),
           (Col < 10 -> format(' ~d ', Col) ; format('~d ', Col))),
    nl.

print_board_rows([], _).
print_board_rows([Row|Rows], N) :-
    format('~2d ', [N]),
    print_row(Row),
    N1 is N + 1,
    print_board_rows(Rows, N1).

print_row([]) :- nl.
print_row([0|T]) :- write(' . '), print_row(T).
print_row([1|T]) :- write(' ■ '), print_row(T).

%! load_pattern(+Path, -Board) is det.
%  Carrega um padrão de um arquivo texto.
load_pattern(Path, Board) :-
    exists_file(Path),
    read_lines(Path, Lines),
    parse_lines(Lines, Board).

read_lines(Path, Lines) :-
    setup_call_cleanup(
        open(Path, read, Stream),
        read_stream_to_lines(Stream, Lines),
        close(Stream)
    ).

read_stream_to_lines(Stream, Lines) :-
    read_line_to_string(Stream, Line),
    (   Line == end_of_file
    ->  Lines = []
    ;   Lines = [Line|MoreLines],
        read_stream_to_lines(Stream, MoreLines)
    ).

parse_lines(Lines, Board) :-
    maplist(parse_line, Lines, Board).

parse_line(Line, Row) :-
    string_chars(Line, Chars),
    maplist(char_to_cell, Chars, Row).

char_to_cell('O', 1).
char_to_cell('1', 1).
char_to_cell('.', 0).
char_to_cell(' ', 0).
char_to_cell(_, 0). % Qualquer outro caractere é considerado célula morta

%! save_board(+Path, +Board) is det.
%  Salva o tabuleiro em um arquivo texto.
save_board(Path, Board) :-
    setup_call_cleanup(
        open(Path, write, Stream),
        write_board(Stream, Board),
        close(Stream)
    ).

write_board(Stream, Board) :-
    maplist(write_row(Stream), Board).

write_row(Stream, Row) :-
    maplist(cell_to_char, Row, Chars),
    format(Stream, '~s~n', [Chars]).

cell_to_char(1, 'O').
cell_to_char(0, '.').

%! display_menu/0 is det.
%  Mostra o menu principal formatado.
display_menu :-
    format('~`=t~72|~n'),
    format('~tJOGO DA VIDA EM PROLOG~t~72|~n'),
    format('~`=t~72|~n'),
    writeln('1. Próxima geração'),
    writeln('2. Executar N gerações'),
    writeln('3. Carregar padrão'),
    writeln('4. Salvar estado'),
    writeln('5. Analisar estado'),
    writeln('6. Detetar padrões'),
    writeln('7. Ajuda'),
    writeln('8. Sair'),
    format('~`=t~72|~n').

%! read_coordinates(-X, -Y, +MaxX, +MaxY) is det.
%  Lê coordenadas do usuário com validação.
read_coordinates(X, Y, MaxX, MaxY) :-
    repeat,
    format('Digite a linha (0-~d): ', [MaxX]),
    read_number(X),
    X >= 0, X < MaxX,
    format('Digite a coluna (0-~d): ', [MaxY]),
    read_number(Y),
    Y >= 0, Y < MaxY,
    !.

read_number(N) :-
    catch(read_line_to_string(user_input, Line),
          _, 
          (writeln('Entrada inválida. Tente novamente.'), fail)),
    string_to_number(Line, N).

string_to_number(Str, N) :-
    number_string(N, Str),
    integer(N),
    N >= 0.