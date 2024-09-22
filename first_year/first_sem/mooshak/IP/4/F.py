l,c=map(int,input().split())
tecido=[]
s=1

for i in range(c):
    n=list(str(input()))
    tecido.append(n)

for i in range(1,c):
    if c%i==0:
        s=1
        for j in range(0,c,i):
            if tecido[j:i+j]==tecido[j+i:j+(2*i)]:
                s+=1
            else:
                break
        if s==c//i:
            break

print(s)