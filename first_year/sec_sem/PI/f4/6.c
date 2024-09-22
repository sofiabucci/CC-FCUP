#include <stdio.h>
#include <stdlib.h>
#define PERG 10

int tabuada(){
    int a = 1 + rand()/(RAND_MAX/9 +1);
    int b = 1 + rand()/(RAND_MAX/9 +1);
    int c = a*b;
    printf("Quanto é %d x %d ? \n", a, b);
    return c;
}

int main(){
    int c, d, certo=0, errado=0;
    for (int i = 0; i<=PERG; i++){
        c = tabuada(); scanf("%d", &d );
        if (c==d) {
            printf("Certo! \n"); 
            certo++;
        }
        else {
            printf("Errado! \n");
            errado++;
        }
    }
    printf("Certas = %d \nErradas = %d \n", certo, errado);
    return 0;
}