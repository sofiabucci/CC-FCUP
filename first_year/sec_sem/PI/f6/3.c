#include <stdio.h>
#include <ctype.h>
#include <string.h>

int todos_letras(char str[]){
    int i=0;
    while (i<strlen(str)-2){
        if (!isalpha(str[i])){
            return 0;
        }
        i++;
    }
    return 1;
}

int main(){
    char str[100];
    fgets(str,100,stdin);
    printf("%d\n",todos_letras(str));
    return 0;
}