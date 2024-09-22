m=int(input())
f=list(map(int,input().split()))
a=b=0
i=0

while len(f)!=0:
    if f[0]>f[-1]:
        a+=f[0]
        f.pop(0) 
    else:
        a+=f[-1]
        f.pop()
        
    if (i+2)%2==0:
        if f[0]>f[-1]:
            b+=f[-1]
            f.pop()
        else:
            b+=f[0]
            f.pop(0)
    else:
        if f[0]>f[-1]:
            b+=f[0]
            f.pop(0)
        else:
            b+=f[-1]
            f.pop()
    i+=1

if a>b:
    print("Alex ganha com %d contra %d" %(a,b))
elif a<b:
    print("Bela ganha com %d contra %d" %(b,a))
elif a==b:
    print("Alex e Bela empatam a %d" %(a))

    