def discAno(ano,disciplinas):
    lista=[]
    for i,x in enumerate(disciplinas):
        if ano in x:
            lista.append(i)
    return lista

print(discAno(ano,disciplinas))
        