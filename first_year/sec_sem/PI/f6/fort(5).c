#include <stdio.h>
#include <ctype.h>
#include <string.h>

int forte(char str[]){
    int i=0, l=0, u=0, d=0;
    if (strlen(str) > 1 && strlen(str)-1>=6){
        while (i<strlen(str)){
            if (isdigit(str[i])) d++;
            if (islower(str[i])) l++;
            if (isupper(str[i])) u++;
            i++;
            if (d>0 && l>0 && u>0) return 1;
        }
    }
    return 0;
}


int main(){
    char str[100];
    fgets(str,100,stdin);
    printf("%d\n",forte(str));
    return 0;
}