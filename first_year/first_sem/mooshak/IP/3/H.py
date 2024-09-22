def achar(palavra,m,n,matriz):
    for i in range(m):
        if palavra[0] in matriz[i]:
            for j in range(n):
                if palavra[0]==matriz[i][j]:
                    comecolinha=i+1
                    comecocoluna=j+1
                    s=1
                    dirs=[[0,s],[s,0],[-s,0],[0,-s],[s,s],[-s,-s],[s,-s],[-s,s]]
                    for b in range(8):
                        s=1
                        c=i
                        d=j     
                        x=dirs[b][0]
                        y=dirs[b][1]
                        while (c+x<m) and (d+y<n) and (c+x>=0) and (d+y>=0) and(palavra[s]==matriz[c+x][d+y]):
                            c=c+x
                            d=d+y
                            s+=1    
                            if (s>=len(palavra)):
                                finallinha=c+1
                                finalcoluna=d+1       
                                return(comecolinha, comecocoluna, finallinha, finalcoluna)
                                    

m,n=map(int,input().split())
matriz=[ ]

for _ in range(m):
    l=list(str(input()))
    matriz.append(l)
    
k=int(input())

for _ in range(k):
    palavra=list(str(input()))
    ca,cb,fa,fb=achar(palavra,m,n,matriz)
    print(ca,cb,fa,fb)