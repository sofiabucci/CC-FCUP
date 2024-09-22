#define MAX 11
#define MAXNOME 100
#define MAXDISC 100
#define MAXALUNOS 100

#include <stdio.h>
#include <string.h>

typedef struct aluno {char nome[MAXNOME], codigo[MAX]; int disc[MAX], nd;} ALUNO;

typedef struct disciplina {char nome[MAXNOME]; int ano;} DISCIPLINA;

int NDisc = 9;
DISCIPLINA Disc[MAXDISC] = {
    {"Programacao Imperativa",1},
    {"Calculo Infinitesimal I",1},
    {"Programacao Estruturada",1},
    {"Topologia",4},
    {"Geometria Computacional",4},
    {"Probabilidades e Estatistica",2},
    {"Teoria de Numeros",3},
    {"Analise Infinitesimal",3},
    {"Logica",3}
};

int NAlunos = 6;
ALUNO Alunos[MAXALUNOS] = {
    {"Mariana Matias","2001018003", {2,1,9,5,3,7}, 6},
    {"Anabela Moreira", "2000020004",{6,2,3,7,8,9}, 6},
    {"Sonia Silva", "2000020005",{5,6,1,8,9},5},
    {"Joao Maria Peixoto", "2000018001",{3,4,1,5}, 4},
    {"Joao Mario Pereira","2004010005",{8,1,2,3,4,5,6},7},
    {"Maria Reis", "2000020050",{5,6,1,7,3,9},6}
};

void procura(char *palavranome){
    printf("Alunos cujo nome inclui %s\n", palavranome);
    for (int i=0;i<NAlunos;i++){
        if (strstr(Alunos[i].nome,palavranome) != NULL){
            printf("%s %s", Alunos[i].codigo, Alunos[i].nome);
        }
    }
}

int codigo2Aluno(char *codigo,char *nome){
    for (int i = 0; i < NAlunos; i++) {
        if (strcmp(Alunos[i].codigo,codigo) == 0){
            strcpy(nome, Alunos[i].nome);
            return 1; 
        }
    }
    return 0;
}

int disciplinas_de_Aluno(char *nome){
    int a;

    for (int i=0; i < NAlunos; i++){
        if (strcmp(Alunos[i].nome,nome) == 0){
            a=i;
            break;
        }
    }

    for (int j=0; j < Alunos[a].nd; j++){
        int d=Alunos[a].disc[j];
        printf("%s", Disc[d].nome);
    }

    return Alunos[a].nd;
}

int alunos_de_disciplina(char *disciplina, int *indices){

    for (int i=0; i < NAlunos; i++){
        for (int j=0; j < Alunos[i].nd; j++){
            if (strcmp(Disc[Alunos[i].disc[j]].nome,disciplina) == 0){
                *indices=i;
                indices++;
            }
        }
    }

    return *indices;
}

int numero_medio(char *curso){
    int s=0, e=0;

    for (int i = 0; i < NAlunos; i++) {
        if (strstr(Alunos[i].codigo, curso) != NULL) {
            s += Alunos[i].nd;
            e++;
        }
    }

    return s/e;
}

int muitas_disciplinas(char *curso, int *indices){
    int m=numero_medio(*curso);

    for (int i=0; i < NAlunos; i++){
        if (strstr(Alunos[i].codigo, curso) != NULL&& Alunos[i].nd > m){
                *indices=i;
                indices++;
        }
    }

    return *indices;
}

int numero_maximo(char *cursoano){
    int m=0;

    for (int i=0; i < NAlunos; i++){
        if ((strncmp(Alunos[i].codigo, cursoano, 7) == 0) && (Alunos[i].nd > m)){
            m=Alunos[i].nd;
        }
    }
    
    return m;
}

int numero_disc(int posaluno,int ano){
    int a=0;

    for (int i=0; i < Alunos[posaluno].nd; i++){
        if (Disc[Alunos[posaluno].disc[i]].ano == ano){
            a++;
        }
    }
    
    return a;
}

int varios_anos(int posaluno){
    for (int i=0; i < Alunos[posaluno].nd-1; i++){
        if (Disc[Alunos[posaluno].disc[i]].ano /= Disc[Alunos[posaluno].disc[i+1]].ano){
            return 0;
        }
    }

    return 1;
}