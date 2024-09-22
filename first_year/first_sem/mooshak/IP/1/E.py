p=e=v=0
n=int(input())

while n!=-1:
    if n>=24:
        e+=1
    elif n>=11:
        v+=1
    else:
        p+=1      
    n=int(input())
    
print("azul: %d\namarelo: %d\nverde: %d" %(p,e,v))
