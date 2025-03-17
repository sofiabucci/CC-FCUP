#!/bin/bash
# Define o interpretador do script como bash.

swipl -q -g main ./main.pl
# Executa o interpretador Prolog (swipl) com as seguintes opções:
# -q: Modo silencioso (não exibe a mensagem de boas-vindas do Prolog).
# -g main: Especifica que o Prolog deve executar o predicado `main`.
# ./main.pl: Carrega o arquivo `main.pl` para execução.