#include <stdio.h>
#include <stdlib.h>


struct node{int info; struct node *next;};


void ordenar(int vec[], int size){
    int i, j;
    for (i=0; i<size; i++){
        for (j=(i+1); j<size; j++){
            if (vec[i]>vec[j]){
                int a = vec[i];
                vec[i] = vec[j];
                vec[j] = a;
            }
        }
    }
}

void imprimir_ord(struct node *first, int num_elementos){
    int vec[num_elementos];
    for(int i=0; i<num_elementos; i++){
        vec[i]=first->info;
        first=first->next;
    }

    ordenar(vec, num_elementos);

    for(int i=0; i<num_elementos; i++){
        printf("%d\n",vec[i]);
    }

}

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


int main(){
    int a[]={5,2,4,1,3};
    struct node *s= vec2list(a,5);
    imprimir_ord(s,5);
    return 0;
}