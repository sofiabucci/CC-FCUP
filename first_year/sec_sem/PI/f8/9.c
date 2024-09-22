#include <stdio.h>
#include <string.h>
#include <ctype.h>
#define MAX 1000


void normalizar(char str[]){
    for (int i=0; i<strlen(str); i++){
        if (isalpha(str[i])){
            str[i] = tolower(str[i]);
        }
        else {
            for(int j=i; j<strlen(str); j++){
                str[j]=str[j+1];
            }
            i--;
        }
        
    }
}


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
    char str1[]="Quid est veritas?",str2[]="Est vir qui adest";
    normalizar(str1); normalizar(str2);
    printf("%d \n", anagramas(str1,str2));
    return 0;
}