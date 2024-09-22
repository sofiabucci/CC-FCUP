#include <stdio.h>

int bissexto(int n){
    if ((n%4==0 && n%100!=0) || (n%400==0))
        return 1;
    else
        return 0;
}

int main(){
    int n, b;
    
    scanf("%d", &n);
    b = bissexto(n);

    if  (b == 1)
        printf("O ano %d é bissexto.\n", n);
    else
        printf("O ano %d não é bissexto. \n", n);

    return 0;
}