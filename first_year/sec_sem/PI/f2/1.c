#include <stdio.h>

void a(){
    int i = 10, j = 5;
    printf("%d", !i < j);
}
//output : 1 verdade

void b(){
    int i = 2, j = 1;
    printf("%d", !!i + !j);
}
//output :1 verdade

void c(){
    int i = 5, j = 0, k = -5;
    printf("%d", i && j || k);
}
//output : 1 verdade

void d(){
    int i = 1, j = 2, k = 3;
    printf("%d", i < j || k);
}
//output : 1 verdade

void e(){
    int i = 3, j = 4, k = 5;
    printf("%d",i < j || ++j < k);
    printf("%d %d %d", i, j, k);
}
//output : 1 verdade, 3 4 5 não vira 5 pq não executa dps de falso

void f(){
    int i = 7, j = 8, k = 9;
    printf("%d ", i - 7 && j++ < k);
    printf("%d %d %d", i, j, k);
}
//output : 0 falso, 7 8 9 não vira 9 pq a exp foi falsa




