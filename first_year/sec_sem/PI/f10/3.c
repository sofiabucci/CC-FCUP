#include <stdio.h>
#include <math.h>

typedef struct ponto {double x, y;} Ponto;

typedef struct retangulo {Ponto a, b;} Rect;

double distancia(Ponto a, Ponto b){
    return sqrt(pow((b.x - a.x),2) + pow((b.y - a.y),2));
}

int mesmo_ponto(Ponto a, Ponto b){
    if (distancia(a, b) < 0.000001) return 1;
    else return 0;
}

int maior_dist(){
    struct ponto p[10];

    for (int i=0; i<10; i++){
        scanf("%lf %lf", &p[i].x, &p[i].y);
    }

    int m = distancia(p[0], p[1]);
    double xa=p[0].x, ya=p[0].y, xb=p[1].x, yb=p[1].y;

    for (int i=0; i<10; i++){
        for (int j=i; j<10; j++){
            if (distancia (p[i], p[j]) >= m){
                m = distancia (p[i], p[j]);
                xa=p[i].x;
                ya=p[i].y; 
                xb=p[j].x; 
                yb=p[j].y;
            }
        }
    }

    printf("(%lf %lf) (%lf %lf)", xa, ya, xb, yb);
    return 0;
}

double rect_area(Rect r){
    return (r.b.x - r.a.x)*(r.b.y - r.a.y);
}

int ponto_dentro(Rect r, Ponto p){
    if (p.x >= r.a.x && p.x <= r.b.x && p.y >= r.a.y && p.y <=  r.b.y) return 1;
    else return 0;
}

int rect_dentro(Rect r1, Rect r2){
    if (r2.a.x >= r1.a.x && r2.b.x <= r1.b.x && r2.a.y >= r1.a.y && r2.b.y <=  r1.b.y) return 1;
    else return 0;
}
