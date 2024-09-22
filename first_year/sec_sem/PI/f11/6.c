#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void copy(FILE *origem, FILE *destino){
    int c;
    while ((c = fgetc(origem)) != EOF) {
        fputc(c, destino);
    }
    fputc('\n', destino);
}

int main(){
    FILE *f1 = fopen("ficheiro1.txt", "r");
    FILE *f2 = fopen("ficheiro2.txt", "r");
    FILE *uniao = fopen("uniao.txt","w");

    copy(f1, uniao);
    copy(f2, uniao);

    fclose(f1);
    fclose(f2);
    fclose(uniao);

    return 0;
}