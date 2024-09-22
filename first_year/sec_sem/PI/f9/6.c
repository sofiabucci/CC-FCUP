#include <stdio.h>

int contar_espacos(char *str){
    int espacos = 0;
    while(*str!='\0'){
        if(*str == ' ') espacos ++;
        str++;
    }
    return espacos;
}

int main(){
    char *str="Eu sou programador";
    printf("%d", contar_espacos(str));
    return 0;
}