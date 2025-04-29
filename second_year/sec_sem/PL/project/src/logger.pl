:- module(logger, [
    init_logger/0,
    log_stats/1,
    close_logger/0
]).

:- dynamic log_stream/1.



init_logger :-
    (   exists_directory('logs')
    ;   make_directory('logs')
    ),
    open('logs/game_log.log', append, Stream, [encoding(utf8)]),
    retractall(log_stream(_)),
    asserta(log_stream(Stream)),
    get_time(Time),
    stamp_date_time(Time, DateTime, local),
    format(Stream, '~n~`=t~72|~n', []),
    format(Stream, 'Nova sessão iniciada em ~w~n', [DateTime]),
    format(Stream, '~`=t~72|~n~n', []).



log_stats(Board) :-
    log_stream(Stream),
    get_time(Time),
    stamp_date_time(Time, DateTime, local),
    count_alive(Board, Count),
    board_density(Board, Density),
    format(Stream, '[~w] Células vivas: ~w (~1f%%)~n',
           [DateTime, Count, Density]),
    flush_output(Stream).



close_logger :-
    (   log_stream(Stream)
    ->  get_time(Time),
        stamp_date_time(Time, DateTime, local),
        format(Stream, '~nSessão encerrada em ~w~n', [DateTime]),
        close(Stream),
        retractall(log_stream(_))
    ;   true
    ).