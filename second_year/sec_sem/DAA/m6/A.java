import java.util.*;

public class A {

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

    static final int MAX_NODES = 16001;
    @SuppressWarnings("unchecked")
    static List<Edge>[] graph = new ArrayList[MAX_NODES];
    static int[] inFlow = new int[MAX_NODES];
    static int[] outFlow = new int[MAX_NODES];
    static int groupSize, source, sink, vehicleCount;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < MAX_NODES; i++) {
            graph[i] = new ArrayList<>();
        }

        groupSize = sc.nextInt();
        source = sc.nextInt();
        sink = sc.nextInt();
        vehicleCount = sc.nextInt();

        boolean consistent = true;
        int totalOutFromSource = 0, totalInToSink = 0;

        for (int i = 0; i < vehicleCount; i++) {
            int from = sc.nextInt();
            int to = sc.nextInt();
            int cap = sc.nextInt();
            int used = sc.nextInt();

            // Verifica se o plano atual ultrapassa a capacidade do veículo
            if (used > cap) {
                consistent = false;
            }

            // Atualiza fluxo de entrada e saída para checar consistência
            outFlow[from] += used;
            inFlow[to] += used;

            if (from == source)
                totalOutFromSource += used;
            if (to == sink)
                totalInToSink += used;

            // Adiciona arestas ao grafo para cálculo de fluxo máximo
            addEdge(from, to, cap);
        }

        // Verifica conservação de fluxo nos nós intermediários
        for (int i = 0; i < MAX_NODES; i++) {
            if (i != source && i != sink && inFlow[i] != outFlow[i]) {
                consistent = false;
                break;
            }
        }

        // Verifica se o número de elementos saindo da montanha equivale aos que chegam
        // ao abrigo
        if (totalOutFromSource != totalInToSink || totalOutFromSource > groupSize) {
            consistent = false;
        }

        if (!consistent) {
            System.out.println("Inconsistente.");
            return;
        }

        // Calcular fluxo máximo
        int maxFlow = edmondsKarp(source, sink);
        int planEvacuated = totalOutFromSource;

        if (planEvacuated == groupSize) {
            System.out.println("Consistente. Grupo evacuado!");
        } else {
            System.out.print("Consistente. Incompleto: " + planEvacuated + "/" + Math.min(groupSize, maxFlow) + ". ");
            if (maxFlow >= groupSize) {
                System.out.println("Resgate possivel!");
            } else {
                System.out.println("Alerta, resgate impossivel!");
            }
        }
    }

    static void addEdge(int from, int to, int capacity) {
        Edge forward = new Edge(to, capacity);
        Edge backward = new Edge(from, 0);
        forward.reverse = backward;
        backward.reverse = forward;
        graph[from].add(forward);
        graph[to].add(backward);
    }

    static int edmondsKarp(int s, int t) {
        int flow = 0;
        int[] parent = new int[MAX_NODES];
        Edge[] path = new Edge[MAX_NODES];

        while (true) {
            Arrays.fill(parent, -1);
            Queue<Integer> queue = new LinkedList<>();
            queue.add(s);
            parent[s] = s;

            while (!queue.isEmpty() && parent[t] == -1) {
                int u = queue.poll();
                for (Edge e : graph[u]) {
                    if (parent[e.to] == -1 && e.residualCapacity() > 0) {
                        parent[e.to] = u;
                        path[e.to] = e;
                        queue.add(e.to);
                    }
                }
            }

            if (parent[t] == -1)
                break;

            int minFlow = Integer.MAX_VALUE;
            for (int v = t; v != s; v = parent[v]) {
                minFlow = Math.min(minFlow, path[v].residualCapacity());
            }

            for (int v = t; v != s; v = parent[v]) {
                path[v].addFlow(minFlow);
            }

            flow += minFlow;
        }

        return flow;
    }
}