#include <stdio.h>
#define N 10

int identidade(int mat[N][N]){
    for (int i=0; i<N; i++){
        for (int j=0; j<N; j++){
            if ((j==i)&&(mat[i][j]!=1)) return 0;
            else if ((j!=i)&&(mat[i][j]!=0)) return 0;
        }
    }
    return 1;
}

