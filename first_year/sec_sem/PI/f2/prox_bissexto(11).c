#include <stdio.h>

int prox_bissexto(int n){
    if ((n%4==0 && n%100!=0) || (n%400==0))
        return n;
    else
        do{
            ++n;
        }
        while (!((n%4==0 && n%100!=0) || (n%400==0)));
        return n;

}

int main(){
    int n, a;

    scanf("%d", &n);
    a=prox_bissexto(n);

    printf("O próximo ano bissexto é %d", a);

    return 0;
}