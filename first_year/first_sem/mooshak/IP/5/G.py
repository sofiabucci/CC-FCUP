m,n=map(int,input().split())
x=list(map(int,input().split()))

for i in range(m):
    x.reverse()
    a=0
    
    for i,j in enumerate(x):
        a+=j*(10**i)
    a*=a
    
    y=list(str(a))
    p=[]
    
    c=4*n-len(y)
    for i in range(c):
        p.append(0)
        
    for elmt in y:
        p.append(int(elmt))
        
    x=p[n:3*n]
    x.reverse()
    b=0
    
    for i,j in enumerate(x):
        b+=j*(10**i)
    x.reverse()

    print("0,"+str(b).zfill(2*n))