#include <stdio.h>

int countbig(int vec[], int size, int val){
    int cont=0;
    for (int i=0; i<size; i++){
        if (vec[i]>val) cont++;
    }
    return cont;
}

int main(){
    int vec[] = {1,2,3,4,5}, val, size=sizeof(vec)/sizeof(vec[0]);
    scanf("%d", &val);
    printf("%d\n", countbig(vec, size, val)); 
    return 0;
}