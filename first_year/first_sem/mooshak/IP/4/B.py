t,n=map(int,input().split())
trajeto={}
nos={}
for i in range(n):
    nos[i+1]=[]
for i in range(t):
    s=0
    p=list(map(int,input().split()))
    for j in range(1,len(p)):
        if j%2==0:
            s+=p[j]  
        else:    
            if j+2<len(p):
                x=p[j+2]
                nos[p[j]].append(x)   
            if j-2>0:
                y=p[j-2]    
                nos[p[j]].append(y)     
    trajeto[i+1]=s

    
for keys,values in trajeto.items():
    print ("Trajeto %d: %d" % (keys,values))
for keys,values in sorted(nos.items()):
    x=set(values)
    print("No %d: %d" % (keys,(len(x))))
    