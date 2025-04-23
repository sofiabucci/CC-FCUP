:- module(web_service, [
    start_server/1
]).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_json)).

:- use_module(core).

% Arquivos estáticos
:- http_handler(root(.), http_reply_from_files('public', []), [prefix]).

% API Endpoints
:- http_handler('/api/professors', handle_professors, [methods([get, post])]).
:- http_handler('/api/courses', handle_courses, [methods([get, post])]).
:- http_handler('/api/rooms', handle_rooms, [methods([get, post])]).
:- http_handler('/api/timeslots', handle_time_slots, [methods([get, post])]).
:- http_handler('/api/schedule/generate', handle_generate_schedule, [method(post)]).
:- http_handler('/api/reset', handle_reset, [method(post)]).

% Inicia servidor
start_server(Port) :-
    init_system,
    http_server(http_dispatch, [port(Port)]),
    format('Server running at http://localhost:~w~n', [Port]).

% Handlers
handle_professors(Request) :-
    http_method(Request, Method),
    (Method = get -> get_professors_handler;
     Method = post -> post_professor_handler(Request)).

get_professors_handler :-
    get_professors(Professors),
    reply_json(Professors).

post_professor_handler(Request) :-
    http_read_json(Request, Json),
    add_professor(Json.name, Json.email, _),
    reply_json(_{status: success})).

% Handlers similares para courses, rooms, timeslots...

handle_generate_schedule(_Request) :-
    generate_schedule(Schedule),
    reply_json(_{status: success, schedule: Schedule})).

handle_reset(_Request) :-
    clear_data,
    load_sample_data,
    reply_json(_{status: success})).