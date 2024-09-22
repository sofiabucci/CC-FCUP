h=int(input())
a,b=map(int,input().split())
c,d=map(int,input().split())


b=b-h
d=d-h
a=max(a,c)
b=min(b,d)
    
if b<a:
    print("Impossivel")
elif a==b:
    print(a)
else:
    print(a,b)