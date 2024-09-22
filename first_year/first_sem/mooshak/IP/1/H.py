f=int(input())
n=int(input())
v=0

if (1<=f and f<=99) and (1<=n and n<=10):   
    for n in range(n):
        e=int(input())
        if 1<=e and e<=99 and f>=e and e>=v:
            v=e

if v!=0:
    print(v)
else:
    print("No free lunch")