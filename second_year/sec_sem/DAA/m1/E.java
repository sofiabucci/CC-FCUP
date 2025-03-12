import java.util.*;

public class E {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int k = in.nextInt(); 

        int[] func = {9 * 60, 12 * 60, 15 * 60, 19 * 60}; 
        Queue<Integer> filaEspera = new LinkedList<>(); 
        int terminoAtendimento = 0; 
        int c = 0; 

        for (int i = 0; i < k; i++) {
            int h = in.nextInt(); 
            int m = in.nextInt(); 
            int d = in.nextInt(); 

            int t = (h * 60) + m; 

            if ((t >= func[0] && t <= func[1]) || (t >= func[2] && t <= func[3])) {
                
                while (!filaEspera.isEmpty() && filaEspera.peek() <= t) {
                    filaEspera.poll(); 
                }

                if (filaEspera.size() < 3) {
                    int termino = Math.max(t, terminoAtendimento) + d;
                    
                    filaEspera.add(termino); 
                    terminoAtendimento = termino; 
                } else {
                    c++; 
                }
            } else {
                c++; 
            }
        }

        System.out.println("Perdeu = " + c);

        in.close();
    }
}