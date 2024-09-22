#include <stdio.h>
#include <ctype.h>

void range(int vec[], unsigned size, int inicio, int incr){
    for (int i=0; i<size; i++){
        vec[i]=inicio+incr*i;
    }
}