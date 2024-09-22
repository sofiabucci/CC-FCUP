x,y=map(int,input().split())
s=0
c=0

while (x+y) != -2:
    if x+y==2:
        s+=1
        if s>c:
            c=s
    else:
        s=0
        m=int(input())
        while m==0:
            m=int(input())
    x,y=map(int,input().split())
                   
print(c)

