def classifica(seq,p,ordem):
    s,t=[],[]
    ordem.reverse()
    for key,value in seq.items():
        if value==2:
            s.append(key)
        elif value==1:
            t.append(key)
            
    if s!=[]:
        maxs={}
        for x in s:
            maxs[x]=ordem.index(x)
        s=[]
        for y in sorted(maxs, key=maxs.get,reverse=True):
            s.append(y)
    
    if t!=[]:
        maxt={}
        for x in t:
            maxt[x]=ordem.index(x)
        t=[]
        for y in sorted(maxt, key=maxt.get,reverse=True):
            t.append(y)
    
    
    podium=p+s+t
    
    return podium

ne=int(input())
seq={}
abandonos=0
p,ordem=[],[]
n=int(input())
while n!=-1:
    ordem.append(n)
    if n in seq.keys():
        seq[n]+=1
    else:
        seq[n]=1
    if seq[n]==3:
        p.append(n)
        seq.pop(n)
    n=int(input())
    
podium=classifica(seq,p,ordem)
abandonos=ne-len(podium)
   
for x in podium:
    print(x)
print("No. abandonos (equipa toda):",abandonos)