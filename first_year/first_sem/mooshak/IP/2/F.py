b=int(input())
n=int(input())
a=[int(input()) for _ in range(n)]
s=min(a)

if sum(a)<=b:
    for i in range(len(a)):
        print(a[i])
else:
    if s>(b)//(len(a)):
        x=b//(len(a))
        l=[x]*len(a)
        for i in range(len(l)):
            print(l[i])  
    else:
        l=[0]*n
        x=sum(a)
        y=len(a)
        while y>0 and b>=y:
            for i in range(len(a)):
                if l[i]!=a[i]:
                    l[i]+=1
                    b-=1
                    if l[i]==a[i]:
                        y-=1
        for i in range(len(l)):
            print(l[i])
 