def alunos_em_disc(disc,alunos,ndisc):
    lista=[]
    if type(disc)!=int or ndisc<disc:
        return False
    for key,value in alunos.items():
        if disc in value[2]:
            lista.append(key)
    return lista

disc=1
ndisc=29
print(alunos_em_disc(disc,alunos,ndisc))