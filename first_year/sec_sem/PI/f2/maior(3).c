#include <stdio.h>

int main(){
    int a,b,c,maior;
    scanf("%d %d %d", &a, &b, &c);
    if (a>b)
        maior=a;
    else
        maior=b;
    if (c > maior)
        maior = c;
    printf("%d\n", maior);
    return 0;
}