import java.util.*;
 
public class E {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int clientes = in.nextInt();
        int horaAtual = 9*60;
        int clientesPerdidos = 0;

        Queue<Integer> fila = new LinkedList<>();
         
        for(int i=0; i<clientes; i++){

            int h = in.nextInt();
            int m = in.nextInt();
            int d = in.nextInt();
            
            int chegada = (h*60)+m;
            int fimAtendimento = Math.min(40, d);

            if (chegada<9*60 || (chegada>12*60 && chegada<15*60) || chegada>19*60){
                clientesPerdidos++;
            }       
            else {
                while (!fila.isEmpty() && fila.peek() <= chegada) {
                    horaAtual = fila.poll();
                }
                if (fila.size()==4){
                    clientesPerdidos++;
                }
                else {
                    int termino = Math.max(horaAtual, chegada) + d;
                    fila.offer(termino); 
                    horaAtual = termino;
                }
            }
        }
        
        System.out.println("Perdeu = " + clientesPerdidos);
        in.close();
    }
}
