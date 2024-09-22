#include <stdio.h>
#define pi 3.1415

int main(){
    int r, v;

    printf("Radio=? \n"); scanf( "%d", &r);
    v=4/3*pi*(r*r*r);

    printf("Volume da esfera= %d /n", v);

    return 0;
}