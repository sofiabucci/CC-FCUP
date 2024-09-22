#include <stdio.h>

int main(){
    float x, exp;
    scanf("%f", &x);

    exp = ((((3*x + 2)*x - 5)*x - 1)*x + 7)*x - 6 ;

    printf("%f", exp);
    return 0;
}