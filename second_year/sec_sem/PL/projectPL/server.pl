:- use_module(prolog/web_service).

:- initialization
    start_server(3000).

:- multifile
    http:location/3.
:- dynamic
    http:location/3.

http:location(static, root(.), []).