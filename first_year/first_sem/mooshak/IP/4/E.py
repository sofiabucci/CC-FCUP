infos=list(map(int,input().split()))

locais=[]
n=int(input())
for i in range(n):
    l=list(map(int,input().split()))
    locais.append(l)
    
alternativas=[]   
k,h=map(int,input().split())
while k!=0: 
    d=list(map(int,input().split()))
    origem=None
    horario=h*60
    caminho={}
    
    for i in range(0,len(d),3):   
        if d[i]==infos[1]:   
            if i+3<len(d) and d[i+1]>=infos[0] and horario>=(infos[3]*60): 
                origem=i
                caminho[d[i]]=locais[d[i]-1][d[i+3]-1]
            else:
                break
        elif d[i]==infos[2] and horario<=(infos[4]*60) and origem!=None:
            x=sum(caminho.values())
            alternativas.append(x)
            break      
        elif origem!=None and i>origem:
            if i+3<len(d) and d[i+1]>=infos[0] and horario<=(infos[4]*60):
                caminho[d[i]]=locais[d[i]-1][d[i+3]-1]
            else:
                break
        else:
            if i+3<len(d):
                caminho[d[i]]=locais[d[i]-1][d[i+3]-1]  
            else:
                break 
        horario+=d[i+2]   
       
    k,h=map(int,input().split()) 


if alternativas==[]:
    print("Impossivel")

else:
    p=min(alternativas)
    c=alternativas.count(p)
    print(c,p)
    