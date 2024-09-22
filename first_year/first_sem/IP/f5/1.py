import functions
import math

u= list(map(int,input().split()))
v= list(map(int,input().split()))

x=functions.prodintern(u,v)

if x==0:
    print("ortogonais")
else:
    print("Nao ortogonais")