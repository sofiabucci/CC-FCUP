#include <stdio.h>
#include <ctype.h>
#include <string.h>

void eliminar(char str[], char ch){
    for (int i=0; str[i]!='\0'; i++){ 
        if  (str[i]==ch) {
            while (str[i]!= '\0' ){
                str[i]=str[i+1];
                i++;
            }
        }
    }
}

int main(){
    char str[100], ch;
    fgets(str,100,stdin);
    scanf("%c", &ch );
    eliminar(str,ch);
    puts(str);
    return 0;
}