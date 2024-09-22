#include <stdio.h>
#include <ctype.h>

int charac(char c, char p[], int size){
    for (int i=0; i<size; i++){
        if (p[i]==c) return 1;
    }
    return 0;
}

int main(){
    int pontos=0, c=0;
    char p1[] = {'A','E','I','L','N','O','R','T','S','U'}, p2[] = {'D','G'}, p3[] = {'B','C','M','P'}, p4[] = {'F','H','V','W','Y'}, p5[] = {'K'}, p8[] = {'J','X'}, p10[] = {'Q','Z'};

    while ((c=getchar()) != EOF){
        if ((charac(c,p1,sizeof(p1)))==1) pontos+=1;
        else if ((charac(c,p2,sizeof(p2)))==1) pontos+=2;
        else if ((charac(c,p3,sizeof(p3)))==1) pontos+=3;
        else if ((charac(c,p4,sizeof(p4)))==1) pontos+=4;
        else if ((charac(c,p5,sizeof(p5)))==1) pontos+=5;
        else if ((charac(c,p8,sizeof(p8)))==1) pontos+=8;
        else if ((charac(c,p10,sizeof(p10)))==1) pontos+=10;
    }

    printf("%d\n", pontos);
    return 0;
}