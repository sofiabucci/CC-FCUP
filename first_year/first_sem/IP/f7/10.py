def mais_por_disciplina(disciplinas,alunos,curso):
    contador=[0]
    for codigo,disc in enumerate(disciplinas):
        total=0
        for key,value in alunos.items():
            if codigo in value[2]:
                total+=1
        contador.append(total)
    c=max(contador)  
    print("Disciplinas com mais alunos do curso %s \n" %(curso))   
    td=0
    for x,y in enumerate(contador):
        if x>0 and x<len(disciplinas):
            if y==c:
                print(f"{disciplinas[x][0]}")
                td+=1
    print("\n Total = %d Maximo = %d" %(td,c))
curso="019"
mais_por_disciplina(disciplinas,alunos,curso)