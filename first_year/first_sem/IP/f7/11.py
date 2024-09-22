def mais_por_disciplina(disciplinas,alunos,disc,k):
    contador={}
    for codigo,disci in enumerate(disciplinas):
        if disc==disci[0]: 
            for key,value in alunos.items():
                if codigo in value[2]:
                    if key[4:7] not in contador.keys():
                        contador[key[4:7]]=[1]
                    else:
                        contador[key[4:7]]+=[1]
    
disc="Programação Imperativa"
k=4
mais_por_disciplina(disciplinas,alunos,disc,k)