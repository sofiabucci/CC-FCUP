menu = ["0 - terminar",
    "1 - carregar os dados a partir de um ficheiro",
    "2 - codigo de estudante dado o nome",
    "3 - disciplinas de estudante dado o codigo" ]
def escolhe_menu():
    for s in menu:
        print(s)
    opcao = int(input("Indicar opçao: "))
    while opcao < 0 or opcao >= len(menu):
        opcao = int(input("Opçao invalida. Indicar opçao: "))
    return opcao
def interface():
    opcao = escolhe_menu()
    while opcao != 0:
        if opcao == 1:
            ficheiro = input("Ficheiro de dados? ")
            disciplinas, alunos = ler_dados(fich)
        elif opcao == 2:
            nome = input("Nome do estudante? ")
            print(codigoAluno(nome,alunos))
        elif opcao == 3:
            codigo = int(input("C´odigo do estudante? "))
            ficheiro = input("Ficheiro de resultados? ")
        discAluno(codigo,alunos,disciplinas,ficheiro)
        # --- completar (acrescentar mais opc¸˜oes para as outras quest˜oes )
        opcao = escolhe_menu()
interface()