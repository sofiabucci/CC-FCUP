n=int(input())
e=["normal","tonto"]
s=["CCW","CW"]
p=["S","SE","E","NE","N","NW","W","SW"]
c=b=0

while n!=-1:
    d=n//45
    a=0
        
    if b==0:
        if d>=8:
            c+=d%8
        else:
            c+=d   
    elif b==1:
        if d>=8:
            c-=d%8
        else:
            c-=d    
        
    if d>16:
        a=1
        b=(b*-1)+1     
                
    n=int(input())
    
if abs(c)>=8:
    c=c%8
    
print(f"({p[c]}, {s[b]}, {e[a]})")