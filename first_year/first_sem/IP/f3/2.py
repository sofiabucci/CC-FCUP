#a
x= int(input("diga um inteiro: \n"))
y= int(input("diga outro inteiro: \n"))

while x != 0 :
    if x%y == 0: 
        y= int(input("diga outro um inteiro: \n"))
    else :
        print("nem todos divisíveis por %d" %(x))
    break
if y == 0:
    print("todos divisíveis por %d" %(x))       
        
#b
x= int(input("indique uma sequência: \n"))
y= int(input())
i= 0

while y != 0 :
    if y == x :
        i += 1
    y= int(input())
    
print(i)

#c
x= int(input())
y= int(input())
c= 1

if y != 0:
    while x != 0:
        if x == y:
            c += 1
        x= int(input())
    print("ocorência:", c)    
    
else:
    print("não aplicável")