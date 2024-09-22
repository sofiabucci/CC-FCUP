#include <stdio.h>

void decompor(int total_seg, int *horas, int *mins, int *segs){
    *horas = total_seg/3600;
    *mins = (total_seg%3600)/60;
    *segs = total_seg%60;
}

int main(){
    int seg = 4278, h, m, s;
    decompor(seg, &h, &m, &s);
    printf("%d %d %d \n", h,m,s);
    return 0;
}