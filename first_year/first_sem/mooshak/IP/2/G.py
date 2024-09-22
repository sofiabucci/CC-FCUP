def exp(n,l):
    p=k=None
    for i,x in enumerate(l):
        if x!=-1:
            if p==None:
                p=x
                a=i
            elif k==None:
                k=x
                b=i
            if p!=None and k!=None:
                break  
    if p==None and k==None:
        return True  
    elif p!=None and k==None:
        if (p-a)<=-1:
            return False
        else:
            return True
    else:
        r=((k-p)//(b-a))
        if r<1:
            return False
        else:
            for i,x in enumerate(l):
                y=p+(r*(i-a))
                if (x!=-1 and x!=y) or y<0:
                    return False    
            return True

e=int(input())

for i in range(e):
    n=int(input())
    l=list(map(int,input().split()))   
    s=exp(n,l)
    if s==True:
        print("Possivel")
    elif s==False:
        print("Impossivel")
        