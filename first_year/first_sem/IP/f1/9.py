a,b= map(int,input().split())
r= int(input())
x,y= map(int,input().split())

m= r*r
h= (x-a)**2
j= (y-b)**2

if h+j == m:
    print(f"{x},{y} : na fronteira")
    
elif h+j > m:
    print(f"{x},{y} : no exterior")
    
else:
    print(f"{x},{y} : no interior")