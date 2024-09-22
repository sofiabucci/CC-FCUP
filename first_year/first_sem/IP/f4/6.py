import functions
import math

# a,b
x= int(input("insira um inteiro:\n"))

if functions.perfect(x) == True:
    print(x, "é perfeito")
else:
    print(x, "não é perfeito")

# c
a= int(input("inicio da range:\n"))
b= int(input("fim da range:\n"))

if a <= b:
    functions.perfectrange(a,b)