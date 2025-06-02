import java.util.*;

public class F {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        
        int n = scan.nextInt();
        int[] c = new int[n + 1];
        for (int i = 1; i <= n; i++) {
            c[i] = scan.nextInt();
        }

        int meses = scan.nextInt();
        int lotesini = scan.nextInt();
        int lotesfim = scan.nextInt();
        int manut = scan.nextInt();

        int[] orders = new int[meses];
        for (int i = 0; i < meses; i++) {
            orders[i] = scan.nextInt();
        }

        int maxStock = lotesini + meses * n;

        int INF = Integer.MAX_VALUE / 2;
        int[][] dp = new int[meses + 1][maxStock + 1];
        long[][] ways = new long[meses + 1][maxStock + 1];

        for (int i = 0; i <= meses; i++) {
            Arrays.fill(dp[i], INF);
        }

        dp[0][lotesini] = 0;
        ways[0][lotesini] = 1;

        for (int month = 0; month < meses; month++) {
            for (int stock = 0; stock <= maxStock; stock++) {
                if (dp[month][stock] == INF) continue;
                int costBefore = dp[month][stock];
                int demand = orders[month];
                int minProd = Math.max(0, demand - stock);
                for (int p = minProd; p <= n; p++) {
                    int newStock = stock + p - demand;
                    if (newStock < 0 || newStock > maxStock) continue;

                    int cValue = (p > 0) ? c[p] : 0;
                    int storageCost = newStock * manut;
                    int newCost = costBefore + cValue + storageCost;

                    if (newCost < dp[month + 1][newStock]) {
                        dp[month + 1][newStock] = newCost;
                        ways[month + 1][newStock] = ways[month][stock];
                    } else if (newCost == dp[month + 1][newStock]) {
                        ways[month + 1][newStock] += ways[month][stock];
                    }
                }
            }
        }

        if (dp[meses][lotesfim] == INF) {
            System.out.println("impossivel");
        } else {
            System.out.println("Custo Minimo = " + dp[meses][lotesfim]);
            System.out.println("No.Sols = " + ways[meses][lotesfim]);
        }
    }
}