#include <stdio.h>

int main(){
    int qnt, vinte=0, dez=0, cinco=0, um=0;
    printf("Quantia em EUR? ");scanf("%d", &qnt);

    if (qnt >= 20){
        vinte = qnt/20;
        qnt =  qnt%20;
    };
    if (qnt >= 10){
        dez = qnt/10;
        qnt =  qnt%10;
    };
    if (qnt >= 5){
        cinco = qnt/5;
        qnt =  qnt%5;
    };
    if (qnt >= 1){
        um = qnt;
        qnt =  0;
    };
        

    printf("notas EUR 20: %d \n", vinte);
    printf("notas EUR 10: %d \n", dez);
    printf("notas EUR 5: %d \n", cinco);
    printf("moedas EUR 1: %d \n", um);

    return 0;
}