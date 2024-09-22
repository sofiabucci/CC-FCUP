x= int(input("Primeiro inteiro: \n"))
y= int(input("Segundo inteiro: \n"))
z= int(input("Terceiro inteiro: \n"))
#
if x > y:
    print("O máximo é ", x )
    
else:
    print(f"O máximo é {y}")

#
if x > y and x > z:
    print(f"O máximo é {x}")
    
elif y > x and y > z:
    print(f"O máximo é {y}")
    
else:
    print(f"O máximo é {z}")
