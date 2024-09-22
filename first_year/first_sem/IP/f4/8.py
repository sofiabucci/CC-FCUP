import functions
import math

k= int(input("digite a quantidade de termos iniciais: \n"))

if k>=1:
    functions.leibniz(k)
    print(f"aproximação: {functions.leibniz(k)}")
else:
    (print("insira um valor válido"))