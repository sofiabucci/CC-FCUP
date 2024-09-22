#include <stdio.h>
#include <string.h>

void inverter(char *str){
    char *stra = str + strlen(str) - 1;
    while (stra>str){
        char a = *str;
        *str=*stra;
        *stra=a;
        str++;
        stra--;
    }
}

int main(){
    char str[]="Eu sou programador";
    inverter(str);
    puts(str);
    return 0;
}