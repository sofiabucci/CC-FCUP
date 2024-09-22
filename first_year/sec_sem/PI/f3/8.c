#include <stdio.h>
#define TRUE 1
#define FALSE 0

int quadperfct(int a){
    int soma=0;
    for (int i=0; i<a; i++){
        soma+=(2*i)+1;
        if (soma == a)
            return TRUE;
    }
    return FALSE;
}

int  main() {
    int a, x;
    scanf("%d", &a);
    x=quadperfct(a);
    printf("%d \n", x);
    return 0;
}
