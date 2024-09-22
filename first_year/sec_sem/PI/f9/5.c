#include <stdio.h>

int mdc(int a, int b){
    if (b == 0) return a;
    return mdc(b, a%b);
}

void reduzir(int *pnum, int *pdenom){
    int div = mdc(*pnum, *pdenom);
    *pnum /= div; 
    *pdenom /= div;
}

int main(){
    int num=25, denom=10;
    reduzir(&num , &denom);
    printf("%d/%d\n", num, denom);
    return 0;
}
