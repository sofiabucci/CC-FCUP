#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(){
    int l;
    printf("Número de linhas: ");
    scanf("%d\n",&l);

    FILE *f = fopen("linhas.txt","w");

    for (int i = 0; i < l; i++) {
        char linha[1000];
        fgets(linha, 1000, stdin);
        fprintf(f, "%s", linha);
    }

    fclose(f);
    return 0;
}

int main(){
    int l;
    printf("Número de linhas: ");
    scanf("%d\n",&l);

    FILE *f = fopen("ras.txt","w");

    for (int i = 0; i < l; i++) {
        fprintf(f, "linha %d\n", i+1);
    }
    printf("pronto");
    fclose(f);
    return 0;
}
