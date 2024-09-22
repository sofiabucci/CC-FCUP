#include <stdio.h>

char *procurar(char *str, char ch){
    while (*str!='\0'){
        if(*str==ch) return str;
        str++;
    }
    return NULL;
}

int main(){
    char str[]="Eu sou programador";
    printf("%s", procurar(str, 's'));
    return 0;
}