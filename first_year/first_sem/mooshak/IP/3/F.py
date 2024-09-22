inacessivel=0
g=int(input())
gavetas=list(str(input()) for _ in range (g))

for i,x in enumerate(gavetas):
    if x=="#" and i==0:
        inacessivel+=1
    elif x=="#" and gavetas[i-1]=="#":
        inacessivel+=1

print(inacessivel)
