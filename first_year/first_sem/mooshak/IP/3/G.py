l,c=map(int,input().split())
trilho=""
labirinto=[]

for _ in range(l):
    lab=list(input().split())
    labirinto.append(lab)

s=labirinto[0][0]
i=j=0

while s in labirinto[i]:
    if j<(c-1) and s==labirinto[i][j+1]:
        labirinto[i][j]=0
        trilho+="D"
        j+=1
        
    elif j>0 and s==labirinto[i][j-1]:
        labirinto[i][j]=0
        trilho+="E"
        j-=1
        
    elif i<(l-1) and s==labirinto[i+1][j]:
        labirinto[i][j]=0
        trilho+="B"
        i+=1
        
    elif i>0 and s==labirinto[i-1][j]:
        labirinto[i][j]=0
        trilho+="C"
        i-=1
    else:
        break
    
        
soma=((len(trilho))+1)*(int(s))

print(trilho)
print(soma)