#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

int decimal(char str[]){
    int i=0, n=0;
    while (i<strlen(str)-1){ 
        n = n * 10 + (str[i] - '0');;
        i++;
    }
    return n;
}

int main(){
    char str[100];
    fgets(str,100,stdin);
    printf("%d\n",decimal(str));
    return 0;
}