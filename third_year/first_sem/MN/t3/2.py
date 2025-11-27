"""
Interpolação da Evaporação em Adelaide, Austrália
Métodos: Polinômio Interpolador de Newton e Spline Cúbico Natural
Implementação manual sem uso de funções prontas de interpolação
"""

import numpy as np
import matplotlib.pyplot as plt

# Dados do problema
MESES = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
EVAPORACAO = np.array([8.6, 7.0, 6.4, 4.0, 2.8, 1.8, 1.8, 2.1, 3.2, 4.7, 6.2, 7.6])


def calcular_diferencas_divididas(x, y):
    """Calcula a tabela de diferenças divididas para o método de Newton"""
    n = len(x)
    F = np.zeros((n, n))
    F[:, 0] = y
    
    for j in range(1, n):
        for i in range(n - j):
            F[i, j] = (F[i+1, j-1] - F[i, j-1]) / (x[i+j] - x[i])
    
    return F


def polinomio_newton(x, y, x_avaliacao):
    """Avalia o polinômio interpolador de Newton em um ponto específico"""
    n = len(x)
    F = calcular_diferencas_divididas(x, y)
    
    resultado = F[0, 0]
    produto = 1.0
    
    for i in range(1, n):
        produto *= (x_avaliacao - x[i-1])
        resultado += F[0, i] * produto
    
    return resultado


def resolver_sistema_tridiagonal(a, b, c, d):
    """Resolve sistema tridiagonal usando algoritmo de Thomas"""
    n = len(d)
    c_linha = np.zeros(n)
    d_linha = np.zeros(n)
    
    # Eliminação para frente
    c_linha[0] = c[0] / b[0]
    d_linha[0] = d[0] / b[0]
    
    for i in range(1, n):
        denom = b[i] - a[i] * c_linha[i-1]
        c_linha[i] = c[i] / denom
        d_linha[i] = (d[i] - a[i] * d_linha[i-1]) / denom
    
    # Substituição para trás
    x = np.zeros(n)
    x[n-1] = d_linha[n-1]
    
    for i in range(n-2, -1, -1):
        x[i] = d_linha[i] - c_linha[i] * x[i+1]
    
    return x


def construir_spline_cubico_natural(x, y):
    """Constrói spline cúbico natural que interpola os pontos dados"""
    n = len(x) - 1
    h = np.array([x[i+1] - x[i] for i in range(n)])
    
    # Sistema tridiagonal: A*M = D
    A = np.zeros(n+1)
    B = np.zeros(n+1)
    C = np.zeros(n+1)
    D = np.zeros(n+1)
    
    # Condições de contorno naturais
    B[0] = 1.0
    D[0] = 0.0
    B[n] = 1.0
    D[n] = 0.0
    
    # Equações internas
    for i in range(1, n):
        A[i] = h[i-1] / 6
        B[i] = (h[i-1] + h[i]) / 3
        C[i] = h[i] / 6
        D[i] = (y[i+1] - y[i]) / h[i] - (y[i] - y[i-1]) / h[i-1]
    
    # Resolver para M (segundas derivadas)
    M = resolver_sistema_tridiagonal(A, B, C, D)
    
    # Construir coeficientes dos splines
    splines = []
    for i in range(n):
        a_i = y[i]
        b_i = (y[i+1] - y[i]) / h[i] - h[i] * (2*M[i] + M[i+1]) / 6
        c_i = M[i] / 2
        d_i = (M[i+1] - M[i]) / (6 * h[i])
        
        splines.append({
            'a': a_i, 'b': b_i, 'c': c_i, 'd': d_i,
            'x_inicio': x[i], 'x_fim': x[i+1]
        })
    
    return splines


def avaliar_spline(splines, x_avaliacao):
    """Avalia o spline cúbico em um ponto específico"""
    for spline in splines:
        if spline['x_inicio'] <= x_avaliacao <= spline['x_fim']:
            dx = x_avaliacao - spline['x_inicio']
            return (spline['a'] + spline['b'] * dx + 
                    spline['c'] * dx**2 + spline['d'] * dx**3)
    
    # Extrapolação linear se fora do intervalo
    if x_avaliacao < splines[0]['x_inicio']:
        spline = splines[0]
        dx = x_avaliacao - spline['x_inicio']
        return spline['a'] + spline['b'] * dx
    else:
        spline = splines[-1]
        dx = x_avaliacao - spline['x_inicio']
        return spline['a'] + spline['b'] * dx


def main():
    """Função principal: constrói e plota as aproximações"""
    print("Construindo aproximações para dados de evaporação...")
    
    # Criar pontos para avaliação suave
    x_suave = np.linspace(1, 12, 300)
    
    # Calcular polinômio interpolador
    y_polinomio = [polinomio_newton(MESES, EVAPORACAO, x) for x in x_suave]
    
    # Calcular spline cúbico
    splines = construir_spline_cubico_natural(MESES, EVAPORACAO)
    y_spline = [avaliar_spline(splines, x) for x in x_suave]
    
    # Criar gráfico
    plt.figure(figsize=(12, 6))
    
    # Plotar dados originais
    plt.plot(MESES, EVAPORACAO, 'ko', markersize=8, label='Dados Originais', zorder=5)
    
    # Plotar aproximações
    plt.plot(x_suave, y_polinomio, 'r--', linewidth=2, 
             label='Polinômio Interpolador (Newton)', alpha=0.8)
    plt.plot(x_suave, y_spline, 'b-', linewidth=2, 
             label='Spline Cúbico Natural', alpha=0.8)
    
    # Configurar gráfico
    plt.xlabel('Mês')
    plt.ylabel('Evaporação (polegadas)')
    plt.title('Aproximações da Função Evaporação - Adelaide, Austrália')
    plt.legend()
    plt.grid(True, alpha=0.3)
    plt.xticks(range(1, 13))
    
    plt.tight_layout()
    plt.savefig('evaporacao_aproximacoes.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    print("Gráfico salvo como 'evaporacao_aproximacoes.png'")


if __name__ == "__main__":
    main()