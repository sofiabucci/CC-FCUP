import functions
import math

#a
x= float(input("digite x:\n"))
k= int(input("numero de termos:\n"))

if k >= 1:
    cos=functions.cos(x,k)
    sen=functions.sen(x,k)
    print("aproximação de sen: %d e de so:%d" %(sen, cos))
else:
    (print("insira um valor válido"))
