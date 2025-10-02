#include <stdio.h>

double calcular_epsilon() {
    double epsilon = 1.0;
    
    while (1.0 + epsilon > 1.0) {
        epsilon /= 2.0;
    }
    
    return epsilon * 2.0;
}

int main() {
    double eps = calcular_epsilon();
    printf("Épsilon da máquina: %e\n", eps);
    return 0;
}