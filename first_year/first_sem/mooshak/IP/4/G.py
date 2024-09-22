s,m,n=map(int,input().split())
pancada=["D","ND"]
t=0
aniquilado=0
retangulo=[]
for _ in range(m):
    c=list(str(input()))
    retangulo.append(c)
retangulo.reverse()

posição=[1,1]
qntmovi=int(input())
for _ in range(qntmovi):
    t=tuple(input())
    d={}
    d[t[0]]=int(t[1])
    for key,value in d.items():
        k=key
        v=value
    a=posição[0]
    b=posição[1]
    p=retangulo[b][a]
    if t==1:
        if k=="N":
            k="S"
        elif k=="S":
            k="N"
    if aniquilado==0: 
        if k=="E":
            for i in range(v):
                posição[0]+=1
                try:
                    if p=="V":
                        continue
                    elif p=="I":
                        s+=s*0.05
                    elif p=="F":
                        aniquilado=1
                        break
                    elif p=="A":
                        continue
                    elif p=="T":
                        s-=s*0.1
                    elif p=="X":   
                        t=(t*-1)+1    
                except IndexError:
                    pass
                    
        elif k=="W":
            for i in range(v):
                posição[0]-=1
                if p=="V":
                    continue
                elif p=="I":
                    s+=s*0.05
                elif p=="A":
                    t=0
                    posição[0]+=1
                    break
                elif p=="T":
                    s-=s*0.1
                elif p=="X":   
                    t=(t*-1)+1  
        elif k=="N":
            for i in range(v):
                try:
                    posição[1]+=1
                    if p=="V":
                        continue
                    elif p=="I":
                        s+=s*0.05
                    elif p=="F":
                        aniquilado=1
                        break
                    elif p=="A":
                        continue
                    elif p=="T":
                        s-=s*0.1
                    elif p=="X":   
                        t=(t*-1)+1  
                except IndexError:
                    pass
        elif k=="S":
            for i in range(v):
                posição[1]-=1
                if p=="V":
                    continue
                elif p=="I":
                    s+=s*0.05
                elif p=="A":
                    t=0
                    posição[0]+=1
                    break
                elif p=="T":
                    s-=s*0.1
                elif p=="X":   
                    t=(t*-1)+1  
                    

        
if aniquilado==0:      
    if posição[0]>n or posição[1]>m:
        print("Fora(%d,%d):%d:%s" %(posição[0],posição[1],s,pancada[t]))
    else:
        print("Dentro(%d,%d):%d:%s" %(posição[0],posição[1],s,pancada[t]))
else:
    print("Aniquilado")