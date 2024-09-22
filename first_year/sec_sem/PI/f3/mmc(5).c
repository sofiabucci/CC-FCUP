#include <stdio.h>

int main(){
    int x, y, a, b, mmc=0, mdc=0;
    scanf(" %d %d", &x, &y);

    a=x, b=y;

    while( a%b !=0 ){
        mdc = a % b;
        a = b;
        b = mdc;
    }

    if (x%y==0){
        if (x>y)
            mdc=y;
        else
            mdc=x;
    }

    mmc = (x*y)/mdc;

    printf("%d \n", mmc);
    return 0;
}