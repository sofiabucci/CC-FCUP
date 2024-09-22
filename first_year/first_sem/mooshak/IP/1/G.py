n=int(input())
x=int(input())
y=int(input())
soma=0
s=0

for n in range(n-2):
    valor=int(input())
    if valor!=x and valor!=y:
        if valor>x or valor%y==0:
            s+=1 
            soma+=(valor)
               
if s!=0:
    print("Resposta G - soma:", soma)
else:
    print("Resposta G - nenhum valor satisfaz")
    
    