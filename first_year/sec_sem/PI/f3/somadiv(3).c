#include <stdio.h>

int soma_div(int n){
    int i=(n-1), soma=0;
    while (i!=0){
        if (n%i==0){
            soma+=i;
        }
        i--;
    }
    return soma;
}

int soma_div(int n){
    int i, soma=0;
    for (i=1;i<n;i++){
        if (n%i==0){
            soma+=i;
        }
    }
    return soma;
}