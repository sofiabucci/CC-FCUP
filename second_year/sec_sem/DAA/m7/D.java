import java.util.*;

public class D {
    @SuppressWarnings("unchecked")
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int p = sc.nextInt();

        // Create array of List<Integer> safely with suppression
        List<Integer>[] pieceToVertices = (List<Integer>[]) new List[p];
        for (int i = 0; i < p; i++) {
            int nj = sc.nextInt();
            pieceToVertices[i] = new ArrayList<>(nj);
            for (int k = 0; k < nj; k++) {
                int v = sc.nextInt();
                pieceToVertices[i].add(v);
            }
        }

        List<Integer>[] vertexToPieces = (List<Integer>[]) new List[n + 1];
        for (int i = 1; i <= n; i++)
            vertexToPieces[i] = new ArrayList<>();
        for (int i = 0; i < p; i++) {
            for (int v : pieceToVertices[i]) {
                vertexToPieces[v].add(i);
            }
        }

        boolean[] covered = new boolean[p];
        int uncoveredCount = p;

        int[] vertexCoverage = new int[n + 1];
        for (int v = 1; v <= n; v++) {
            vertexCoverage[v] = vertexToPieces[v].size();
        }

        PriorityQueue<int[]> pq = new PriorityQueue<>(
                (a, b) -> {
                    if (a[0] != b[0])
                        return Integer.compare(b[0], a[0]); // coverage desc
                    return Integer.compare(a[1], b[1]); // vertex id asc
                });

        for (int v = 1; v <= n; v++) {
            if (vertexCoverage[v] > 0)
                pq.offer(new int[] { vertexCoverage[v], v });
        }

        List<Integer> chosenGuards = new ArrayList<>();

        while (uncoveredCount > 0 && !pq.isEmpty()) {
            int[] top = pq.poll();
            int coverage = top[0];
            int vertex = top[1];

            if (coverage != vertexCoverage[vertex])
                continue;
            if (coverage == 0)
                break;

            chosenGuards.add(vertex);

            for (int piece : vertexToPieces[vertex]) {
                if (!covered[piece]) {
                    covered[piece] = true;
                    uncoveredCount--;

                    for (int v2 : pieceToVertices[piece]) {
                        if (vertexCoverage[v2] > 0) {
                            vertexCoverage[v2]--;
                            pq.offer(new int[] { vertexCoverage[v2], v2 });
                        }
                    }
                }
            }
        }

        Collections.sort(chosenGuards);
        System.out.println(chosenGuards.size());
        for (int i = 0; i < chosenGuards.size(); i++) {
            if (i > 0)
                System.out.print(" ");
            System.out.print(chosenGuards.get(i));
        }
        System.out.println();
    }
}
