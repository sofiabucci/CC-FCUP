#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct data{int dia, mes, ano;} Data;

typedef struct info{int num_cliente; char *nome; int idade; char *prof; Data data;} Info;

struct node{Info info; struct node *next;};

struct node *adicionar(struct node *registro, int num, char *nome,
int idade, char *prof, Data data){
    struct node *p=(struct node *)malloc(sizeof(struct node));
    if(p != NULL){
        p->info.num_cliente=num;
        strcpy(p->info.nome, nome);
        p->info.idade=idade;
        strcpy(p->info.prof, prof);
        p->info.data=data;
        p->next=NULL;
    }
    return p;
}

void imprimir_num(struct node *registro, int num){
    struct node *temp=registro;
    for(; temp!=NULL && temp->info.num_cliente!=num; temp=temp->next);

    printf("%s\n", temp->info.nome);
    printf("%d\n", temp->info.idade);
    printf("%s\n", temp->info.prof);
    printf("%d/%d/%d\n", temp->info.data.dia, temp->info.data.mes, temp->info.data.ano);
}

void imprimir_nome(struct node *registro, char *palavranome){
    struct node *temp=registro;
    while(temp!=NULL){
        if(strstr(temp->info.nome, palavranome)!=NULL){
            printf("%s\n", temp->info.nome);
        printf("%d\n", temp->info.idade);
        printf("%s\n", temp->info.prof);
        printf("%d/%d/%d\n", temp->info.data.dia, temp->info.data.mes, temp->info.data.ano);
        }
        temp=temp->next;
    }
}

struct node *apagar(struct node *registro, int num){
    struct node *curr, *prev;
    for(curr=registro, prev = NULL;
        curr != NULL && curr->info.num_cliente != num;
        prev=curr, curr=curr->next);
        
    if(curr==NULL)
        return registro; 
    if(prev==NULL)
        registro = registro->next; 
    else
        prev->next = curr->next; 

    free(curr);
    return registro;
}

int escrever(struct node *registro, char *nome_ficheiro){
    FILE *f=fopen(nome_ficheiro, "wb");
    int n=-1;

    while(registro!=NULL){
        n=fwrite(&(registro->info), sizeof(Info), 1, f);
        registro=registro->next;
    }

    fclose(f);
    return n;
}