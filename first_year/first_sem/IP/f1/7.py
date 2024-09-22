import math

print("insira somente coeficientes inteiros \n")
a= int(input("diga o a da equação: \n"))
b= int(input("diga o b da equação: \n"))
c= int(input("diga o c da equação: \n"))

delta = b**2 - (4*a*c)

if delta > 0:
    print("A equação tem duas raízes distintas")
    
elif delta == 0:
    print("A equação tem uma raíz dupla")
    
else:
    print("A equação não tem raízes reais")
