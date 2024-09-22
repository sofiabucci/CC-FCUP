#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 1000000

double distrunif(double x, double a, double b){

    int fav=0;
    for (int i=0; i<N; i++) {
        srand((unsigned)time(NULL));
        int xn = a + rand()/(RAND_MAX/b + a);
        if (xn<=x)  fav++;
    }
    printf("Probabilidade estimada: %lf \n", (double)fav/N);
    return (double)fav/N;

}

int main(){
    double probexata, x, a, b, prob;
    scanf("%lf %lf %lf", &x, &a, &b);
    if (x<a) probexata=0;
    else if (x>=a && x<b) probexata=(x-a)/(b-a);
    else probexata=0;
    printf("Probabilidade exata: %lf \n", probexata);
    prob=distrunif(x, a, b);
    if (prob==probexata) printf("Probabilidades iguais \n");
    return 0;
}