#include <stdio.h> 

int main(){
    int n;
    printf("Numero inteiro: ");scanf("%d", &n);

    if (n<=1){
        printf("Numero fornecido inválido");
        return 0;
    }
        
    printf("%d: ", n);

    for (int i=2; i<=n; i++){
        while (n%i==0){
            printf("%d ", i);
            n=n/i;
        }
    }

    return 0;
}