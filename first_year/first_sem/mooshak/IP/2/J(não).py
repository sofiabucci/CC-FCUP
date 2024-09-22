def loc(caminho):
    m=caminho[-1]
    for i,e in enumerate(caminho):
        if e in caminho[:i]:
            if caminho.index(e)<caminho.index(m):
                s=i
                m=e
    if caminho[0]==caminho[s]:
        s+=1
    del (caminho[1:s])
    return caminho

caminho=[]
n=int(input())
while n!=0:
    caminho.append(n)
    n=int(input())
    
x=loc(caminho)
for _ in range(len(x) ):
    print(x[_])
