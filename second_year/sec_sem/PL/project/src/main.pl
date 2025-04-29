:- use_module(board).
:- use_module(rules).
:- use_module(io).
:- use_module(utils).
:- use_module(patterns).
:- use_module(agent).
:- use_module(logger).

%! start/0 is det.
%  Ponto de entrada principal do programa.
start :-
    init_logger,
    init_board(20, 20, Board),
    main_loop(Board, []).

%! main_loop(+Board, +History) is det.
%  Loop principal do jogo.
main_loop(Board, History) :-
    print_board(Board),
    log_stats(Board),
    display_menu,
    read_choice(Choice),
    handle_choice(Choice, Board, History).

read_choice(Choice) :-
    repeat,
    write('Escolha uma opção (1-8): '),
    read_number(Choice),
    between(1, 8, Choice),
    !.

handle_choice(1, Board, History) :-
    next_generation(Board, NewBoard),
    main_loop(NewBoard, [Board|History]).

handle_choice(2, Board, History) :-
    write('Quantas gerações? '),
    read_number(N),
    N > 0,
    run_generations(Board, N, FinalBoard, [Board|History], NewHistory),
    main_loop(FinalBoard, NewHistory).

handle_choice(3, _, History) :-
    list_patterns,
    write('Nome do padrão (sem .txt): '),
    read_line_to_string(user_input, Name),
    load_pattern_from_name(Name, Board),
    main_loop(Board, History).

handle_choice(4, Board, History) :-
    write('Nome para salvar: '),
    read_line_to_string(user_input, Name),
    save_board_from_name(Name, Board),
    main_loop(Board, History).

handle_choice(5, Board, History) :-
    analyze_state(Board, History, Status),
    format('Estado atual: ~w~n', [Status]),
    main_loop(Board, History).

handle_choice(6, Board, History) :-
    detect_patterns(Board, Patterns),
    (   Patterns == []
    ->  writeln('Nenhum padrão conhecido detectado.')
    ;   writeln('Padrões detectados:'),
        list_patterns(Patterns)
    ),
    main_loop(Board, History).

handle_choice(7, Board, History) :-
    display_help,
    main_loop(Board, History).

handle_choice(8, _, _) :-
    writeln('Até logo!'),
    close_logger.

% Auxiliares
load_pattern_from_name(Name, Board) :-
    atom_concat('patterns/', Name, PathBase),
    atom_concat(PathBase, '.txt', Path),
    (   load_pattern(Path, Board)
    ->  true
    ;   writeln('Erro ao carregar padrão. Usando tabuleiro vazio.'),
        board_size(Board, Rows, Cols),
        init_board(Rows, Cols, Board)
    ).

save_board_from_name(Name, Board) :-
    atom_concat('saved_states/', Name, PathBase),
    atom_concat(PathBase, '.txt', Path),
    (   save_board(Path, Board)
    ->  format('Tabuleiro salvo em ~w~n', [Path])
    ;   writeln('Erro ao salvar tabuleiro.')
    ).

list_patterns :-
    directory_files('patterns', Files),
    include(has_txt_extension, Files, PatternFiles),
    maplist(remove_extension, PatternFiles, Patterns),
    (   Patterns == []
    ->  writeln('Nenhum padrão disponível.')
    ;   writeln('Padrões disponíveis:'),
        maplist(writeln, Patterns)
    ).

has_txt_extension(File) :-
    sub_atom(File, _, 4, 0, '.txt').

remove_extension(File, Name) :-
    sub_atom(File, 0, _, 4, Name).

display_help :-
    writeln('Ajuda do Jogo da Vida:'),
    writeln('1. Próxima geração - Avança uma geração'),
    writeln('2. Executar N gerações - Avança múltiplas gerações de uma vez'),
    writeln('3. Carregar padrão - Carrega um padrão pré-definido'),
    writeln('4. Salvar estado - Salva o estado atual em um arquivo'),
    writeln('5. Analisar estado - Mostra informações sobre o estado atual'),
    writeln('6. Detetar padrões - Identifica padrões conhecidos no tabuleiro'),
    writeln('7. Ajuda - Mostra esta mensagem'),
    writeln('8. Sair - Termina o programa').

list_patterns(Patterns) :-
    maplist(describe_pattern, Patterns).

describe_pattern(glider(X,Y)) :-
    format('Glider na posição (~w,~w)~n', [X,Y]).
describe_pattern(blinker(X,Y)) :-
    format('Blinker na posição (~w,~w)~n', [X,Y]).
describe_pattern(block(X,Y)) :-
    format('Block na posição (~w,~w)~n', [X,Y]).