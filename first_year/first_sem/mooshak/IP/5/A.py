def direc(xi,yi,x,y,r):
    while xi!=x or yi!=y:
        if x>xi:
            xi+=2
        elif x<xi:
            xi-=2
        if y>yi:
            yi+=2
        elif y<yi:
            yi-=2
        r+="F"
    return xi,yi,r
        
def lado(xi,yi,x,y,r,s):
    if yi!=y and s=="L":
        if yi<y:
            r+="D"
            s="S"
            yi+=2
        elif yi>y:
            r+="E"
            s="N"
            yi-=2
    elif yi!=y and s=="O":
        if yi<y:
            r+="E"
            s="S"
            yi+=2
        elif yi>y:
            r+="D"
            s="N"
            yi-=2
    if xi!=x and s=="N":
        if xi<x:
            r+="D"
            s="L"
            xi+=2
        elif xi>x:
            r+="E"
            s="O"
            xi-=2
    elif xi!=x and s=="S":
        if xi<x:
            r+="E"
            s="L"
            xi+=2
        elif xi>x:
            r+="D"
            s="O"
            xi-=2
    if xi==x and s=="S" and yi>y:
        s="N"
        r+="I"
        yi-=2
    elif xi==x and s=="N" and yi<y:
        s="S"
        r+="I"
        yi+=2
    if yi==y and s=="L" and xi>x:
        s="O"
        r+="I"
        xi-=2
    elif yi==y and s=="O" and xi<x:
        s="L"
        r+="I"
        xi+=2
    return xi,yi,r,s




rotas=[]
s="L"
clientes=int(input())
xi,yi=4,5
for _ in range(clientes):
    np=int(input())
    r=""
    for i in range(np):
        x,y=map(int,input().split())
        xi,yi,r,s=lado(xi,yi,x,y,r,s)
        xi,yi,r=direc(xi,yi,x,y,r)
    r+="S"
    rotas.append(r)

for elemn in rotas:
    print(elemn)