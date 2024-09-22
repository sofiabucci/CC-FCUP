import functions
import math

# a
n= int(input())

for k in range (n):
    x= float(input())
    functions.gr(x)
    print(functions.gr(x))

# b
n= int(input())
s= 0

for k in range(n):
    x= float(input())
    s += functions.gr(x)  
print(s)

# c
print("senos de -180, -170, -160, ... ,180 \n")

for x in range (-180,180,10):
    v= functions.gr(x)
    s= math.sin(v)
    print("seno(%dr)= %.3f" %(v,s))