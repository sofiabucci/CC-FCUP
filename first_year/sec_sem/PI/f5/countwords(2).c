#include <stdio.h>
#include <ctype.h>

int main(){
    int palavras=0, ch=0, chb=0;
    chb=getchar();
    while ((ch=getchar()) != EOF){
        if ((isspace(ch)) && !(isspace(chb))){
            ++palavras;
        }
        chb=ch;
    }
    printf("%d\n", palavras);
    return 0;
}


