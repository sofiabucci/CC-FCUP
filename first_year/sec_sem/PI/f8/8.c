#include <stdio.h>
#include <string.h>
#include <ctype.h>

int anagramas(char str1[], char str2[]){
    int i, j, k;
    int stra = strlen(str1), strb = strlen(str2);
    int freqa[26]={0}, freqb[26]={0};

    for (i = 0; i < stra; i++) {
            freqa[str1[i] - 'a']++;
    }
    for (j = 0; j < strb; j++) {
            freqb[str2[j] - 'a']++;
    }

    for (k = 0; k < 26; k++){
        if (freqa[k]!=freqb[k]) return 0;
    }
    return 1;
}

int main(){
    char str1[]="deposit",str2[]="topside";
    printf("%d\n", anagramas(str1,str2));
    return 0;
}