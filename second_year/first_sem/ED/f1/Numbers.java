public class Numbers {
    public static void main(String[] args) {
	int n = 500; 
	int s = 0;

	System.out.println("Numeros de 1 a " + n + ":"); 

	for (int i=1; i<=n; i++){
	    System.out.println(i);
		s+=i;
	}

	System.out.println("Soma = " + s);
    };

}	
