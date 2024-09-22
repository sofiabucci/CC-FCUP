#include <stdio.h>

void a(){
    int n = 0;
    if (1 <= n <= 10)
    printf("n entre 1 e 10\n");
}
void av(){
    int n = 0;
    if (1 <= n && n <= 10)
    printf("n entre 1 e 10\n");
}
//output : n entre 1 e 10 (errado)

void b(){
    int i = 1;
    if (i == 2 || 3)
    printf("i igual 2 ou 3\n");
}
void bv(){
    int i = 1;
    if (i == 2 || i == 3)
    printf("i igual 2 ou 3\n");
}
//output : i igual 2 ou 3 (errado)

void c(){
    int i = 2, j = 1, k = 0;
    if(i==j==k)
    printf("i,j,k iguais\n");
}
void cv(){
    int i = 2, j = 1, k = 0;
    if(i==j && j==k)
    printf("i,j,k iguais\n");
}
//output : i,j,k iguais (errado)

void d(){
    int i = 1, j = 2, k = 3;
    if(i!=(j&&k))
    printf("i diferente j e k\n");
}
void dv(){
    int i = 1, j = 2, k = 3;
    if(i!=j && j!=k && k!=i)
    printf("i diferente j e k\n");
}
//output : void (errado)