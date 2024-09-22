#include <stdio.h>
#define MAX 1000

void ordem(int vec[], int s, int n){
    int i, j;
    for (i=0; i<n; i++){
        if (vec[i]<=s && vec[i]!=0) continue;
        else {
            for (j=n; j>i; j--) {
                vec[j]=vec[j-1];
            }
            vec[i]=s;
            return;
        }
    }
}

int main() {
    int vec[MAX]={0}, n=0, s=0, i;
    while (scanf("%d", &s)==1 && s!=0){
        n++;
        ordem(vec, s, n);
    }
    for (i=0; i<n; i++){
        printf("%d ", vec[i]);
    }
    return 0;
}