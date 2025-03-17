:- load_files(life).
% Carrega o arquivo `life.pl`, que contém a lógica do Jogo da Vida.

main(_) :-
% Define o predicado `main`, que é o ponto de entrada do programa.
% O argumento `_` indica que o predicado não precisa de um argumento específico.

  game_of_life([cell(4, 1), cell(4, 2), cell(4, 3)], world_window(3, 1, 3, 3)).
% Inicia o Jogo da Vida com:
% - Uma lista de células vivas iniciais: [cell(4, 1), cell(4, 2), cell(4, 3)].
% - Uma janela de visualização: world_window(3, 1, 3, 3), que define uma grade de 3x3 começando na posição (3, 1).