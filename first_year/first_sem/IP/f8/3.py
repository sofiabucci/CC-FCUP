def insertionSort(v):
    "ordenar n por ordem decrescente"
    for k in range(1,len(v)):
        x=v[k]
        j=k-1
        while j>=0 and x>v[j]:
            v[j+1]=v[j]
            j=j-1
        v[j+1]=x

#c
def compara(a,b):
    if a<b:
        return -1
    elif a==b:
        return 0
    else:
        return 1
    
def reversa(x):
    if x=='decrescente':
        return False
    elif x=='crescente':
        return True
        
def insertionSort(v,compara,reversa):
    for k in range(1,len(v)):
        x=v[k]
        j=k-1
        if reversa==True:
            while j>=0 and compara(x,v[j])<0:
                v[j+1]=v[j]
                j=j-1
            v[j+1]=x
        else:
            while j>=0 and compara(x,v[j])>=0:
                v[j+1]=v[j]
                j=j-1
            v[j+1]=x
            

#e
def compDatas(x,y):
    if x<y:
        return -1
    elif x>y:
        return 1
    else:
        return 0
    
def compRegistos(ident,nome,data):
    