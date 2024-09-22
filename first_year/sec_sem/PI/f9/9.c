#include <stdio.h>
#include <string.h>

int comparar(char *str1, char *str2){
    if (strlen(str1) != strlen(str2)) return 0;
    while (*str1!='\0' && *str2!='\0'){
        if (*str1 != *str2) return 0;
        str1++;
        str2++;
    }
    return 1;
}

int main(){
    char str1[]="Eu sou programador", str2[]="Eu sou pador";
    printf("%d", comparar(str1, str2));
    return 0;
}