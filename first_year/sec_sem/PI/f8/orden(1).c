#include <stdio.h>

int ordenada(int vec[], int size){
    int i;
    for (i=0; i<size-1; i++){
        if (vec[i]<=vec[i+1]) continue;
        else return 0;
    }
    return 1;
}