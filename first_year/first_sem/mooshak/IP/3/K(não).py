formatos=[[[1,0],[1,1],[2,0],[2,-1]],[[1,0],[1,-1],[2,0],[2,1]],[[0,1],[1,1],[1,2],[2,1]],[[1,0],[1,-1],[1,-2],[2,-1]],[[1,0],[1,-1],[1,1],[2,-1]]]
matriz=[]
gambozinos=0
m,n=map(int,input().split())

for i in range(m):
    x=list(map(int,input().split()))
    matriz.append(x)
    
for i,a in enumerate(matriz):
    if 1 in a:
        for j,b in enumerate(a):
            if b==1:    
                z=1   
                for k,c in enumerate(formatos):
                    for l,d in enumerate(c):
                        x=d[0]+i
                        y=d[1]+j
                        if matriz[x][y]==1:
                            z+=1                   
                        else:
                            z=1
                            break
                        if z== 5:
                            gambozinos+=1
                            break
                
print(gambozinos)