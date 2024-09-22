#include <stdio.h>

int mediana(int a, int b, int c){
    int mediana;

    if ((a<=b && b<=c) || (c<=b && b<=a))
        mediana = b;
    else if ((b<=a && a<=c) || (c<=a && a<=b))
        mediana = a;
    else 
        mediana = c;
    return mediana;
}

int main(){
    int a,b,c,m;
    printf("Primeiro valor: " );scanf("%d", &a);
    printf("Segundo valor: " );scanf("%d", &b);
    printf("Terceiro valor: " );scanf("%d", &c);

    m = mediana(a,b,c);
    
    printf("Mediana: %d \n", m);

    return 0;
}