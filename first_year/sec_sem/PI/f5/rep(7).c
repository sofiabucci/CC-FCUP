#include <stdio.h>

int repetidos(int vec[], int size){
    int val;
    for (int i=0; i<size; i++){
        val=vec[i];
        for (int j=i+1; j<size; j++){
            if (vec[j]==val) return 1;
        }
    }
    return 0;
}



int remrep(int vec[], unsigned size){
    for (int i=0;i<size;i++){
        for (int j=i+1;j<size;){
            if (vec[j]==vec[i]) {
                for (int k=j; k<size-1;k++) {
                    vec[k]=vec[k+1];
                }
                (size)--;
                }
            else j++;
        }}
    for (int i=0;i<size;i++){
        printf("%d  ", vec[i]);
    }
    return 0;
}

int main(){
    int vec[6]={0,1,3,2,4,1};
    unsigned size = 6;
    eremrep(vec,size);
    return 0;
}