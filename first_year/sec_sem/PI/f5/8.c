#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define N 50


int repetidos(int vec[], int size){

    int val, cont=0;
    for (int i=0; i<size; i++){
        val=vec[i];
        for (int j=i+1; j<size; j++){
            if (vec[j]==val) cont++;
        }
    }
    return cont;

}

double proba(int vec[]){

    int fav=0;
    for (int i=0; i<N; i++) {
        srand((unsigned)time(NULL));
        vec[i]= 1 + rand()/(RAND_MAX/ 365 + 1);
    }
    fav=repetidos(vec, N);
    return (double)fav/N;

}

int main(){
    int vec[N], prob;
    printf("%lf", prob=proba(vec));
    return 0;
}