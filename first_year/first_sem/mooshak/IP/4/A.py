n,t=map(int,input().split())
dados={}

for i in range(t):
    x=list(map(int,input().split()))
    dados[(x[0],x[1])]=x[2]
    dados[(x[1],x[0])]=x[2]
    
percurso=list(map(int,input().split()))
while percurso[0]!=0:
    tempMin=tempMax=dados[(percurso[1],percurso[2])]
    for j,k in enumerate(percurso):
        if j>1 and j<percurso[0]:
            if dados[(k,percurso[j+1])]<=tempMax and dados[(k,percurso[j+1])]<=tempMin:
                tempMin=dados[(k,percurso[j+1])]       
            elif tempMax<=dados[(k,percurso[j+1])]:
                tempMax=dados[(k,percurso[j+1])]
    print("%d %d" % (tempMin, tempMax))
    percurso=list(map(int,input().split()))


    