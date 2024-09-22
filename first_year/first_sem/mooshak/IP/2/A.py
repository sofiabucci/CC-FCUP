n=int(input())
x=8
y=18

for i in range(n):
    a,b=map(int,input().split())
    if a>=x:
        x=a
    if b<=y:
        y=b

if x<=y:
    if (y-x)==0:
        print("%d" %(x))
    elif (y-x)%2==0:
        print("%d" %(x+((y-x)/2)))    
    elif (y-x)%2!=0:
        print("%d e meia" %(x+((y-x)/2)))
else:
    print("impossivel")

