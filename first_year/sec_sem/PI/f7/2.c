#include <stdio.h>
#include <assert.h>

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

int min(int a, int b, int c){
    if (a<b){
        if (a<c) return a;
        else return c;
    }
    else if (b<a){
        if (b<c) return b;
        else return c;
    }
}


int max(int a, int b, int c){
    if (a>b){
        if (a>c) return a;
        else return c;
    }
    else if (b>a){
        if (b>c) return b;
        else return c;
    }
}


int main(){
    int a,b,c,m;
    printf("Primeiro valor: " );scanf("%d", &a);
    printf("Segundo valor: " );scanf("%d", &b);
    printf("Terceiro valor: " );scanf("%d", &c);

    m = mediana(a,b,c);
    assert(min(a,b,c)<=m && m<=max(a,b,c));
    
    printf("Mediana: %d \n", m);

    return 0;
}