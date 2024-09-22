#include <stdio.h>
#define TRUE 1
#define FALSE 0

int primo(int i){
    for (int a=2; a*a <= i; a++){
        if (i%a == 0)
            return FALSE;
    }
    return TRUE;
}

int main(){
    int  n, i=2;
    printf("Limite superior? "); scanf("%d", &n);

    for (i; i<=n; i++){
        if (primo(i)==TRUE)
            printf("%d ", i);
    }

    return 0;
}