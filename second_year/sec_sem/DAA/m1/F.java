import java.util.*;

public class F{ 
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int equipas = in.nextInt();
        int submissoes = in.nextInt();
        int duracao = in.nextInt();
        int blackout = in.nextInt();
        int vencedora = in.nextInt();

        Map<Integer, Map<Integer, ProblemInfo>> equipas = new HashMap<>();

        for (int i = 1; i <= equipas; i++) {
            equipas.put(i, new HashMap<>());
        }

        for (int i = 0; i < submissoes; i++) {
            int equipa = in.nextInt();
            int tempo = in.nextInt();
            int problema = in.nextInt();
            int resultado = in.nextInt();

            Map<Integer, ProblemInfo> problemas = equipas.get(equipa);
            problemas.putIfAbsent(problema, new ProblemInfo());

            ProblemInfo info = problemas.get(problema);
            if (resultado == 1) {
                info.resolvido = true;
                info.tempoResolucao = tempo;
            } else {
                info.submissoesErradas++;
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