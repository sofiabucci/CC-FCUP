md=list(map(int,input().split()))
m=[200,100,50,20,10,5]
t=n=r=k=z=0
e,c=map(int,input().split())

while e!=0 or c!=0:
    t+=1
    pago=0
    s=int(input())
    while s!=0:
        if s==1 or s==2:
            s*=100
            pago+=s
        else:
            pago+=s
        for i,x in enumerate(m):
            if s==x:
                md[i]+=1
                break
        s=int(input())
        
    valor=(e*100)+c
    troco=pago-valor
    
    if troco!=0:
        for i,y in enumerate(m):
            menos=troco//y
            if troco>=y and md[i]>0:
                if md[i]>=menos:  
                    md[i]-=menos
                    troco-=(menos*y)
                else:
                    troco-=y*md[i]
                    md[i]=0
        
    if troco!=0:
        n+=1
        z+=troco
          
    e,c=map(int,input().split())
       
if z>=100:
    k+=z//100
    r+=z-(k*100)
else:
    r+=z 
    
print(k,r)
print("%d/%d" %(n,t))