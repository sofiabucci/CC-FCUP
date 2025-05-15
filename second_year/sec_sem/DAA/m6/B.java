import java.util.*;

public class B {

    static class Edge {
        int to, capacity, flow;
        Edge reverse;

        Edge(int to, int capacity) {
            this.to = to;
            this.capacity = capacity;
        }

        int residualCapacity() {
            return capacity - flow;
        }

        void addFlow(int flow) {
            this.flow += flow;
            reverse.flow -= flow;
        }
    }

    static final int MAX_NODES = 20; // V <= 15
    @SuppressWarnings("unchecked")
    static List<Edge>[] graph = new ArrayList[MAX_NODES];

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int V = sc.nextInt(); // Número de nós
        int E = sc.nextInt(); // Número de arestas

        for (int i = 0; i <= V; i++) {
            graph[i] = new ArrayList<>();
        }

        for (int i = 0; i < E; i++) {
            int a = sc.nextInt();
            int b = sc.nextInt();

            // Como o grafo é bidirecional, adiciona nos dois sentidos com capacidade 1
            addEdge(a, b, 1);
            addEdge(b, a, 1);
        }

        // O número máximo de caminhos disjuntos por arestas de 1 até V
        int maxPaths = edmondsKarp(1, V);
        System.out.println(maxPaths);
    }

    static void addEdge(int from, int to, int capacity) {
        Edge fwd = new Edge(to, capacity);
        Edge bwd = new Edge(from, 0);
        fwd.reverse = bwd;
        bwd.reverse = fwd;
        graph[from].add(fwd);
        graph[to].add(bwd);
    }

    static int edmondsKarp(int source, int sink) {
        int flow = 0;
        int[] parent = new int[MAX_NODES];
        Edge[] path = new Edge[MAX_NODES];

        while (true) {
            Arrays.fill(parent, -1);
            Queue<Integer> queue = new LinkedList<>();
            queue.add(source);
            parent[source] = source;

            while (!queue.isEmpty() && parent[sink] == -1) {
                int u = queue.poll();
                for (Edge e : graph[u]) {
                    if (parent[e.to] == -1 && e.residualCapacity() > 0) {
                        parent[e.to] = u;
                        path[e.to] = e;
                        queue.add(e.to);
                    }
                }
            }

            if (parent[sink] == -1)
                break;

            int minFlow = Integer.MAX_VALUE;
            for (int v = sink; v != source; v = parent[v]) {
                minFlow = Math.min(minFlow, path[v].residualCapacity());
            }

            for (int v = sink; v != source; v = parent[v]) {
                path[v].addFlow(minFlow);
            }

            flow += minFlow;
        }

        return flow;
    }
}