import functions
import math

n= int(input())

for x in range(n):
    
    a,b,c,d = map(int,input("insira um par de coordenadas (P,Q):").split(" "))
    functions.classifica(a,b,c,d)