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

struct node *ins_inicio(struct node *first, int info){
    struct node *p = novo_elemento(info); 
    if(p==NULL)
        return first;
    
    p->next=first;

    return p;
}

struct node *ins_fim(struct node *first, int info){
    struct node *p = novo_elemento(info);
    struct node *curr = NULL;
    if(p==NULL)
        return first;
   
    if(first==NULL){
        first = p;
        return first;
    }

    else{
        for(curr=first; curr->next!=NULL;curr=curr->next);
        curr->next=p;
        return first;
    }
}

struct node *eliminar(struct node *first, int info){
    struct node *curr, *prev;
    for(curr=first, prev = NULL;
        curr != NULL && curr->info != info;
        prev=curr, curr=curr->next);
        
    if(curr==NULL)
        return first; 
    if(prev==NULL)
        first = first->next; 
    else
        prev->next = curr->next; 

    free(curr);
    return first;
}

struct node *procura(struct node *first, int info){
    for(; first!=NULL && first->info!=info; first=first->next);

    return first;
}

void imprimir(struct node *first){
    struct node *p = NULL;
    for(p=first; p!=NULL;p=p->next){
        printf("%d \n", p->info);
    }
}

void apagar_lista(struct node *first){
    struct node *p = NULL;
    while(first){
        p=first;
        first=first->next;
        free(p);
    }
}

int main(){
    struct node *list=NULL;
    struct node *first;
    
    /* adiciona 10 e 20 ao inicio */
    list=ins_inicio(list,10);
    list=ins_inicio(list,20);

    /* imprime lista */
    first=list;
    imprimir(first);

    /* adiciona 30 e 40 ao final */
    first=ins_fim(first, 30);
    first=ins_fim(first, 40);

    /* eliminar 20 */
    first=eliminar(first,20);

    /* imprime lista */
    imprimir(first);

    /* procure 15 */
    first=procura(first,15);

    /* apague a lista */
    apagar_lista(first);

    /* imprime lista */
    imprimir(first);

    return 0;
}