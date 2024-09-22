
def totais_por_disciplina(disciplinas,alunos):
    contador=[0]
    print("Numero de alunos incritos\n")
    for codigo,disc in enumerate(disciplinas):
        total=0
        for key,value in alunos.items():
            if codigo in value[2]:
                total+=1
        contador.append(total)
    for x,y in enumerate(contador):
        if x>0 and x<len(disciplinas):
            print(f"{disciplinas[x][0]}: {y}")
            
totais_por_disciplina(disciplinas,alunos)