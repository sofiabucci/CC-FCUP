#include <stdio.h>
#include <math.h>

// Função para calcular fatorial
double fatorial(int n) {
    double result = 1.0;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

void calcular_serie1(double epsilon) {
    double S = 0.0, termo, erro_absoluto;
    int k = 0;
    double pi = 3.14159265358979323846;
    
    do {
        // Calcula o termo: (2k)! / [4^k * (k!)^2 * (2k+1) * (0.5)^(2k+1)]
        double numerador = fatorial(2*k);
        double denominador = pow(4, k) * pow(fatorial(k), 2) * (2*k + 1) * pow(0.5, 2*k + 1);
        termo = numerador / denominador;
        
        S += termo;
        k++;
        
        // O próximo termo é uma majoração do erro
        double prox_numerador = fatorial(2*k);
        double prox_denominador = pow(4, k) * pow(fatorial(k), 2) * (2*k + 1) * pow(0.5, 2*k + 1);
        erro_absoluto = prox_numerador / prox_denominador;
        
    } while (erro_absoluto > epsilon);
    
    printf("ε = %e\n", epsilon);
    printf("Número de termos: %d\n", k);
    printf("Valor aproximado de S: %.15f\n", S);
    printf("Erro absoluto |π - S|: %.15f\n\n", fabs(pi - S));
}

int main() {
    calcular_serie1(1e-5);
    calcular_serie1(1e-10);
    calcular_serie1(1e-15);
    return 0;
}
