import java.util.*;

public class F{
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int equipas = in.nextInt();
        int submissoes = in.nextInt();
        int duracao = in.nextInt();
        int blackout = in.nextInt();
        int vencedora = in.nextInt();

        Map<Integer, Integer> problemasResolvidos = new HashMap<>(); 
        Map<Integer, Integer> tempoTotal = new HashMap<>(); 

        for (int i = 1; i <= equipas; i++) {
            problemasResolvidos.put(i, 0);
            tempoTotal.put(i, 0);
        }

        for (int i = 0; i < submissoes; i++) {
            int equipa = in.nextInt();
            int tempo = in.nextInt();
            int problema = in.nextInt();
            int resultado = in.nextInt();

            if (resultado == 1) {
                problemasResolvidos.put(equipa, problemasResolvidos.get(equipa) + 1);
                tempoTotal.put(equipa, tempoTotal.get(equipa) + tempo);
            }
            else{
                tempoTotal.put(equipa, tempoTotal.get(equipa) + 20);
            }

        }

        int k = in.nextInt();
        int t=0;
        for (int i=0; i<k; i++){
            t=in.nextInt();
        }
        tempoTotal.put(vencedora, tempoTotal.get(vencedora) + t);

        int menorTempo = Integer.MAX_VALUE;
        int equipaComMenorTempo = -1;

        for (Map.Entry<Integer, Integer> entry : tempoTotal.entrySet()) {
            int equipa = entry.getKey();
            int tempo = entry.getValue();

            if (tempo < menorTempo) {
                menorTempo = tempo;
                equipaComMenorTempo = equipa;
            }
        }

   
        if (equipaComMenorTempo == vencedora) {
            System.out.println("Vencemos");
        } else {
            System.out.println("Nao sabemos");
        }


        in.close();
    }

}