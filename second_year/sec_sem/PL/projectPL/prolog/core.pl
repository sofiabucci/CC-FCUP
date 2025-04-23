:- module(core, [
    init_system/0,
    add_professor/3,
    get_professors/1,
    add_course/4,
    get_courses/1,
    add_room/3,
    get_rooms/1,
    add_time_slot/3,
    get_time_slots/1,
    set_availability/2,
    generate_schedule/1,
    clear_data/0
]).

:- use_module(library(http/http_json)).
:- use_module(data).

% Inicialização
init_system :-
    clear_all_data,
    load_sample_data.

clear_all_data :-
    data:clear_all_data.

load_sample_data :-
    data:load_sample_data.

% Professores
add_professor(Name, Email, Id) :-
    data:add_professor(Name, Email, Id).

get_professors(Professors) :-
    data:get_all_professors(Professors).

% Cursos
add_course(Code, Name, Credits, Prerequisites) :-
    data:add_course(Code, Name, Credits, Prerequisites).

get_courses(Courses) :-
    data:get_all_courses(Courses).

% Salas
add_room(Number, Type, Capacity) :-
    data:add_room(Number, Type, Capacity).

get_rooms(Rooms) :-
    data:get_all_rooms(Rooms).

% Horários
add_time_slot(Day, StartTime, EndTime) :-
    data:add_time_slot(Day, StartTime, EndTime).

get_time_slots(TimeSlots) :-
    data:get_all_time_slots(TimeSlots).

% Disponibilidade
set_availability(ProfessorId, TimeSlotId) :-
    data:set_availability(ProfessorId, TimeSlotId).

% Geração de horário
generate_schedule(Schedule) :-
    data:generate_schedule(Schedule).

% Limpeza
clear_data :-
    data:clear_all_data.