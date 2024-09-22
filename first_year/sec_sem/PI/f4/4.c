#include <stdio.h>

double babilonico(double a, double x, double ep){

    double xn = 0.5*(x+a/x);
    if (abs(xn-x) < ep) return xn;
    else return babilonico(a, xn, ep);

}

int main(){
    double a, ep=0.01;
    scanf("%lf", &a);
    printf("%lf \n", babilonico(a, a/2, ep));
    return 0;
}