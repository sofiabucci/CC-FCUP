lugartotal=int(input())
fila=["-"]*lugartotal
lugares={}
e,n,l=map(int,input().split())
a=1
while n!=0:
    if n>lugartotal:
        a+=1
        e,n,l=map(int,input().split())
        continue
    
    lugares[a]=(e,n,l)
    lugartotal-=n
    a+=1
    e,n,l=map(int,input().split())

for key,value in lugares.items():
    e=value[0]
    n=value[1]
    l=value[2]
    if e==0:
        if fila[l-1-n:l-1]!=["-"]*n:
            b=c=0
            for i,x in enumerate(fila):
                if x=="-":
                    b+=1
                elif (i+1)<len(fila) and fila[i+1]=="-" and b!=0:
                    c=fila[i]
                    b+=1
                else:
                    b=0
                if b==n:
                    if c!=0:
                        i+=1
                        fila[i-n]=c
                        for j in range(i-n+1,i+1):
                            fila[j]=key
                        break
                    for j in range(i-n+1,i+1):
                        fila[j]=key
                    break
                
        else:
            for i in range(l-n,l):
                fila[i]=key
    else:
        if fila[-l:-l+n]!=["-"]*n:
            b=c=0
            fila.reverse()
            for i,x in enumerate(fila):
                if x=="-":
                    b+=1
                elif (i+1)<len(fila) and fila[i+1]=="-" and b!=0:
                    c=fila[i]
                    b+=1
                else:
                    b=0
                if b==n:
                    if c!=0:
                        i+=1
                        fila[i-n]=c
                        for j in range(i-n+1,i+1):
                            fila[j]=key
                        break
                    for j in range(i-n+1,i+1):
                        fila[j]=key
                    break
            fila.reverse()
            
        else:
            for i in range(-l,-l+n):
                fila[i]=key
                
                
for s in fila:
    print(s)