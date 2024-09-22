#include <stdio.h>

int magico(int a[20][20], int n){
    int s=0, m=0;
    if (n==1) return 1;

    for (int j=0; j<n; j++){
            s+=(a[0][j]); 
        }

    for (int i=1; i<n; i++){
        for (int j=0; j<n; j++){
            m+=(a[i][j]); 
        }
        if (m!=s) return 0;
        else m = 0;
    }

    for (int i=0; i<n; i++){
        for (int j=0; j<n; j++){
            m+=(a[j][i]); 
        }
        if (m!=s) return 0;
        else m = 0;
    }

    for (int i=0; i<n; i++){
        m+=(a[i][i]);      
    }
    if (m!=s) return 0;
    else m = 0;

    int j=n-1;
    for (int i=0; i<n; i++){
        m+=(a[i][j]); 
        j--;    
    }
    if (m!=s) return 0;
    else m = 0;
    
    return 1;
}