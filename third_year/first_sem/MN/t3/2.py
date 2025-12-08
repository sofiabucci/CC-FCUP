"""
Interpolação da Evaporação em Adelaide, Austrália

Bibliotecas:
- numpy: operações numéricas e construção dos sistemas lineares.
- matplotlib.pyplot: geração dos gráficos finais das aproximações.

Documentação:
- Estrutura em estilo Google, semelhante ao ficheiro 1.py,
  descrevendo claramente argumentos e retornos de cada função.
"""

import numpy as np
import matplotlib.pyplot as plt

MESES = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
EVAPORACAO = np.array([8.6, 7.0, 6.4, 4.0, 2.8, 1.8, 1.8, 2.1, 3.2, 4.7, 6.2, 7.6])


def calcular_diferencas_divididas(x, y):
    """Calcula a tabela de diferenças divididas para o polinómio de Newton.

    Args:
        x (array_like): Nós de interpolação.
        y (array_like): Valores da função nos nós.

    Returns:
        ndarray: Tabela triangular de diferenças divididas.
    """
    n = len(x)
    F = np.zeros((n, n))
    F[:, 0] = y

    for j in range(1, n):
        for i in range(n - j):
            F[i, j] = (F[i+1, j-1] - F[i, j-1]) / (x[i+j] - x[i])

    return F


def polinomio_newton(x, y, x_avaliacao):
    """Avalia o polinómio interpolador de Newton num ponto dado.

    Args:
        x (array_like): Nós de interpolação.
        y (array_like): Valores da função.
        x_avaliacao (float): Ponto onde avaliar.

    Returns:
        float: Valor do polinómio interpolador no ponto dado.
    """
    n = len(x)
    F = calcular_diferencas_divididas(x, y)

    resultado = F[0, 0]
    produto = 1.0

    for i in range(1, n):
        produto *= (x_avaliacao - x[i-1])
        resultado += F[0, i] * produto

    return resultado


def resolver_sistema_tridiagonal(a, b, c, d):
    """Resolve um sistema tridiagonal usando o algoritmo de Thomas.

    Args:
        a (array_like): Coeficientes subdiagonais.
        b (array_like): Coeficientes diagonais.
        c (array_like): Coeficientes superdiagonais.
        d (array_like): Termos independentes.

    Returns:
        ndarray: Solução do sistema.
    """
    n = len(d)
    c_linha = np.zeros(n)
    d_linha = np.zeros(n)

    c_linha[0] = c[0] / b[0]
    d_linha[0] = d[0] / b[0]

    for i in range(1, n):
        denom = b[i] - a[i] * c_linha[i-1]
        c_linha[i] = c[i] / denom
        d_linha[i] = (d[i] - a[i] * d_linha[i-1]) / denom

    x = np.zeros(n)
    x[-1] = d_linha[-1]

    for i in range(n-2, -1, -1):
        x[i] = d_linha[i] - c_linha[i] * x[i+1]

    return x


def construir_spline_cubico_natural(x, y):
    """Constrói o spline cúbico natural que interpola os pontos dados.

    Args:
        x (array_like): Nós de interpolação.
        y (array_like): Valores da função.

    Returns:
        list: Lista de dicionários com coeficientes de cada intervalo.
    """
    n = len(x) - 1
    h = np.diff(x)

    A = np.zeros(n+1)
    B = np.zeros(n+1)
    C = np.zeros(n+1)
    D = np.zeros(n+1)

    B[0] = B[n] = 1.0
    D[0] = D[n] = 0.0

    for i in range(1, n):
        A[i] = h[i-1] / 6
        B[i] = (h[i-1] + h[i]) / 3
        C[i] = h[i] / 6
        D[i] = (y[i+1] - y[i]) / h[i] - (y[i] - y[i-1]) / h[i-1]

    M = resolver_sistema_tridiagonal(A, B, C, D)

    splines = []
    for i in range(n):
        a_i = y[i]
        b_i = (y[i+1] - y[i]) / h[i] - h[i] * (2*M[i] + M[i+1]) / 6
        c_i = M[i] / 2
        d_i = (M[i+1] - M[i]) / (6 * h[i])

        splines.append({
            'a': a_i,
            'b': b_i,
            'c': c_i,
            'd': d_i,
            'x_inicio': x[i],
            'x_fim': x[i+1]
        })

    return splines


def avaliar_spline(splines, x_avaliacao):
    """Avalia o spline cúbico natural num ponto dado.

    Args:
        splines (list): Coeficientes dos intervalos.
        x_avaliacao (float): Ponto onde avaliar.

    Returns:
        float: Valor do spline cúbico no ponto.
    """
    for spline in splines:
        if spline['x_inicio'] <= x_avaliacao <= spline['x_fim']:
            dx = x_avaliacao - spline['x_inicio']
            return spline['a'] + spline['b']*dx + spline['c']*dx**2 + spline['d']*dx**3

    # Caso o ponto esteja fora da gama
    if x_avaliacao < splines[0]['x_inicio']:
        spline = splines[0]
    else:
        spline = splines[-1]

    dx = x_avaliacao - spline['x_inicio']
    return spline['a'] + spline['b'] * dx


def main():
    """Função principal: constrói e plota as aproximações."""
    print("Construindo aproximações para dados de evaporação...")

    x_suave = np.linspace(1, 12, 300)

    y_polinomio = [polinomio_newton(MESES, EVAPORACAO, x) for x in x_suave]

    splines = construir_spline_cubico_natural(MESES, EVAPORACAO)
    y_spline = [avaliar_spline(splines, x) for x in x_suave]

    plt.figure(figsize=(12, 6))
    plt.plot(MESES, EVAPORACAO, 'ko', markersize=8, label='Dados Originais', zorder=5)
    plt.plot(x_suave, y_polinomio, 'r--', linewidth=2, label='Polinómio Interpolador (Newton)')
    plt.plot(x_suave, y_spline, 'b-', linewidth=2, label='Spline Cúbico Natural')

    plt.xlabel('Mês')
    plt.ylabel('Evaporação (polegadas)')
    plt.title('Aproximações da Evaporação em Adelaide, Austrália')
    plt.grid(True, alpha=0.3)
    plt.legend()
    plt.xticks(range(1, 13))
    plt.tight_layout()
    plt.savefig('evaporacao_aproximacoes.png', dpi=300, bbox_inches='tight')
    plt.show()

    print("Gráfico salvo como 'evaporacao_aproximacoes.png'")


if __name__ == "__main__":
    main()
