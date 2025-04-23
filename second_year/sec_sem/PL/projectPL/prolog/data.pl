:- module(data, [
    add_professor/3,
    get_all_professors/1,
    add_course/4,
    get_all_courses/1,
    add_room/3,
    get_all_rooms/1,
    add_time_slot/3,
    get_all_time_slots/1,
    set_availability/2,
    generate_schedule/1,
    clear_all_data/0,
    load_sample_data/0
]).

:- dynamic professor/3.
:- dynamic course/4.
:- dynamic room/3.
:- dynamic time_slot/4.
:- dynamic availability/2.
:- dynamic scheduled_class/4.

% Limpeza de dados
clear_all_data :-
    retractall(professor(_, _, _)),
    retractall(course(_, _, _, _)),
    retractall(room(_, _, _)),
    retractall(time_slot(_, _, _, _)),
    retractall(availability(_, _)),
    retractall(scheduled_class(_, _, _, _)).

% Dados de exemplo
load_sample_data :-
    % Professores
    add_professor('Dr. Ana Silva', 'ana.silva@university.edu', 1),
    add_professor('Prof. Carlos Santos', 'carlos.santos@university.edu', 2),
    
    % Cursos
    add_course('CS101', 'Programação I', 4, []),
    add_course('CS201', 'Estruturas de Dados', 4, ['CS101']),
    
    % Salas
    add_room('101', 'Sala de Aula', 30),
    add_room('201', 'Laboratório', 20),
    
    % Horários
    add_time_slot('Segunda', '08:00', '10:00'),
    add_time_slot('Segunda', '10:00', '12:00'),
    
    % Disponibilidades
    set_availability(1, 1),
    set_availability(1, 2),
    set_availability(2, 1).

% Professores
add_professor(Name, Email, Id) :-
    assertz(professor(Id, Name, Email)).

get_all_professors(Professors) :-
    findall(
        _{id: Id, name: Name, email: Email},
        professor(Id, Name, Email),
        Professors
    ).

% Cursos
add_course(Code, Name, Credits, Prerequisites) :-
    assertz(course(Code, Name, Credits, Prerequisites)).

get_all_courses(Courses) :-
    findall(
        _{code: Code, name: Name, credits: Credits, prerequisites: Prereqs},
        course(Code, Name, Credits, Prereqs),
        Courses
    ).

% Salas
add_room(Number, Type, Capacity) :-
    assertz(room(Number, Type, Capacity)).

get_all_rooms(Rooms) :-
    findall(
        _{number: Number, type: Type, capacity: Capacity},
        room(Number, Type, Capacity),
        Rooms
    ).

% Horários
add_time_slot(Day, StartTime, EndTime) :-
    (time_slot(Id, _, _, _) ->
        NextId is Id + 1 ;
        NextId = 1),
    assertz(time_slot(NextId, Day, StartTime, EndTime)).

get_all_time_slots(TimeSlots) :-
    findall(
        _{id: Id, day: Day, start_time: Start, end_time: End},
        time_slot(Id, Day, Start, End),
        TimeSlots
    ).

% Disponibilidade
set_availability(ProfessorId, TimeSlotId) :-
    assertz(availability(ProfessorId, TimeSlotId)).

% Geração de horários
generate_schedule(Schedule) :-
    findall(Class, (
        course(Code, _, Credits, _),
        generate_course_schedule(Code, Credits, Class)
    ), Schedule).

generate_course_schedule(Code, Credits, Classes) :-
    findall(Class, (
        between(1, Credits, _),
        find_available_slot(Code, Class)
    ), Classes).

find_available_slot(Code, class(Code, ProfessorId, Room, TimeSlotId)) :-
    professor(ProfessorId, _, _),
    availability(ProfessorId, TimeSlotId),
    room(Room, _, _),
    time_slot(TimeSlotId, _, _, _),
    \+ conflicting_class(ProfessorId, Room, TimeSlotId).

conflicting_class(ProfessorId, Room, TimeSlotId) :-
    scheduled_class(_, _, ProfessorId, TimeSlotId);
    scheduled_class(_, _, Room, TimeSlotId).