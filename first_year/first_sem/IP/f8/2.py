def binarySearch(seq,valor):
    a=0
    b=len(seq)-1
    while a<=b:
        m=(a+b)//2
        if valor==seq[m]:
            return m
        if valor<seq[m]:
            b=m-1
        else:
            a=m+1
    return -1

#a


#b
def binarySearch(seq,valor):
    a=0
    b=len(seq)-1
    lista=[]
    while a<=b:
        m=(a+b)//2
        if valor==seq[m]:
            lista.append(m)
        if valor<seq[m]:
            b=m-1
        else:
            a=m+1
    return lista