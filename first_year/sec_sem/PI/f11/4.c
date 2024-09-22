#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int numero_linhas(char *ficheiro){
    int n=0;
    char palavra[1024];
    FILE *f = fopen(ficheiro,"r");

    while (fgets(palavra,sizeof(palavra),f) != NULL){
        n++;
    }

    fclose(f);
    return n;
}

int numero_linhas(char *ficheiro){
    int n=0;
    char c;
    FILE *f = fopen(ficheiro,"r");

    while (fscanf(f,"%c",&c) != EOF){
        if (c=='\n') n++;
    }

    fclose(f);
    return n;
}

int main(){
    int n=0;
    char ficheiro[]="uniao.txt";

    n=numero_linhas(ficheiro);

    printf("%d\n", n);
    return 0;
}