f,b=map(int,input().split())
lista=[]
res=""

for _ in range(f):
    a=list(map(int,input()))
    lista.append(a)
z=u=0
for j in range(b):
    for i,x in enumerate(lista):
        if x[j]==0:
            z+=1
        elif x[j]==1:
            u+=1
        else:
            pass
    if z>=u:
        res+="0"
    elif z<u:
        res+="1"
    z=u=0
        
print(res)
            

