
#include <stdio.h>
#include <math.h>


// Calcula o fatorial de n (simples, sem otimizações)
double fatorial(int n) {
    double result = 1.0;
    for (int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}


// Calcula a soma da série para π usando o critério de erro absoluto
void calcular_serie1(double epsilon) {
    double S = 0.0, termo, erro_absoluto;
    int k = 0;
    double pi = 3.14159265358979323846; // Valor de referência para π

    // Loop principal: soma termos até o erro ser menor que epsilon
    do {
        // Calcula o termo da série conforme a fórmula
        double numerador = fatorial(2*k);
        double denominador = pow(4, k) * pow(fatorial(k), 2) * (2*k + 1) * pow(0.5, 2*k + 1);
        termo = numerador / denominador;

        S += termo; // Acumula o termo na soma
        k++;

        // O próximo termo serve como estimativa do erro
        double prox_numerador = fatorial(2*k);
        double prox_denominador = pow(4, k) * pow(fatorial(k), 2) * (2*k + 1) * pow(0.5, 2*k + 1);
        erro_absoluto = prox_numerador / prox_denominador;

        // Se o erro for menor que epsilon, paramos
    } while (erro_absoluto > epsilon);

    // Impressão dos resultados
    printf("ε = %e\n", epsilon); // Tolerância usada
    printf("Número de termos: %d\n", k); // Quantos termos foram somados
    printf("Valor aproximado de S: %.15f\n", S); // Aproximação de π
    printf("Erro absoluto efetivo (|π - S|): %.15f\n\n", fabs(pi - S)); // Diferença real para π
}


int main() {
    // Testa para três valores de epsilon
    calcular_serie1(1e-5);
    calcular_serie1(1e-10);
    calcular_serie1(1e-15);
    return 0;
}
