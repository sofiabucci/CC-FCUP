a= 23
b= 4
c= 4

#a
if b == c:
    b = 1
    
if c == 1:
    a = b
    b = a
    c = 0
    
print(a,b,c)

#b
if b != c:
    b = 1
    
if c >= 1:
    a = b
    b = a
    c = 0
    
print(a,b,c)

#c
if b != c:
    b = 1
    
else:
    c = a
    a = b
    b = c
    
print(a,b,c)