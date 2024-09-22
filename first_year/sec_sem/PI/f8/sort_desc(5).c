#include <stdio.h>
#define MAX 1000

void sort_desc(int vec[], int n){
    int i, j;
    for (i=0; i<n; i++){
        for (j=(i+1); j<n; j++){
            if (vec[i]>vec[j]) continue;
            else {
                int s=vec[i];
                vec[i]=vec[j];
                vec[j]=s;
            }
        }
    }
    return;
}