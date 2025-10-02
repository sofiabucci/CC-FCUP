#include <stdio.h>
#include <math.h>

void calcular_serie2(double epsilon) {
    double S = 0.0, termo;
    int k = 0;
    double pi = 3.14159265358979323846;
    
    do {
        // Calcula o termo: 4 * (-1)^k / (2k + 1)
        termo = 4.0 * pow(-1, k) / (2*k + 1);
        S += termo;
        k++;
        
        // O próximo termo é uma majoração do erro (série alternada)
        double prox_termo = 4.0 / (2*k + 1);
        
    } while (prox_termo > epsilon);
    
    printf("ε = %e\n", epsilon);
    printf("Número de termos: %d\n", k);
    printf("Valor aproximado de S: %.15f\n", S);
    printf("Erro absoluto |π - S|: %.15f\n\n", fabs(pi - S));
}

int main() {
    calcular_serie2(1e-5);
    calcular_serie2(1e-10);
    calcular_serie2(1e-15);
    return 0;
}