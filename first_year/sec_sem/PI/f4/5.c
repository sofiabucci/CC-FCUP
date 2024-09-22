#include <stdio.h>
#include <stdlib.h>

int a(){
    int a = rand() % 10;
    return a;
}
int b(){
    int b = rand() % (10 + 1);
    return b;
}
int c(){
    int c = rand() % (100 + 1);
    return c;
}
int d(){
    int d = rand() % (21 - 10);
    return d;
}
int par(){
    int par;
    par = rand() % (100 + 10);
    if (par % 2 != 0) par++;
    return par;
}
int impar(){
    int impar;
    impar = rand() % (99 + 1);
    if (impar % 2 == 0) impar++;
    return impar;
}
double e(){
    double e = (double)rand() / RAND_MAX + 1.0;
    return e;
}
double f(){
    double f = (double)rand() / (RAND_MAX / 2) - 1.0 ;
    return f;
}

int main(){
    printf("%d \n%d \n%d \n%d \n%d \n%d \n%lf \n%lf \n", a(), b(), c(), d(), par(), impar(), e(), f());
    return 0;
}