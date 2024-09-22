def codigoAluno(nome,alunos):
    lista=[]
    for key,value in alunos.items():
        if value[0]==nome:
            lista.append(key)
    return lista

nome="Sofia Alves Silva"
print(codigoAluno(nome,alunos))