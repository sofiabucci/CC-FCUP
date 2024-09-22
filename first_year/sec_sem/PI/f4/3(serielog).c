#include <stdio.h>

double serielog(double x, int n){

    double px=x, pi=1;
    if (n==1) return x;
    else {
        for (int i = 2 ;i <= n ; ++i){
            px*=x;
            pi*=-1;
            }};
    return ((pi * ((px)/n)) + serielog(x, n-1));    

}

int main(){
    double x; int n;
    scanf("%lf, %d", &x, &n);
    printf("%lf", serielog(x, n));
    return 0;
}