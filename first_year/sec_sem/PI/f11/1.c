#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


void maior(char **palavras){
    int m = strlen(palavras[0]);
    char m_palavra[100] = NULL;

    for (int i=1; palavras[i]!=NULL; i++){
        if (strlen(palavras[i]) > m){
            m = strlen(palavras[i]);
            strcpy(m_palavra, palavras[i]);
        }
    }

    printf("%s", m_palavra);
}


void rem_palavra(char **palavras, char *palavra){
    
    for (int i=0; palavras[i]!=NULL; i++){
        if (strcmp(palavras[i],palavra)==0){
            for (int j=i; palavras[j]!=NULL; j++){
                strcpy(palavras[j],palavras[j+1]);
            }
        }
    }

}


void sem_repetidos(char **palavras){
    char **output = (char **)malloc(sizeof(char *) * 100);
    output[0]=NULL;
    int oi=0;

    for (int i=0; palavras[i]!=NULL; i++){
        char *aux=palavras[i];
        int j;
        for (j=0; output[j]!=NULL; j++){
            if (strcmp(aux,output[j])==0) break;
        }
        if (output[j]==NULL){
            output[oi] = (char *)malloc(strlen(aux) + 1);
            strcpy(output[oi],aux);
            oi++;
            output[oi]=NULL;
        } 
    }

    for (int i=0; output[i]!=NULL; i++){
        printf("%s\n",output[i]);
    }
    for (int i = 0; output[i] != NULL; i++) {
        free(output[i]);
    }
    free(output);

}


void strrev(char *palavra){
    char *stra = palavra + strlen(palavra) - 1;
    while (stra>palavra){
        char a = *palavra;
        *palavra=*stra;
        *stra=a;
        palavra++;
        stra--;
    }
}

void palindromos(char **palavras){
    int oi=0;
    char **output = (char **)malloc(sizeof(char *) * 100);
    output[0]=NULL;

    for (int i=0; palavras[i]!=NULL; i++){
        char *str=strdup(palavras[i]);
        strrev(str);
        if (strcmp(str,palavras[i])==0){
            output[oi] = (char *)malloc(strlen(palavras[i]) + 1);
            strcpy(output[oi],palavras[i]);
            oi++;
            output[oi]=NULL;
        }
    }

    for (int i=0; output[i]!=NULL; i++){
        printf("%s\n",output[i]);
    }
}

void cifrar(char **palavras, int n){

}

void ordenar(char **palavras){
    int n=0;
    while(palavras[n]!=NULL){
        n++;
    }

    for (int i=0; i<n-1; i++){
        for (int j=i+1; j<n; j++){
            if (strcmp(palavras[i],palavras[j])>0){
                char *aux=palavras[i];
                palavras[i]=palavras[j];
                palavras[j]=aux;
            }
        }
    }

    for(int i=0;i<n;i++){
        printf("%s\n", palavras[i]);
    }
}


int main(){
    char *palavras[100];
    char palavra[100];
    int n = 0;

    while (1){
        scanf("%s", palavra);
        if (strcmp(palavra, "") == 0) break;
        strcpy(palavras[n],palavra);
        n++;
    }
    
    return 0;
}