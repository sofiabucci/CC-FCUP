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
            List<Integer> grupo = new ArrayList<>();
            int atual = i;
            
            while (!visitado[atual]) {
                visitado[atual] = true;
                grupo.add(atual);
                atual = v[atual];
            }
            
            if (grupo.size() >= 3) {
                grupos.add(grupo);
            } 
            else {
                s+=grupo.size();
            }

        } 
 
        
        for (List<Integer> g : grupos){
            System.out.print(g.size()+" ");
            int maxIndex = g.indexOf(Collections.max(g));
            for (int i=maxIndex;i<g.size();i++){
                System.out.print(g.get(i)+" ");
            }
            if (maxIndex!=0){
                for (int i=0;i<maxIndex-1;i++){
                    System.out.print(g.get(i)+" ");
                }
                System.out.print(g.get(maxIndex-1));
            }
            System.out.println();
        }

        System.out.println(s);

        in.close();
    }
    
}