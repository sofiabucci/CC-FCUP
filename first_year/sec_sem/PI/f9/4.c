#include <stdio.h>

void max_min(int vec[], int size, int *pmax, int *pmin){
    int min=vec[1], max=vec[1];
    for (int i = 1; i<size; i++){
        if (vec[i] > max) {
            max=vec[i];
        }
        else if (vec[i] < min){
            min=vec[i];
        }
    }

    *pmax=max;
    *pmin=min;
}

int main(){
    int vec[5] = {3,1,5,8,2}, size=5, pmin, pmax;
    max_min(vec, size, &pmax, &pmin);
    printf("%d %d \n", pmin, pmax);
    return 0;
}