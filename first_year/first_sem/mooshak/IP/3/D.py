import re

a=(str(input()))
b=(str(input()))
  
a=re.sub("[^A-Za-z]","",a)
b=re.sub("[^A-Za-z]","",b)

a=sorted(a.lower())
b=sorted(b.lower())

if a==b:
    print("yes")
else:                
    print("no")

