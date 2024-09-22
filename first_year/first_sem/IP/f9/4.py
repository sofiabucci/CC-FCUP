def resolve(a,b):
    try:
        lista=[]
        for item,list in enumerate(a):
            y=len(lista)
            if y>0:
                s=0
                for i in range(y):
                    s+=lista[i]*list[i]
                x=(b[item]-s)/list[-1]
            else:
                x=b[item]/list[-1]  
            lista.append(x)
        return lista
    except ValueError:
        return "matriz singular"
    
a = [[5],[2,-4],[4,0,1],[0,-1,2,6],[-3,0,2,-1,2]] 
b = [3,0,-1,2,3]

print(resolve(a,b))

import Fraction
def resolve(a,b):
    try:
        lista=[]
        for item,list in enumerate(a):
            y=len(lista)
            res=Fraction.str2Fraction(b[item])
            coefc=Fraction.str2Fraction(list[-1])
            if y>0:
                soma=Fraction(0,1)
                for i in range(y):
                    c=Fraction.str2Fraction(list[i])
                    l=Fraction.str2Fraction(lista[i])
                    z=c.__mul__(l)
                    soma=soma.__add__(z)
                stotal=res.__sub__(soma)
                x=stotal.__truediv__(coefc)
            else:  
                x=res.__truediv__(coefc)
            lista.append(x)
        return lista
    except ValueError:
        return "matriz singular"
    