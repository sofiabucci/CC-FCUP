#include <stdio.h>
#include <math.h> 

typedef struct data{int dia, mes, ano;} Data;

int comparar(Data d1, Data d2){
    if (d1.ano > d2.ano) return -1;
    else if (d1.ano <  d2.ano) return 1;
    else {
        if (d1.mes  > d2.mes) return -1;
        else if (d1.mes < d2.mes) return 1;
        else {
            if (d1.dia  > d2.dia) return -1;
            else if  (d1.dia < d2.dia) return 1;
            else return 0;
        }
    }
}

void ordena_datas(Data vec_datas[], int size){
    for (int i = 0; i < size; i++){
        for (int j = i+1; j < size; j++){
            if (comparar (vec_datas[i], vec_datas[j])<=0) continue;
            else {
                Data s=vec_datas[i];
                vec_datas[i]=vec_datas[j];
                vec_datas[j]=s;
            }
        }
    }
}


Data menor_data(Data vec_datas[], int size){
    ordena_datas(vec_datas, size);
    return vec_datas[0];
}

void datas_ano(Data vec_datas[], int size, int ano){
    for (int i = 0; i < size; i++){
        if (vec_datas[i].ano == ano) printf("%d/%d/%d\n", vec_datas[i].dia, vec_datas[i].mes, vec_datas[i].ano);
    }
}

int main(){
    struct data dt[10];
    int dia, mes, ano;

    for (int i=0; i<10; i++){
        scanf("%d %d %d", dia, mes, ano);
        if (dia == -1) break;
        else {
            dt[i].dia = dia;
            dt[i].mes = mes;
            dt[i].ano = ano;
        }
    }


    return 0;
}