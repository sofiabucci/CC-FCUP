c,n=map(int,input().split())
m=""
s=0

for i in range(n):
    p=int(input())
    d=str(input())
    if p>c:
        continue
    elif (s+p<=c):
        s+=p    
        m+=d+"\n"
       
print(m+str(s),str(c-s))



