#include <stdio.h>


float calcular_epsilon_float() {
    float epsilon = 1.0f;
    while ((float)(1.0f + epsilon/2.0f) > 1.0f) {
        epsilon /= 2.0f;
    }
    return epsilon;
}

double calcular_epsilon_double() {
    double epsilon = 1.0;
    while ((1.0 + epsilon/2.0) > 1.0) {
        epsilon /= 2.0;
    }
    return epsilon;
}

int main() {
    float eps_f = calcular_epsilon_float();
    double eps_d = calcular_epsilon_double();
    printf("Epsilon da máquina (float): %.10e\n", eps_f);
    printf("Epsilon da máquina (double): %.20e\n", eps_d);
    return 0;
}