"""
Bibliotecas:
- numpy: cálculos numéricos e sistemas lineares.
- math: fatorial usado nos majorantes teóricos.
- matplotlib.pyplot: gráficos comparativos.

Documentação:
- Feita em estilo Google para melhor entendimento do funcionamente de cada função, bem como o que recebe e o que retorna.
"""

import numpy as np
import math
import matplotlib.pyplot as plt

def f(x):
    """Calcula f(x) = x² + sin(6x).

    Args:
        x (float or array_like): Ponto(s) onde avaliar.

    Returns:
        float or ndarray: Valor(es) de f(x).
    """
    return x**2 + np.sin(6*x)

def newton(x, fvals):
    """Computa os coeficientes do polinómio de Newton via diferenças divididas.

    Args:
        x (array_like): Nós de interpolação.
        fvals (array_like): Valores da função nos nós.

    Returns:
        ndarray: Coeficientes do polinómio interpolador (forma de Newton).
    """
    n = len(x)
    coef = np.zeros((n, n))
    coef[:, 0] = fvals
    for j in range(1, n):
        for i in range(n - j):
            coef[i, j] = (coef[i+1, j-1] - coef[i, j-1]) / (x[i+j] - x[i])
    return coef[0, :]

def avaliar_newton(x_nodes, coeff, x):
    """Avalia o polinómio de Newton em ponto(s) x.

    Usa o esquema de Horner adaptado para a forma de Newton.

    Args:
        x_nodes (array_like): Nós de interpolação.
        coeff (array_like): Coeficientes das diferenças divididas.
        x (float or array_like): Ponto(s) de avaliação.

    Returns:
        float or ndarray: Valor(es) do polinómio em x.
    """
    x = np.array(x, dtype=float)
    n = len(coeff)
    p = np.zeros_like(x, dtype=float)
    for k in range(n-1, -1, -1):
        p = coeff[k] + (x - x_nodes[k]) * p
    return p

def cubic_spline_system(x, fvals):
    """Constrói o spline cúbico natural para os nós dados.

    Resolve o sistema das segundas derivadas e obtém os coeficientes
    de cada polinómio cúbico nos subintervalos.

    Args:
        x (array_like): Nós de interpolação.
        fvals (array_like): Valores da função.

    Returns:
        tuple:
            M (ndarray): Segundas derivadas nos nós.
            coeffs (list): Coeficientes [a, b, c, d, x_i, x_{i+1}] de cada intervalo.
    """
    n = len(x) - 1
    h = np.diff(x)
    A = np.zeros((n+1, n+1))
    b = np.zeros(n+1)
    A[0, 0] = 1
    A[n, n] = 1
    for i in range(1, n):
        A[i, i-1] = h[i-1] / 6
        A[i, i]   = (h[i-1] + h[i]) / 3
        A[i, i+1] = h[i] / 6
        b[i] = (fvals[i+1] - fvals[i]) / h[i] - (fvals[i] - fvals[i-1]) / h[i-1]
    M = np.linalg.solve(A, b)
    coeffs = []
    for i in range(n):
        a_i = (M[i+1] - M[i]) / (6 * h[i])
        b_i = M[i] / 2
        c_i = (fvals[i+1] - fvals[i]) / h[i] - (2*M[i] + M[i+1]) * h[i] / 6
        d_i = fvals[i]
        coeffs.append([a_i, b_i, c_i, d_i, x[i], x[i+1]])
    return M, coeffs

def avaliar_spline(coeffs, x):
    """Avalia o spline cúbico natural em ponto(s) x.

    Args:
        coeffs (list): Lista de coeficientes por intervalo.
        x (float or array_like): Ponto(s) de avaliação.

    Returns:
        float or ndarray: Valor(es) do spline.
    """
    x = np.array(x, dtype=float)
    s = np.zeros_like(x, dtype=float)
    for a_i, b_i, c_i, d_i, x_i, x_f in coeffs:
        mask = (x >= x_i) & (x <= x_f)
        if not np.any(mask):
            continue
        dx = x[mask] - x_i
        s[mask] = ((a_i*dx + b_i)*dx + c_i)*dx + d_i
    return s

def graficos_alinea_b(x_nodes, f_nodes, coeff_newton, coeffs_spline):
    """Gera o gráfico comparativo entre f, o polinómio interpolador e o spline.

    Args:
        x_nodes (array_like): Nós.
        f_nodes (array_like): Valores da função.
        coeff_newton (array_like): Coeficientes do polinómio de Newton.
        coeffs_spline (list): Coeficientes do spline cúbico.
    """
    x_plot = np.linspace(x_nodes[0], x_nodes[-1], 500)
    f_plot = f(x_plot)
    p_plot = avaliar_newton(x_nodes, coeff_newton, x_plot)
    s_plot = avaliar_spline(coeffs_spline, x_plot)
    plt.figure(figsize=(10,5))
    plt.plot(x_plot, f_plot, 'k', lw=2, label="f(x) = x² + sin(6x)")
    plt.plot(x_plot, p_plot, 'r--', lw=2, label="Polinómio de Newton")
    plt.plot(x_plot, s_plot, 'b-.', lw=2, label="Spline Cúbico")
    plt.scatter(x_nodes, f_nodes, color='black', zorder=5, label="Nós")
    plt.title("Interpolação: Polinómio vs Spline Cúbico")
    plt.xlabel("x")
    plt.ylabel("y")
    plt.grid(True, linestyle='--', alpha=0.5)
    plt.legend()
    plt.tight_layout()
    plt.show()

