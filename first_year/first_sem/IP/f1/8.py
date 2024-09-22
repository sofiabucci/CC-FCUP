a= int(input("diga um inteiro: \n"))
b= int(input("diga um segundo inteiro: \n"))

if b == 0:
    if a == 0:
        print("sim.")
        
    else:
        print("não.")
        
else:
    if a%b == 0:
        print("sim")
        
    else:
        print("não.")