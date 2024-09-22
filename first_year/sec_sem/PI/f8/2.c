#include <stdio.h>

int desordem(int vec[], int size){
    int i, s=0;
    for (i=0; i<size-1; i++){
        if (vec[i]>vec[i+1]) s+=1;
    }
    return s;
}