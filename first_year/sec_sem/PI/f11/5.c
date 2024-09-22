#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main(){
    int n_palavras=0;
    char palavra[100];
    FILE *f = fopen("ras.txt","r");

    while (fscanf (f, "%99s", palavra) == 1){
        n_palavras++;
    }

    fclose(f);
    printf("%d\n",n_palavras);
    return 0;
}
