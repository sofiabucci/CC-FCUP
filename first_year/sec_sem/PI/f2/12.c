#include <stdio.h>

int main(){
    int d, m, a;
    printf("Data: "); scanf("%d %d %d", &d,&m,&a);


    if (m==1 || m==3  || m==5 || m==7 || m==8 || m==10 || m ==12)
        {if (d<31)
            printf("Amanhã será %d/%d/%d \n", d+1, m, a);
        else if (d==31 && m!=12)
            printf("Amanhã será 1/%d/%d \n",  m+1, a);
        else 
            printf("Amanhã será 1/1/%d \n", a+1);}
    else if (m==2)
        {if ((a%4==0 && a%100!=0) || (a%400==0))
            {if (d<29)
                printf("Amanhã será %d/%d/%d \n", d+1, m, a);
            else 
                printf("Amanhã será 1/%d/%d \n",  m+1, a);}
        else
            {if (d<28)
                printf("Amanhã será %d/%d/%d \n", d+1, m, a);
            else 
                printf("Amanhã será 1/%d/%d \n",  m+1, a);}}
    else
        {if (d<30)
            printf("Amanhã será %d/%d/%d \n", d+1, m, a);
        else
            printf("Amanhã será 1/%d/%d \n",  m+1, a);}
        
    return 0;
}