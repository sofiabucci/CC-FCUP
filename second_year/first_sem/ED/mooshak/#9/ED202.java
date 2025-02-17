import java.util.*;

public class ED202 {

    // Função para calcular a menor distância do TSP
    static void permutations(int v[], double[][] dist, int n) {
        boolean used[] = new boolean[n];  // array para verificar se o local já foi visitado
        int[] perm = new int[n];           // armazenar a permutação atual
        double[] minDist = {Double.MAX_VALUE};  // usar um array para permitir a modificação dentro de goPerm
        goPerm(0, v, used, perm, dist, minDist, n);  // Chama a função recursiva
        System.out.printf("%.2f\n", minDist[0]);  // Exibe o resultado final arredondado para 2 casas decimais
    }

    // Função recursiva que gera todas as permutações possíveis
    static void goPerm(int cur, int v[], boolean used[], int perm[], double[][] dist, double[] minDist, int n) {
        if (cur == n) {  // Caso base: geramos uma permutação completa
            // Calcular a distância total para esta permutação
            double totalDist = 0;
            for (int i = 0; i < n - 1; i++) {
                totalDist += dist[perm[i]][perm[i + 1]];  // distâncias entre locais consecutivos
            }
            totalDist += dist[perm[n - 1]][perm[0]];  // volta ao ponto inicial

            // Atualizar a menor distância
            minDist[0] = Math.min(minDist[0], totalDist);
        } else {
            // Gerar permutações recursivamente
            for (int i = 0; i < n; i++) {
                if (!used[i]) {
                    used[i] = true;
                    perm[cur] = i;
                    goPerm(cur + 1, v, used, perm, dist, minDist, n);
                    used[i] = false;
                }
            }
        }
    }

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();

        String[] lugares = new String[n];
        for (int i = 0; i < n; i++) {
            lugares[i] = in.next();
        }

        double[][] dist = new double[n][n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                dist[i][j] = in.nextDouble();
            }
        }

        int[] v = new int[n];
        for (int i = 0; i < n; i++) {
            v[i] = i;  
        }

        permutations(v, dist, n);
    }
}
