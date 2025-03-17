import java.util.*;
 
public class B{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int rotas = in.nextInt();
        int elementos = in.nextInt();
        int origem = in.nextInt();
        int destino = in.nextInt();


        int assentosTotais = Integer.MAX_VALUE;
        int problemasTotais = Integer.MAX_VALUE;
        int grupoFinal = 0;
        

        for(int i=1; i<=rotas; i++){
            int k = in.nextInt();

            List<Integer> v = new ArrayList<>();
            List<Integer> p = new ArrayList<>();
            List<Integer> l = new ArrayList<>();

            for (int j = 0; j < k; j++) {
                v.add(in.nextInt());
                if (j<k-1){
                    p.add(in.nextInt());
                    l.add(in.nextInt());
                }
            }

            if (v.contains(origem) && v.contains(destino) && (v.indexOf(origem)<v.indexOf(destino))){
                int o = 0;
                int a = Integer.MAX_VALUE;
                boolean assento  = true;

                for (int j=0; j<v.indexOf(destino); j++){
                    if (j>=v.indexOf(origem)){
                        if (l.get(j)<elementos) {
                            assento = false;
                            break;
                        }
                        a = Math.min(a, l.get(j));
                    }
                    o += p.get(j);
                }

                if (assento && (o < problemasTotais || 
                (o == problemasTotais && a > assentosTotais))){
                    grupoFinal = i;
                    assentosTotais=a;
                    problemasTotais=o;
                }
            }
        }

        if (grupoFinal==0) {
            System.out.println("Impossivel");
        }
        else {
            System.out.println("Rota = " + grupoFinal+" Probs = " + problemasTotais + " Lugares = " + assentosTotais);
        }

        in.close();
    }

}