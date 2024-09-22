#include <stdio.h>
#define MAX 1000

void ordenar(char str[]){
    int i, j;
    for (i=0; str[i]!='\0'; i++){
        for (j=(i+1); str[j]!='\0'; j++){
            if (str[i]>str[j]){
                char s = str[i];
                str[i] = str[j];
                str[j] = s;
            }
        }
    }
    return;
}

int main(){
    char str[]="ALGORITMO";
    ordenar(str);
    puts(str);
    return 0;
}