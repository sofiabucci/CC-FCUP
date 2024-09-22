#include <stdio.h>

int main(){
    int a, b,c=1;
    scanf("%d %d", &a, &b);

    while (a != b) {
        printf("mdc(%d,%d) = ", a,b);
        c++;
        if(a > b)
            a = a - b;
        else
            b = b - a;
    }
    printf("mdc(%d,%d) = %d \n", a, a, a);
    printf("%d interações \n", c);
    return 0;
}