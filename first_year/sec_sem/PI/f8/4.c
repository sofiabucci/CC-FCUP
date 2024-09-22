#include <stdio.h>
#define MAX 1000

int segundo_menor(int vec[], int size){
    int i, j;
    for (i=0; i<2; i++){
        for (j=(i+1); j<size; j++){
            if (vec[j]<vec[i]){
                int s=vec[i];
                vec[i]=vec[j];
                vec[j]=s;
            }
        }
    }
    return vec[1];
}

int main() {
    int vec[MAX]={}, n=0, i=0;
    while (scanf("%d", &n)==1){
        vec[i]=n;
        i++;
    }
    printf("O segundo menor número é: %d \n", segundo_menor(vec, i+1));
    return 0;
}