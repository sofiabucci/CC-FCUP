#include <stdio.h>

int main(){
    int n, q=0;
    float media=0;

    do {
        scanf("%d", &n); 
        media+=n;
        ++q;
    }
    while (n!=0);
    media = media/(q-1);

    printf("%d", media);

    return 0;
}

#include <stdio.h>

int main(){
    int n, q=0;
    float media=0;

    scanf("%d", &n); 
    while (n!=0){
        media+=n;
        q++;
        scanf("%d", &n); 
    };

    media = media/q;

    printf("%f \n", media);

    return 0;
}