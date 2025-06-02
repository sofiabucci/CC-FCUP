import java.util.*;

public class E {

    static final int MOD = 2147483647; // 2^31 - 1

    static int N;
    static int[] pi;
    static int[][] memo;
    static boolean[][] visited;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        N = sc.nextInt();
        pi = new int[N + 2]; // 1-based indexing, extra space for N+1 element
        for (int i = 1; i <= N + 1; i++) {
            pi[i] = sc.nextInt();
        }

        memo = new int[N + 2][N + 2];
        visited = new boolean[N + 2][N + 2];

        System.out.println(dfs(1, 2));
    }

    // Compute C(j, k)
    static int dfs(int j, int k) {
        if (k == N + 1) {
            return 1;
        }
        if (visited[j][k]) {
            return memo[j][k];
        }

        visited[j][k] = true;

        int result = 0;
        int pj = pi[j], pk = pi[k], pk1 = pi[k + 1];

        if ((pj > pk && pk > pk1) || (pj < pk && pk < pk1)) {
            // Case 1
            result = dfs(j, k + 1);
        } else if ((pj > pk && pk < pk1 && pj > pk1) || (pj < pk && pk > pk1 && pj < pk1)) {
            // Case 2
            long temp = (long) dfs(j, k + 1) + dfs(k, k + 1);
            result = (int) (temp % MOD);
        } else if ((pj > pk && pk < pk1 && pj < pk1) || (pj < pk && pk > pk1 && pj > pk1)) {
            // Case 3
            result = dfs(k, k + 1);
        }

        memo[j][k] = result;
        return result;
    }
}
