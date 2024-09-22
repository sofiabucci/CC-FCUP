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

Data diff(Data d1, Data d2){
    struct data dt;
    if (comparar(d1, d2) == -1) {
        dt.ano = d2.ano - d1.ano;
        dt.mes = d2.mes - d1.mes;
        dt.dia = d2.dia - d1.dia;
    }
    else if (comparar(d1, d2) == 1){
        dt.ano = d1.ano - d2.ano;
        dt.mes = d1.mes - d2.mes;
        dt.dia = d1.dia - d2.dia;
    }
    else {
        dt.dia=0; 
        dt.mes=0; 
        dt.ano=0;
    }

    return dt;
}

int main(){
    struct data d[2];

    for (int i=0; i<2; i++){
        scanf("%d %d %d", &d[i].dia, &d[i].mes, &d[i].ano);
    }

    return 0;
}