
mapa=[]
x=1
y=2
sentido={0:[-1,0,0,1],1:[0,1,1,0],2:[1,0,0,-1],3:[0,-1,-1,0]}
m,n=map(int,input().split())
for i in range(m):
    l=list(str(input()))
    mapa.append(l)
mapa.reverse()

balao=s=0
msg=""
mapa[0][2]="X"
ix=1
iy=2
px=py=0
while True:
    s=s%4
    a,b,c,d=sentido[s][0],sentido[s][1],sentido[s][2],sentido[s][3]
    
    while mapa[x+c][y+d]!="X":
        
        if mapa[x][y]=="B":
            balao+=1
            mapa[x][y]=" " 
            
        if mapa[x+a][y+b]=="S":
            msg="Levantou voo"
            break  
    
        if mapa[x+a][y+b]=="P":
            px=x+(a*2)
            py=y+(b*2)
            mapa[x+a][y+b]="X" 
            ps=s+2 
              
        if ix==px and iy==py:
            msg="Veio para ficar"
            break  
           
        if x==ix and y==iy and px!=0 and py!=0:
            s=ps
            x=px
            y=py
            ix=px
            iy=py 
            px=py=0
            break
            
        x+=b
        y+=d    
            
    try:
        if mapa[x+c][y+d]=="X":
            x+=d
            y-=b
            s+=1
    except TypeError:
        continue       

print(balao)
print(msg)