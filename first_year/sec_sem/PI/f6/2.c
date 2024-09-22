#include <stdio.h>
#include <ctype.h>
#include <string.h>

int palindromo(char str[]) {
    int i = 0, j = strlen(str)-2;
    while (i <= j) {
        if (str[i]!= str[j]) {
            return 0;
        }
        i++;
        j--;
    }
    return 1;
}


int main(){
    char str[100];
    fgets(str,100,stdin);
    if (palindromo(str)) printf("palindromo\n");
    else printf("non palindromo\n");
    return 0;
}

