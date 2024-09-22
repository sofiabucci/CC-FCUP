#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    int y, t=1;
    srand((unsigned)time(NULL));
    int a = 1 + rand()/(RAND_MAX/100 + 1);
    do {
        printf("Introduza uma tentativa: \n"); scanf("%d", &y);
        if (y == a) break;
        else {
            t++;
            if (y>a) printf("Demasiado alto! \n");
            else printf("Demasiado baixo!\n");
        }
    } while (y != a);
    printf("Acertou em %d tentativas! \n", t);
    return 0;
}