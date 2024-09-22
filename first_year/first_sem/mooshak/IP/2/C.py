c=int(input())
leigo=list(input().split())
telepata=list(input().split())
pontos=acertos=soma=0

for i in range(c):
    if leigo[i]==telepata[i]:
        acertos+=1
        soma+=1
        if i==c-1:
            pass
        else:
            continue
    if soma>1:
        pontos+=soma*3
    if soma==1:
        pontos+=1 
    soma=0  
        
print(acertos)
print(pontos)

