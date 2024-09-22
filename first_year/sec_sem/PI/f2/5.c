#include <stdio.h>

int main(){
    int a,b,c,mediana=0;
    printf("Primeiro valor: \n" );scanf("%d", &a);
    printf("Segundo valor: \n" );scanf("%d", &b);
    printf("Terceiro valor: \n" );scanf("%d", &c);

    if ((a<b && b<c) || (c<b && b<a))
        mediana = b;
    else if ((b<a && a<c) || (c<a && a<b))
        mediana = a;
    else 
        mediana = c;
    return mediana;

    printf("Mediana: %d \n", mediana);

    return 0;
}