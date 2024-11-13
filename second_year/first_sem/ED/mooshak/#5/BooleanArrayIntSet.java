

class BooleanArrayIntSet implements IntSet {
    static final char False = 'F';
    static final char True = 'T';
    private int size;
    private char isElem[];

    BooleanArrayIntSet(int maxInt){
        isElem = new char[maxInt+1];
        size = 0;
    }

    public boolean contains(int x){
        return (x < isElem.length) && (isElem[x]==True);
    }  

    public boolean add(int x){
        if (x >= isElem.length || contains(x)) {
            return false;
        }
        else{
            isElem[x]=True;
            size++;
            return true;
        }

    }           

    public boolean remove(int x){
        if (x >= isElem.length || !contains(x)) {
            return false;
        }
        else{
            isElem[x]=False;
            size--;
            return true; 
        }
    }      
    
    public int size(){
        int count=0;
        for (int i=0; i<isElem.length; i++){
            if (isElem[i]==True) count++;
        }
        size=count;
        return size;
    }           
         
    public void clear(){
        for (int i = 0; i < isElem.length; i++) {
            isElem[i] = False; 
        }
        size=0;
    }           
       
    public boolean equals(IntSet s){
        if (size() != s.size()) {
            return false;
        }
        for (int i=0; i<isElem.length; i++){
            if (s.contains(i) != contains(i)) return false;
        }
        return true;
    }     
    
    public IntSet intersection(IntSet s){
        IntSet i = new BooleanArrayIntSet(isElem.length);
        for (int k=0; k<isElem.length; k++){
            if (s.contains(k) && isElem[k]==True){
                i.add(k);
            }
        }
        return i;
    }

    public String toString () {
        String res = "{";
        for ( int i=0; i<isElem.length; i++) {
            if (i>0) res += ",";
            res += isElem[i];
        }
        res += "}";
        return res;
    }
}

