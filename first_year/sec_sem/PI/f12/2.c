#include <stdio.h>
#include <stdlib.h>


struct node{int info; struct node *next;};

struct node *novo_elemento(int info){
    struct node *p=(struct node *)malloc(sizeof(struct node));
    if(p != NULL){
        p->info=info;
        p->next=NULL;
    }
    return p;
}

struct node *vec2list(int vec[], int num){

    struct node *head=novo_elemento(vec[0]);
    struct node *list;
    list=head;

    for (int i=1; i<num; i++){
        list->next=novo_elemento(vec[i]);
        list=list->next;
    }   

    return head;
}

void imprimir(struct node *first){
    struct node *p = NULL;
    for(p=first; p!=NULL;p=p->next){
        printf("%d \n", p->info);
    }
}

int main(){
    int a[]={5,4,2,1,3};
    struct node *s= vec2list(a,4);
    imprimir(s);
    return 0;
}