visitas={"ARCO DA VILA": "Faro", "GRACA": "Lisboa", "IGREJA DOS GRILOS": "Porto", "JARDINS DO PALACIO DE CRISTAL":"Porto","MONTE AGUDO":"Lisboa","MONTE DE FARO":"Faro", "PENHA DE FRANCA":"Lisboa","SANTA CATARINA":"Lisboa", "SANTA LUZIA": "Lisboa", "SAO JORGE":"Lisboa", "SAO PEDRO DE ALCANTARA": "Lisboa", "SE CATEDRAL": "Porto", "SENHORA DO MONTE":"Lisboa", "SERRA DO PILAR": "Porto", "TORRE DOS CLERIGOS": "Porto", "VITORIA":"Porto"}
visitados=[]
lista={}
n=str(input())
while n in visitas:
    visitados.append(n+" "+visitas[n])           
    n=str(input())

visitados.sort()
for i,j in enumerate(visitados):
    if j not in lista.items():
        b=visitados.count(j)
        lista[j]=b
m=max(lista.values())

print(len(visitados), m)
for key,value in sorted(lista.items()):
    if value==m:
        print(key)
