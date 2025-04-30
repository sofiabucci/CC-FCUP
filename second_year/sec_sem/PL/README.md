LIFE - Game of Life em Prolog
================================

Uma implementação avançada do Jogo da Vida de Conway em Prolog com recursos para:
- Simulações customizáveis
- Regras modificáveis
- Visualização em tempo real
- Testes unitários integrados

📁 Estrutura do Projeto
-----------------------
1. `life.pl`        - Lógica principal do jogo
2. `life_tests.pl`  - Testes unitários
3. `main.pl`       - Interface do usuário

⚙️ Requisitos
------------
- SWI-Prolog (versão 8.x ou superior)
- Módulos: clpfd, record, plunit

🚀 Como Executar
---------------
1. Inicie o SWI-Prolog
2. Carregue o arquivo principal:
   ?- [main].
3. Siga as instruções do menu

🎮 Comandos Principais
---------------------
• Iniciar simulação:
  ?- life(glider, world_window(40,40)).
  ?- life([cell(0,0), cell(1,1)], world_window(20,20)).

• Alterar regras:
  ?- set_rule(birth, [3,6]).  % Exemplo: HighLife (B36/S23)

• Executar testes:
  ?- run_tests.

• Ajuda:
  ?- main.

🔧 Funcionalidades
-----------------
✔️ Regras customizáveis (notação B/S)
✔️ Padrões pré-definidos (glider, blinker)
✔️ Estatísticas em tempo real:
   - Células vivas
   - Nascimentos/mortes por geração
✔️ Visualização ajustável
✔️ Sistema de testes robusto

📊 Padrões Disponíveis
----------------------
• glider:
  [cell(1,0), cell(2,1), cell(0,2), cell(1,2), cell(2,2)]

• blinker:
  [cell(1,0), cell(1,1), cell(1,2)]

🛠️ Como Adicionar Padrões
-------------------------
1. Edite life.pl
2. Adicione novas cláusulas pattern/2:
   pattern(nome_do_padrao, [lista_de_celulas]).

🧪 Testes Unitários
------------------
Cobertura de testes:
✓ Regras do jogo
✓ Evolução do mundo
✓ Contagem de vizinhos
✓ Carga de padrões

Para executar todos os testes:
?- run_tests.

📝 Exemplo Completo
------------------
1. Iniciar com regras personalizadas:
   ?- set_rule(birth, [3,6]).
   ?- set_rule(survival, [2,3]).
   ?- life(glider, world_window(30,30)).

2. Monitorar estatísticas:
   (Serão exibidas automaticamente a cada geração)

🔄 Controles
-----------
• Pressione Ctrl+C para interromper
• Use sleep/1 em run_simulation/2 para ajustar velocidade

📈 Melhorias Futuras
-------------------
- [ ] Grid toroidal (bordas conectadas)
- [ ] Interface gráfica
- [ ] Controle interativo (pausa, passo-a-passo)
- [ ] Importação/exportação de padrões

📚 Referências
-------------
• Conway's Game of Life (1970)
• The Art of Prolog - Sterling & Shapiro
• Documentação SWI-Prolog
