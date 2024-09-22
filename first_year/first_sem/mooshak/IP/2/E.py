c, l=map(int,input().split())
s=[int(input()) for _ in range(l)]+[0]*c
n=len(s)
p=i=0
m=2

while s[i]!=0:
    if m%2==0:
        l=[]
        for _ in range(i,c+i):
            l.append(s[_])
        p+=max(l)
        i=s.index(max(l))+1
    else:
        l=[]
        for _ in range(i,c+i):
            l.append(s[_])
        p-=min(l)
        i=s.index(min(l))+1
    m+=1

print(p)
