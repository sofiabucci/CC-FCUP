import math

def F(x):
    return math.sin(x**2) + 1.1 - math.exp(-x)

def F_derivada(x):
    return 2*x*math.cos(x**2) + math.exp(-x)

def Bissecao(a, b, eps):
    """
    aplicar metodo bisseçao em [a,b] para resolver o f(x)=0
    terminar apenas quando (b-a)/2 <= eps
    devolver o x aproximado, erro majorado e o numero de iteracoes
    para funcionar requer que f(a) x f(b) < 0 (basicamente o que é verificado na funçao Raiz)
    """
    fa = F(a)
    fb = F(b)   
    
    if fa*fb >= 0:
        raise ValueError("F(a) e F(b) devem ter sinais opostos.")   
    
    iter = 0
    while (b-a)/2 > eps:
        c = (a+b)/2
        fc = F(c)
        
        if fc == 0:
            return c, 0, iter     
        elif fa*fc < 0:
            b = c
            fb = fc
        else:
            a = c
            fa = fc
            
        iter += 1
    x_aprox = (a+b)/2
    erro_majorado = (b-a)/2
    return x_aprox, erro_majorado, iter

def Newton(a, b, eps, x0=None):
    if x0 is None:
        x0 = (a+b)/2
        
    x = x0
    iter = 0    
    while True:
        fx = F(x)
        dfx = F_derivada(x)
        
        if dfx == 0:
            raise ValueError("Derivada é zero. Método de Newton falhou.")
        
        x1 = x-fx/dfx
        iter += 1
        
        if abs(x1-x) < eps:
            break
        
        x = x1

def Raiz(xmin, xmax):
    k = 0.01
    while (xmin+k) <= xmax:
        a = F(xmin)
        b = F(xmin+k)
        if (a*b) < 0:
            print("Raiz encontrada para o intervalo:", xmin, xmax)
            return xmin, xmin + k
        else:
            xmin += k
    print("Não foi encontrada raiz no intervalo fornecido.")
    return None

if __name__ == "__main__":
    xmin = float(input("xmin = "))
    xmax = float(input("xmax = "))
    p, q = Raiz(xmin, xmax)
    c = (p+q)/2
    a = c-0.05
    b = c+0.05
    if (a <= p) and (q <= b):
        print("Verificação: o intervalo contém a raiz.")
    else:
        print("Verificação: o intervalo não contém a raiz.")





