#include <stdio.h>

int potencia(int x, int n){
    int a=x;
    if (n==0)
        return 1;
    for (int i=1; i<n; ++i)
        x *= a;
    return x;
}

int main(){
    int x, n,a;
    scanf("%d^%d", &x, &n);
    a = potencia(x,n);
    printf("%d", a);
    return 0;
}
