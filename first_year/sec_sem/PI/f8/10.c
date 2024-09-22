int mediana(int a, int b, int c){
    if ((a<=b && b<=c) || (c<=b && b<=a))
        return b;
    else if ((b<=a && a<=c) || (c<=a && a<=b))
        return a;
    else 
        return c;
}

int partition(int vec[], int l, int u) {
    int i, m, temp;
    m = mediana(l,u,vec[(l+u)/2]);
    for(i = l+1; i<=u; i++) {
        if(vec[i] < vec[l]) { 
            m ++;
            temp = vec[i]; 
            vec[i] = vec[m];
            vec[m] = temp;
        }
    }
    temp = vec[l]; 
    vec[l] = vec[m];
    vec[m] = temp;
    return m;
}



void quicksort_rec(int vec[], int l, int u){
    int m;
    if(l >= u)
        return; 
    
    m = partition(vec, l, u);
    
    quicksort_rec(vec, l, m-1);
    
    quicksort_rec(vec, m+1, u);
    
}

