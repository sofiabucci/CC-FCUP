#include <stdio.h>

int main(){
    float x, exp;
    scanf("%f", &x);

    exp = (3*(x*x*x*x*x)) + (2*(x*x*x*x)) - (5*(x*x*x))- (x*x) + (7*x) - 6 ;

    printf("%f", exp);
    return 0;
}