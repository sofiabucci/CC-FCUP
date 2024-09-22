#a 
s= 0 
p= 2
n= 1

while n < 4:
    s = s+p
    p = 2*p
    n = n+1

print(s)
print("n = %d p = %d" %(n,p))

#b
p = 10
n = 18

while n < 200:
    if n%4 == 0 or n%3 == 0:
        print(n)
        p = p+21
    n = n+p

print("n = %d p = %d" %(n,p))