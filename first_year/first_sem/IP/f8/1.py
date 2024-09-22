import math

#b
def f(x):
    return ((math.e)**x)+x
a=-2
b=2
tol=0.00001

#c
def fg(x):
    return -((math.e)**x)+4-(x**2)+(2*x)-1
a=math.isfinite
b=math.isfinite

#d
def f(x):
    return 5*math.sin(x+2)-x-1
a=-3
b=1
tol=0
def bissect(f,a,b,tol):
    zeros=[]
    fa=f(a)
    c=(a+b)/2
    while c-a>tol: 
        m=(c+a)/2
        fm=f(m)
        if fm==0:
            return m
        if fm*fa>0:
            a=m
            fa=fm
        else:
            c=m
    zeros.append((c+a)/2)
    
    fb=f(b)
    c=(a+b)/2
    while b-c>tol: 
        m=(c+b)/2
        fm=f(m)
        if fm==0:
            return m
        if fb*fm>0:
            b=m
            fb=fm
        else:
            c=m
    zeros.append((c+b)/2)
    
    return zeros
#e
def f(x):
    return 5*(math.e**(x+2))+10*x-9
a=math.isfinite
b=math.isfinite
tol=10**-7

#f


def bissect(f,a,b,tol):
    fa=f(a)
    while b-a>tol:
        m=(a+b)/2
        fm=f(m)
        if fm==0:
            return m
        if fm*fa>0:
            a=m
            fa=fm
        else:
            b=m
    
    return (a+b)/2