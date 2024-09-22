import math
class Point:
    def __init__(self,x,y):
        self.x = x
        self.y = y
        
    def __str__(self):
        return "(%d,%d)" % (self.x,self.y)
    
    def __eq__(self,other):
        return self.x==other.x and self.y==other.y

    def __lt__(self,other):
        return self<other
        
    def __le__(self,other):
        return self<=other
        
    def shift_up(self):
        return self.y+1
        
    def scale(self,fator):
        return self.x*fator, self.y*fator

    def squareDistance(self,other):
        return ((self.x-other.x)**2+(self.y-other.y)**2)
    

class Circle:
    def __init__(self,c,r):
        self.r=r
        self.c=Point(c[0],c[1])
        
    def inCircle(self,p):
        self.p=Point(p[0],p[1])
        return math.sqrt(((self.c.x-p.x)**2+(self.c.y-p.y)**2))<=self.r
    
def filtra(circ,pontos):
    circ=Circle()
    l=[]
    for i in pontos:
        if circ.inCircle(i):
            l.append(i)
    return l

def mais_afastados(p,pontos):
    l=[]
    s=0
    for ponto in pontos:
        if math.sqrt(((p[0]-ponto[0])**2+(p[1]-ponto[1])**2))>s:
            s=math.sqrt(((p[0]-ponto[0])**2+(p[1]-ponto[1])**2))
        elif math.sqrt(((p[0]-ponto[0])**2+(p[1]-ponto[1])**2))==s:
            l.append(ponto)
    return l   
def print(pontos):
    for p in pontos:
        print(p)