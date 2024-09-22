class Fraction:
    def __init__(self, num, denom):
        if denom == 0:
            raise ZeroDivisionError("denominador zero")
        if denom < 0:
            denom = -denom
            num = -num
        d = mdc(abs(num),denom)
        self.num = num//d
        self.denom = denom//d
        
    def __str__(self):
        if self.denom == 1:
            return str(self.num)
        return "%d/%d" % (self.num, self.denom)
    
    def __add__(self,other): 
        r = Fraction(self.num*other.denom + self.denom*other.num,
        self.denom*other.denom)
        return r
    
    def __mul__(self, other): 
        r = Fraction(self.num*other.num, self.denom*other.denom)
        return r
    
    def __sub__(self,other): 
        sym_other = Fraction(-other.num,other.denom)
        return self + sym_other
    
    def __truediv__(self,other): 
        if other.num == 0:
            raise ZeroDivisionError("Divisão por zero")
        return self*Fraction(other.denom,other.num)
    
    def __eq__(self,other):
        return self.num*other.denom == self.denom*other.num
    
    def __lt__(self,other):
        return self.num*other.denom < self.denom*other.num
    
    def __le__(self,other):
        return self.num*other.denom <= self.denom*other.num
    
    
def mdc(a,b):
    if b == 0:
        if a == 0:
            raise ValueError("mdc(%d,%d) indefinido" % (a,b))
        return a
    return mdc(b, a%b)

def str2Fraction(s):
    if "/" in s:
        num,denum=s.split("/")
        num=int(num)
        denum=int(denum)
    else:
        num=int(s)
        denum=1
    return Fraction(num,denum)

def calcula(expr):
    soma=Fraction(0,1)
    n=list(expr.split("+"))
    for i in n:
        x=str2Fraction(i)
        soma=soma.__add__(x)
    print(soma.__str__())    

def posnumero(expr,i):
    while i<len(expr) and expr[i]!="+" and expr[i]!="-":
        i+=1
    return i
def isolar(expr):
    lista=[]
    expr=list(expr)
    for x,y in enumerate(expr):
        n=""
        if y=="+" or y=="-":
            a=posnumero(expr,x+1)
            for i in range(x,a):
                n+=expr[i]
            lista.append(n)
    return lista
def soma_algebrica(expr):
    soma=Fraction(0,1)
    for i in expr:
        x=str2Fraction(i)
        soma=soma.__add__(x)
    print(soma.__str__())   