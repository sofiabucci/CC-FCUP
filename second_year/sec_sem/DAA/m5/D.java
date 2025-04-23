import java.util.*;

class Edge {
    int destino;
    int larguraMax;
    int comprimentoMax;
    int alturaMax;

    Edge(int destino, int larguraMax, int comprimentoMax, int alturaMax) {
        this.destino = destino;
        this.larguraMax = larguraMax;
        this.comprimentoMax = comprimentoMax;
        this.alturaMax = alturaMax;
    }
}

class Node {
    LinkedList<Edge> adj;

    Node() {
        adj = new LinkedList<>();
    }
}

public class D {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int larguraMin = scanner.nextInt();
        int larguraMax = scanner.nextInt();
        int comprimentoMin = scanner.nextInt();
        int comprimentoMax = scanner.nextInt();
        int alturaMin = scanner.nextInt();
        int origem = scanner.nextInt();
        int destino = scanner.nextInt();

        Map<Integer, Node> grafo = new HashMap<>();
        while (true) {
            int x = scanner.nextInt();
            if (x == -1) break;
            int y = scanner.nextInt();
            int largura = scanner.nextInt();
            int comprimento = scanner.nextInt();
            int altura = scanner.nextInt();

            if (!grafo.containsKey(x)) {
                grafo.put(x, new Node());
            }
            if (!grafo.containsKey(y)) {
                grafo.put(y, new Node());
            }

            grafo.get(x).adj.add(new Edge(y, largura, comprimento, altura));
            grafo.get(y).adj.add(new Edge(x, largura, comprimento, altura));
        }

        if (!grafo.containsKey(origem) || !grafo.containsKey(destino)) {
            System.out.println(0);
            return;
        }

        Queue<int[]> queue = new LinkedList<>();
        Map<Integer, Integer> maxComprimento = new HashMap<>();
        queue.add(new int[]{origem, comprimentoMax});
        maxComprimento.put(origem, comprimentoMax);

        while (!queue.isEmpty()) {
            int[] current = queue.poll();
            int u = current[0];
            int currentComp = current[1];

            for (Edge e : grafo.get(u).adj) {
                int v = e.destino;
                int newLarguraMax = Math.min(larguraMax, e.larguraMax);
                int newComprimentoMax = Math.min(currentComp, e.comprimentoMax);
                int newAlturaMax = Math.min(alturaMin, e.alturaMax);

                if (newLarguraMax >= larguraMin && newComprimentoMax >= comprimentoMin && newAlturaMax >= alturaMin) {
                    if (!maxComprimento.containsKey(v) || newComprimentoMax > maxComprimento.get(v)) {
                        maxComprimento.put(v, newComprimentoMax);
                        queue.add(new int[]{v, newComprimentoMax});
                    }
                }
            }
        }

        System.out.println(maxComprimento.getOrDefault(destino, 0));
    }
}