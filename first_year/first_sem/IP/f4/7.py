import functions
import math

# a
a,b = map(int,input("insira uma coordenada P: \n").split())
c,d = map(int,input("insira uma coordenada Q: \n").split())

functions.disManhattan(a,b,c,d)
print(functions.disManhattan(a,b,c,d))

# b
x= int(input("digite o número de pontos:\n"))

if x >= 1:
    functions.distTotal(x)
    print(functions.distTotal(x))