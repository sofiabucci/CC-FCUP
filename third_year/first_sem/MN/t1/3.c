
#include <stdio.h>
#include <math.h>


// Calcula a soma da série alternada de Leibniz para π
void calcular_serie2(double epsilon) {
    double S = 0.0, termo;
    int k = 0;
    double pi = 3.14159265358979323846; // Valor de referência para π

    // Loop principal: soma termos até o erro ser menor que epsilon
    do {
        // Termo da série alternada: alterna sinal a cada iteração
        termo = 4.0 * pow(-1, k) / (2*k + 1);
        S += termo; // Acumula o termo na soma
        k++;

        // O próximo termo serve como estimativa do erro (série alternada)
        double prox_termo = 4.0 / (2*k + 1);

        // Se o erro for menor que epsilon, paramos
    } while (prox_termo > epsilon);

    // Impressão dos resultados
    printf("ε = %e\n", epsilon); // Tolerância usada
    printf("Número de termos: %d\n", k); // Quantos termos foram somados
    printf("Valor aproximado de S: %.15f\n", S); // Aproximação de π
    printf("Erro absoluto efetivo (|π - S|): %.15f\n\n", fabs(pi - S)); // Diferença real para π
}


int main() {
    // Testa para três valores de epsilon
    calcular_serie2(1e-5);
    calcular_serie2(1e-10);
    calcular_serie2(1e-15);
    return 0;
}