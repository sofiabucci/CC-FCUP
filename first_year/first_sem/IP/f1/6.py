x= int(input("Primeiro inteiro: \n"))
y= int(input("Segundo inteiro: \n"))
z= int(input("Terceiro inteiro: \n"))

if (x > 0 and y > 0 and z > 0) and (x + y > z or x + z > y or y + z > x):
    print("(%d,%d,%d) definem triângulo" % (x,y,z))
    
    if x == y == z:
        print("(%d,%d,%d) define triângulo equilatero" % (x,y,z))
        
    elif x != y != z:
        print("(%d,%d,%d) define triângulo escaleno" % (x,y,z))
        
    else:
        print("(%d,%d,%d) define triângulo isósceles" % (x,y,z))
   
else:
    print("(%d,%d,%d) não definem triângulo" % (x,y,z))
