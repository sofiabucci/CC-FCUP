#include <stdio.h>

int main(){
    int num, den, a, b, mdc;
    printf("Numerador: ");scanf("%d", &num);
    printf("Denominador: ");scanf("%d", &den);

    a=num; b=den;
    do{
        mdc = a % b;
        a = b;
        b = mdc;
    }
    while( a%b !=0 );

    printf("A fração %d/%d é equivalente a %d/%d \n", num, den, (num/mdc), (den/mdc));
    return 0;
}