def calcular_majorantes_erro(x_nodes, grau_polinomio, h):
    """Calcula majorantes teóricos dos erros do polinómio e do spline.

    Args:
        x_nodes (array_like): Nós de interpolação.
        grau_polinomio (int): Grau do polinómio interpolador.
        h (float): Amplitude dos subintervalos.

    Returns:
        tuple:
            majorante_spline (float): Majorante uniforme do erro do spline.
            majorantes_polinomio (dict): Majorantes do polinómio em pontos fixos.
    """
    max_deriv_8 = 6**8  
    max_deriv_4 = 6**4   
    pontos = [0.1, 0.9]
    majorante_spline = (5/384) * max_deriv_4 * h**4
    majorantes_polinomio = {}
    for x in pontos:
        produto = 1.0
        for xi in x_nodes:
            produto *= abs(x - xi)
        majorantes_polinomio[x] = (max_deriv_8 / math.factorial(grau_polinomio+1)) * produto
    return majorante_spline, majorantes_polinomio

def questao1_a():
    """Executa a alínea (a): constrói e imprime os 8 nós e f(x_i).

    Returns:
        tuple: (x_nodes, f_nodes)
    """
    print("\n")
    print("QUESTÃO 1 (a): f(x) = x² + sin(6x), x ∈ [-1, 1]")
    n = 7
    a, b = -1, 1
    x_nodes = np.linspace(a, b, n + 1)
    f_nodes = f(x_nodes)
    h = (b - a) / n
    print(f"Partição de [{a}, {b}] em {n} subintervalos")
    print(f"Amplitude de cada subintervalo: h = {h:.4f}")
    print("\nPontos de interpolação:")
    print("i      x_i        f(x_i)")
    for i, (xi, fi) in enumerate(zip(x_nodes, f_nodes)):
        print(f"{i:2d}  {xi:8.4f}  {fi:10.6f}")
    return x_nodes, f_nodes


def questao1_b(x_nodes, f_nodes):
    """Executa a alínea (b): constrói o polinómio interpolador e o spline.

    Args:
        x_nodes (array_like): Nós.
        f_nodes (array_like): Valores da função.

    Returns:
        tuple: (coeff_newton, coeffs_spline)
    """
    print("\n")
    print("QUESTÃO 1 (b): Polinómio Interpolador e Spline Cúbico Natural")
    coeff_newton = newton(x_nodes, f_nodes)
    print("\nCoeficientes do Polinómio de Newton:")
    for i, c in enumerate(coeff_newton):
        print(f"a[{i:2d}] = {c:15.8f}")
    M, coeffs_spline = cubic_spline_system(x_nodes, f_nodes)
    print("\nSegundas derivadas M_i (spline natural):")
    for i, Mi in enumerate(M):
        print(f"M[{i:2d}] = {Mi:15.8f}")
    x_test = np.array([0.1, 0.9])
    p_vals = avaliar_newton(x_nodes, coeff_newton, x_test)
    s_vals = avaliar_spline(coeffs_spline, x_test)
    print("\nAvaliação do polinómio e spline em pontos de teste:")
    print(f"{'x':>5} | {'p(x)':>15} | {'s(x)':>15}")
    for xv, pv, sv in zip(x_test, p_vals, s_vals):
        print(f"{xv:5.2f} | {pv:15.8f} | {sv:15.8f}")
    return coeff_newton, coeffs_spline

def questao1_c(x_nodes, f_nodes, coeff_newton, coeffs_spline):
    """Executa a alínea (c): calcula majorantes e erros reais.

    Args:
        x_nodes (array_like): Nós.
        f_nodes (array_like): Valores da função.
        coeff_newton (array_like): Coeficientes do polinómio interpolador.
        coeffs_spline (list): Coeficientes do spline cúbico.
    """
    print("\n")
    print("QUESTÃO 1 (c): Majorantes dos erros e erros reais")
    n = len(x_nodes) - 1
    h = x_nodes[1] - x_nodes[0]
    majorante_spline, majorantes_polinomio = calcular_majorantes_erro(x_nodes, n, h)
    pontos = [0.1, 0.9]
    print("\nMajorante do erro do spline cúbico natural:")
    print(f"   |f(x) - s(x)| ≤ {majorante_spline:.8e}")
    print("\nTabela de erros reais vs majorantes:")
    print(f"{'x':>5} | {'erro_p(x)':>15} | {'maj_p(x)':>15} | {'erro_s(x)':>15}")
    for x in pontos:
        f_real = f(x)
        p_val = avaliar_newton(x_nodes, coeff_newton, x)
        s_val = avaliar_spline(coeffs_spline, x)
        erro_p = abs(f_real - p_val)
        erro_s = abs(f_real - s_val)
        maj_p = majorantes_polinomio[x]
        print(f"{x:5.2f} | {erro_p:15.8e} | {maj_p:15.8e} | {erro_s:15.8e}")

if __name__ == "__main__":
    """
    Corre o código inteiro.
    """
    x_nodes, f_nodes = questao1_a()
    coeff_newton, coeffs_spline = questao1_b(x_nodes, f_nodes)
    graficos_alinea_b(x_nodes, f_nodes, coeff_newton, coeffs_spline)
    questao1_c(x_nodes, f_nodes, coeff_newton, coeffs_spline)


