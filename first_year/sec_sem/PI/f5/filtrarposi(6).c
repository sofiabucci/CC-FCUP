#include <stdio.h>

int filtrarposi(int vec[], int size){
    int pos=0, cont=0;
    for (int i=0; i<size; i++){
        if (vec[i]>0) {
            vec[pos]=vec[i];
            pos++;
            cont++;
        }
    }
    return cont;
}