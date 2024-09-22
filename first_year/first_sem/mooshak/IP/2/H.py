qt=int(input())
tc=[0]*(qt+1)

for i in range(qt):
    t=int(input())
    v=int(input())
    tc[t]+=v

p=[]    
h=int(input())
for i in range(h):
    s=[0]*qt
    no=int(input())
    if no!=0:
        for _ in range(no):
            o=int(input())
            s[_]+=o
      
    p.append(s)    
 
hb=0 
for i in range(h):
    for j in range(qt):
        e=p[i][j]
        if tc[e]>0:
            tc[e]-=1
            hb+=1
            break
        
print(h-hb)
print(sum(tc))