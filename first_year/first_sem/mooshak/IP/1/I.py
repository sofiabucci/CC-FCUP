t,d=map(int,input().split())
s=0
c=0

for d in range(d):
    m=int(input())
    if abs(t-m)<=2:
        s+=1
        if s>=c:
            c=s
    else:
        s=0
if c!=0:
    if c>1:
        print("Durante %d dias consecutivos, temperaturas moderadas" % c) 
    else: 
        print("Temperaturas moderadas apenas em dias isolados")
else:
    print("Sem registo de temperaturas moderadas") 
