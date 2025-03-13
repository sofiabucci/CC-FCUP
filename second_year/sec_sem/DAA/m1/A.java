import java.util.*;

public class A{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();
        int[] v = new int[n+1];

        for(int i=1; i<=n; i++){
            v[i]=in.nextInt();
        }

        boolean[] visitado = new boolean[n + 1];
        List<List<Integer>> grupos = new ArrayList<>();
        int s = 0;

        for (int i = 1; i <= n; i++) {
            if (!visitado[i]) {
                List<Integer> grupo = new ArrayList<>();
                int atual = i;
                
                while (!visitado[atual]) {
                    visitado[atual] = true;
                    atual = v[atual];
                    grupo.add(v[atual]);

                }
                
                if (grupo.size() >= 3) {
                    grupos.add(grupo);
                } else {
                    s+= grupo.size();
                }
            }
        }
 

        for (List<Integer> grupo : grupos) {
            System.out.print(grupo.size()+ " ");
            int m = Collections.max(grupo);
            System.out.print(m);
            grupo.remove(grupo.indexOf(m));
            for (int p : grupo) {
                System.out.print(" " + p);
            }
            System.out.println();
        }

        System.out.println(s);

        in.close();
    }
    
}