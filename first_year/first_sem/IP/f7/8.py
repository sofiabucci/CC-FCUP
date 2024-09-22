def codigo_disc(nome,disciplinas):
    for codigo,disc in enumerate(disciplinas):
        if nome==disc[0]:
            return codigo
def inscritos_disc(nome,disciplinas,alunos):
    codigo=codigo_disc(nome,disciplinas)
    lista=[]
    for key,value in alunos.items():
        if codigo in value[2]:
            lista.append(key)
    return lista

nome="Programacao Imperativa"
print(inscritos_disc(nome,disciplinas,alunos))