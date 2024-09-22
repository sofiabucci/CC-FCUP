#include <stdio.h>
#define TRUE 1
#define FALSE 0


int primo(int i){
    if (i<=1)
        return FALSE;
    for (int a=2; a*a <= i; a++){
        if (i%a == 0)
            return FALSE;
    }
    return TRUE;
}

int main(){
    int  n, p1=0, p2=0;
    scanf("%d", &n);

    while (p1==0 && p2==0){
        if (primo(n)==TRUE && primo(n+2)==TRUE){
            p1=n; p2=n+2;
        }

        n++;
    }

    printf("(%d,%d) \n", p1, p2);
    return 0;
}