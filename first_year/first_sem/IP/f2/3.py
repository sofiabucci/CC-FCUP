x= int(input("inteiro: \n"))
m= 0

while x != 0:
    
    if x%9 == 0:
        m += 1
        
    x= int(input("outro inteiro: \n"))

print(m)    
        