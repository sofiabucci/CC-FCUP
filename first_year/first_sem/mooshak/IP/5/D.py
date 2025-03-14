k=int(input())
clientes={1:0,2:0,3:0,4:0}
r=0
hora,min=0,0
for x in range(k):
    h,m,d=map(int,input().split())
    if x==0:
        hora=h
        min=m+d
    if (h<9 or h>12) and (h<15 or h>19):
        r+=1
    elif (h==12 and min>0) or (h==19 and min>0):
        r+=1
    else:   
        if hora==h and min>m:
            if clientes[4]==0:
                for key,value in clientes.items():
                    if value==0:
                        clientes[key]=[h,m,d]
                        break
            else:
                r+=1 
        
        elif hora<h or (hora==h and min<=m):
            while hora<h or (hora==h and min<m):
                for key,value in clientes.items():
                    if clientes[1]==0:
                        break
                    try:
                        clientes[key]=clientes[key+1]
                    except KeyError:
                        break
                if min>=60:
                    hora+=min//60
                    min=min%60
                if clientes[1]!=0:
                    min+=clientes[1][2]
                else:
                    hora=h
                    min=m
                        
            for key,value in clientes.items():
                if value==0:
                    clientes[key]=[h,m,d]
                    break
            
            
print("Perdeu = %d" % r)
