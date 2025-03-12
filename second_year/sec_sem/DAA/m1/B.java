import java.util.*;

public class B{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int r = in.nextInt();
        int elementos = in.nextInt();
        int origem = in.nextInt();
        int destino = in.nextInt();

        List<int[]> rotas = new ArrayList<>();

        for(int i=1; i<=r; i++){
            int k = in.nextInt();
            List<Integer> v = new ArrayList<>();
            List<Integer> p = new ArrayList<>();
            List<Integer> d = new ArrayList<>();

            for (int j = 0; j < k; j++) {
                v.add(in.nextInt());
                if (j<k-1){
                    p.add(in.nextInt());
                    d.add(in.nextInt());
                }
            }

            if (!v.contains(origem) || !v.contains(destino) || (v.indexOf(origem)>=v.indexOf(destino))){
                continue;
            }

            p = v.subList(v.indexOf(origem),v.indexOf(destino));
            d = v.subList(v.indexOf(origem),v.indexOf(destino));
            v = v.subList(v.indexOf(origem),v.indexOf(destino));

            boolean assentos = true;
            int a = Integer.MAX_VALUE;
            int problemas = 0;

            for (int j=0; j<v.size(); j++){
                if (d.get(j)<elementos) {
                    assentos = false;
                }
                if (d.get(j)<a){
                    a=d.get(j);
                }
                if (p.get(j)==1) {
                    problemas++;
                }
            }

            if(assentos) {
                int[] x = {i, problemas, a, v.size()};
                rotas.add(x);
            }
            
        }

        if (rotas.isEmpty()) System.out.println("Impossivel");
        else {
            int[] a = rotas.get(0);
            System.out.println("Rota = " + a[0] + " Probs = " + a[1] + " Lugares = " + a [2]);
        }

        in.close();
    }

}