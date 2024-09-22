import math
def module(x):
    if x >= 0:
        print(x)
    else:
        print(-x)
        
        
def gr(x):
    r = (x * math.pi)/180
    return r


def positionDescartes(a,b,c,d):
    respx=""
    respy=""
    if a == c and b == d:
        print("Q e P coincidem")   
        
    else:
        if c > a:
            respx= "direita"
        else:
            respx= "esquerda"
    
        if d > b:
            respy= "acima"
        else:
            respy= "abaixo"
        
        
        print("Q está" ,respx, respy ,"de P")
        

def classifica(a,b,c,d):
    x=""
    y=""
    pos=""
    if a == c and b == d:
        pos="coincidem" 
        
    else:
        if c > a:
            x= "direita"
        elif c < a:
            x= "esquerda"
    
        if d > b:
            y= "acima"
        elif d < b:
            y= "abaixo"

        pos= x +" "+ y
    
    print("posição de Q=(%d,%d) relativamente a P=(%d,%d): %s" % (c,d,a,b,pos))
    
    
def somdivpro(x):
    soma= 0
    for i in range(1,x-1):
        if x%i == 0:
            soma += i
     
    return soma    


def perfect(x):
    if somdivpro(x) == x:
        return True
    else:
        return False


def perfectrange(a,b):
    for x in range (a, b+1):
        p= perfect(x)
        if p == True:
            print(x)
    
    
def distManhattan(a,b,c,d):  
    x = c-a
    y = d-b
    
    if x < 0:
        x = -x
    if y < 0:
        y = -y
        
    soma= x+y
    return soma


def distTotal(x):
    a=b=0 
    soma=0
  
    for _ in range(x-1):   
        c,d = map(int,input("insira uma coordenada : \n").split())
        soma+=distManhattan(a,b,c,d)
        a = c
        b = d
    
    return (soma*2)


def leibniz(k):
    soma= 0
    sinal= 1
    
    for n in range(k):
        termo = sinal**n/(2*n+1)
        soma += termo
        sinal = -sinal
    
    pi= 4*soma
    return pi


def sen(x,k):
    res= 0
    termo= x
    sinal= -1
    
    for n in range(1,k+1):
        res+= termo
        sinal *= -1
        termo *= (x*x)/((2*n)*(2*n+1))
        
    return res


def cos(x,k):
    res= 1
    termo= 1
    sinal= -1
    
    for n in range(1,k+1):
        res+= termo
        sinal *= -1
        termo *= (x*x)/((2*n)*(2*n-1))
        
    return res


def prodintern(x,y):
    soma=0
    
    for i in range(len(x)):
        prod=x[i]*y[i]
        soma+=prod
        
    return soma


def lerseqfiltra():
    lst=[]
    x=int(input())
    
    while x!=0:
        if x>0:
            lst.append(x)
        x=int(input())
    
    print(lst)


def mediarit(x):
    s=0
    
    for i in range(len(x)):
        s+=x[i]
    
    return (s/len(x))


def desviopadrao(x):
    y=mediarit(x)
    s=0
    
    for i in range(len(x)):
        v=(x[i]-y)**2
        s+=v
    
    return (math.sqrt(v/len(x)))


def mediageo(x):
    s=1
    
    for i in range(len(x)):
        s*=x[i]
        
    return (math.pow(s,(1/len(x))))


def positionList(x,v):
    s=0
    
    for i in range(len(v)):
        if v[i]==x:
            s+=1
    if s>0:
        return v.index(x)
    else:
        return -1
    

def positionMin(l):
    # posso usar o min(v) para saber o valor minimo dos elementos
    s=l[0]
    p=0
    
    for i in range(len(l)):
        if l[i]<=s:
            s=l[i]
            p=i
    if l==[]:
        return -1
    else:
        return p
    
    
def selecMulti(l,k):
    s=[]
    
    for i in range(len(l)):
        if i%k==0:
            s.append(l[i])
    
    return s


def rmvMulti(l,k):
    s=[]

    for i in range(len(l)):
        if l[i]%k==0:
            s.append(l[i])
            
    for i in  range(len(s)):
        l.remove(s[i])
    
    return l


def capicua(x):
    s= True
    for i in range(len(x)/2):
        if x[i]==x[len(x)-i]:
            continue
        else:
            s= False
    return s
    
    
def equiMedia(x):
    s=[]
    
    for i in range(len(x)//2):
        m=(x[i]+x[-1-i])/2
        s.append(m)
            
    return s


def invert(l):
    for i in range(0,len(l)-1,2):
        x=l[i]
        y=l[i+1]
        l[i]=y
        l[i+1]=x

    print (l)


def rotacao(x): 
    l=[] 
    
    l.append(x[-1])
    for i in range(len(x)-1):
        l.append(x[i])    

    return x


def troca(vm,dm,n,q):
    for i in range(n):
        if vm[i]<q:
            k=q//vm[i]
            if dm[i]>k:
                q-=vm[i]*k
            else:
                q-=vm[i]*dm[i]   
        
    return q


def main(vm,dm,q):
    r=troca(vm,dm,8,q)
    print(r)
    
    
def convert(rep,b,k):
    if len(rep)%k==0:
        l=(len(rep)//k)*[0]
        for i in range(len(rep)//k):
            for j in range(k):
                l[i]+=rep[k*i+j]*pow(b,(k-j-1))
        print (l)
        
    else:
        x=(k-len(rep)%k)*[0]
        rep+=x
        l=[0]*(len(rep)//k)
        for i in range (len(rep)//k):
            for j in range(k):
                l[i]+=rep[k*i+j]*pow(b,(k-j-1))
        print (l)
                     
                 
def Horner(a,x):
    n= len(a)-1
    res=a[n]
    for i in range(n-1,-1,-1):
        res=res*x+a[i]
    return res


