#a
n= int(input())
s= 0
i= 1

while i <= n :
    s = s-(i*i)
    i += 1

print(s) 

#b
n= int(input("valor de n (positivo): \n"))
x= int(input("valor de x (não nulo): \n"))
c= 0 
cm= 0

while c < n:
    c += 1
    y= int(input("valor de y: \n"))
    if y%x == 0:
        cm += 1
        
print("%d em %d" %(cm,n))

#c 
n= int(input())
conta = 0 

while n >= 2:
    x= int(input())
    y= int(input())
    n -= 2
    if x > 0 and x > 2*y:
        conta += 1

print (conta)