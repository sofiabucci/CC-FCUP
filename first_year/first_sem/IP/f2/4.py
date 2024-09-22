k= int(input("diga um inteiro: \n"))
x= int(input("outro inteiro: \n"))
soma= 0

while x != 0:
    if x > 0 and x%k == 0:
        soma += x
        
    x= int(input("outro inteiro: \n"))
    
print(soma)
        