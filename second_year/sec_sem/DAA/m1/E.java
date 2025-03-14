import java.util.*;

public class E {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int k = in.nextInt();
        int c =0;
        int hora=0;
        Queue<Integer> fila = new LinkedList<>();
         
        for(int i=0; i<k; i++){
            int h = in.nextInt();
            int m = in.nextInt();
            int d = in.nextInt();
            int tempo = (h*60)+m;

            if ((tempo<9*60 || tempo>12*60) && (tempo<15*60 || tempo>19*60)){
                c++;
            }       
            else {
                while (!fila.isEmpty() && fila.peek() <= tempo) {
                    fila.poll();
                }
                if (fila.size()==4){
                    c++;
                }
                else {
                    if (!fila.isEmpty()){
                        fila.offer(hora+d);
                    }
                    else{
                        fila.offer(tempo+d);
                        hora = tempo+d;
                    }

                }
            }
    
        }
        
        System.out.println("Perdeu = " + c);
        in.close();
    }
}
