def casando(caracteres,expressão):
    noivos=[]
    casais={}
    z=0
    for i,a in enumerate(expressão):
        if a in "([{":
            noivos.append([a,i])
        if a in ")]}":
            if noivos==[] or caracteres[noivos[-1][0]]!=a:
                return 0
            z=noivos[-1][0]+a
            casais[(z,noivos[-1][1])]=i
            del noivos[-1]

    if noivos!=[] and z==0:
        return 0
    if casais=={}:
        return 1
    else:
        return casais

caracteres={"(":")","[":"]","{":"}"}
expressão=list(str(input()))

x=casando(caracteres,expressão)

if x==0:
    print("Pares mal formados")   
elif x==1:
    print("Sem noivos para casar")  
else:
    for i in sorted(x, key=x.get):
        print (i[0],i[1],x[i])
         