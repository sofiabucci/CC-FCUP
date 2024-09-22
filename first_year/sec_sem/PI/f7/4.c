#include <stdio.h>

int repetido(int n, int vec[], int size){
    int i;
    for  (i=0; i < size; i++){
        if (n == vec[i]) return 0;
    }
    return 1;
}

int main(){
    int vec[100], n, i=0;
    scanf("%d", &n);
    while(n!=-1){
        if (repetido(n,vec,i)==1) {
            vec[i++]=n;
        }   
        scanf("%d", &n);
    }
    for (int j=0; j<i; j++){
        printf("%d\n", vec[j]);
    }
    return 0;
}

