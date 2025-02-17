import java.util.*;

public class ED201{
    static void sets(int v[], int d) {
        // array de booleanos para representar o conjunto
        boolean used[] = new boolean[v.length];
        int[] s= new int[1];
        s[0]=0;
        goSets(0, v, used, d, s); // chamar funcao recursiva
        System.out.println(s[0]);
     }
  
     // Gera todos os subconjuntos a partir da posicao 'cur'
     static void goSets(int cur, int v[], boolean used[], int d, int[] s) {
        if (cur == v.length) {  // Caso base: terminamos o conjunto
            int c=0;
            for (int i=0; i<v.length; i++) {
                if (used[i]) {c+=v[i]; };
            }
            if (c<=d && c>s[0]) s[0]= c;
        } else {                  // Se nao terminamos, continuar a gerar
           used[cur] = true;      // Subconjuntos que incluem o elemento actual
           goSets(cur+1, v, used, d, s);// Chamada recursiva
           used[cur] = false;     // Subconjuntos que nao incluem o el. actual
           goSets(cur+1, v, used, d, s);// Chamada recursiva
        }
     }
    public static void main (String args[]){
        Scanner in = new Scanner(System.in);

        int d = in.nextInt();
        int n = in.nextInt();

        int[] v = new int[n];

        for (int i=0; i<n; i++){
            v[i]=in.nextInt();
        }

        sets(v, d);
        
    }
}