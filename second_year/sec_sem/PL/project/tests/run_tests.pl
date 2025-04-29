:- module(tests, []).

:- use_module(library(plunit)).

:- begin_tests(all).

:- include('test_board.pl').
:- include('test_rules.pl').
:- include('test_agent.pl').
:- include('test_patterns.pl').
:- include('test_util.pl').
:- include('test_io.pl').

:- end_tests(all).

% Para executar todos os testes:
% run_tests :- run_tests(all).