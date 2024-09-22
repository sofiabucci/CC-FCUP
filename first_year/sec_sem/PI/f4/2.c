#include <stdio.h>

int somadig(int n){

    if (n==0) return n;
    else return n%10 + somadig(n/10);

}

int main(){
    int n;
    scanf("%d", &n);
    printf("%d\n", somadig(n));
    return 0;
}