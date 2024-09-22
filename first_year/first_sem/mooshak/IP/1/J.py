n=int(input())
n1=int(input())
n2=int(input())
s=0

for n in range (n-2):
    e=int(input())
    if n2>n1*2 and n2>e*2:
        s+=1
    n1=n2
    n2=e
       
print(s)