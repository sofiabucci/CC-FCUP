#include <stdio.h>
#include <ctype.h>

int main(){
    int ch=0, letras=0;
    while((ch=getchar()) != '\n'){
        if (isalpha(ch)) letras++;
    }
    printf("A frase contém %d letras \n", letras);
    return 0;
}
