#include <stdio.h>
#include <ctype.h>
#include <string.h>

void capitalizar(char str[]){
    int i=0;

    while (str[i]!='\0'){
        if (islower(str[i])){
            str[i] = toupper(str[i]);
        }
        i++;
    }

    puts(str);
}

int main(){
    char str[100];
    fgets(str,100,stdin);
    capitalizar(str);
    return 0;
}