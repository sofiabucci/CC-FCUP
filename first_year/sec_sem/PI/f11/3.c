#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(){
    FILE *f = fopen("linhas.txt","r");
    int n=0;
    char linha[1000][1000];

    while (fgets(linha[n],1000,f) != NULL){
        n++;
    }

    fclose(f);
    for (int i=0; i<n; i++){
        printf("%s\n",linha[i]);
    }
    return 0;
}