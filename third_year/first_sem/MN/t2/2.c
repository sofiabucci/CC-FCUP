#include <stdio.h>  
#include <math.h>   

#define EPSILON 1e-12 // Tolerância para o critério de parada do método
#define MAX 1000 // número máximo de iterações

// Funções
double g1(double x) {
    return (x - pow(x, 3) - 4 * pow(x, 2) + 10);
}

double g2(double x) {
    return sqrt((10 / x) - 4 * x);  
}

double g3(double x) {
    return sqrt(10 - pow(x, 3)) * 1 / 2;  
}

double g4(double x) {
    return sqrt(10 / (4 + x));  
}

double g5(double x) {
    return (2 * pow(x, 3) + 4 * pow(x, 2) + 10) / (3 * pow(x, 2) + 8 * x);
}

// Função genérica para realizar o método iterativo de ponto fixo
void iterativo(double (*funcao)(double)) {
    double x0 = 1.5;  // chute inicial
    double x1;        // valor da próxima iteração
    int iter = 0;     // contador de iterações
        
    do {
        x1 = funcao(x0);  // aplica a função iterativa g(x)
        iter++;           // incrementa o contador

        // imprime o valor encontrado na iteração atual
        printf("x%d = %.10f\n", iter, x1);

        // verifica se atingiu o número máximo de iterações
        if (iter >= MAX) {
            printf("Não convergiu em %d iterações\n", MAX);
            break;  // sai do laço
        }

        // verifica se o valor se tornou indefinido ou infinito (divergência)
        if (isnan(x1) || isinf(x1)) {
            printf("Divergiu\n");
            break;
        }

        // critério de parada: diferença entre duas iterações sucessivas < EPSILON
        if (fabs(x1 - x0) < EPSILON) {
            printf("Convergiu em %d iterações\n", iter);
            break;
        }

        // atualiza o valor de x0 para a próxima iteração
        x0 = x1;

    } while (1);  // repete até convergir ou divergir
    
    printf("\n");  // linha em branco para separar os resultados
}

// Função principal
int main() {

    // Testa o método com cada uma das funções definidas
    iterativo(g1);
    iterativo(g2);
    iterativo(g3);
    iterativo(g4);
    iterativo(g5);
    
    return 0;  
}
