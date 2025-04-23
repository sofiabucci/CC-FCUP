import java.util.*;

public class C{
    static class Edge {
        int to;
        int capacity;
        Edge(int to, int capacity) {
            this.to = to;
            this.capacity = capacity;
        }
    }

    static class Node implements Comparable<Node> {
        int id, cap;
        Node(int id, int cap) {
            this.id = id;
            this.cap = cap;
        }

        public int compareTo(Node other) {
            return Integer.compare(other.cap, this.cap); // max heap
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int origin = sc.nextInt();
        int minSize = sc.nextInt();
        int maxSize = sc.nextInt();

        int n = sc.nextInt();
        int r = sc.nextInt();

        List<List<Edge>> graph = new ArrayList<>();
        for (int i = 0; i <= n; i++) graph.add(new ArrayList<>());

        // Inicialização do mapa de restrições
        @SuppressWarnings("unchecked")
        Map<Integer, Integer>[] edgeCap = new HashMap[n + 1];
        for (int i = 0; i <= n; i++) edgeCap[i] = new HashMap<>();

        // Leitura das arestas (sem restrição por enquanto)
        for (int i = 0; i < r; i++) {
            int u = sc.nextInt();
            int v = sc.nextInt();
            graph.get(u).add(new Edge(v, Integer.MAX_VALUE));
            graph.get(v).add(new Edge(u, Integer.MAX_VALUE));
        }

        int restrictions = sc.nextInt();
        for (int i = 0; i < restrictions; i++) {
            int u = sc.nextInt();
            int v = sc.nextInt();
            int h = sc.nextInt();
            int w = sc.nextInt();

            int cap = Integer.MAX_VALUE;
            if (h != -1 && w != -1) cap = Math.min(h, w);
            else if (h != -1) cap = h;
            else if (w != -1) cap = w;

            edgeCap[u].put(v, cap);
            edgeCap[v].put(u, cap);
        }

        // Aplicar restrições diretamente na lista original
        for (int u = 1; u <= n; u++) {
            List<Edge> edges = graph.get(u);
            for (int i = 0; i < edges.size(); i++) {
                Edge e = edges.get(i);
                int cap = edgeCap[u].getOrDefault(e.to, Integer.MAX_VALUE);
                edges.set(i, new Edge(e.to, cap));
            }
        }

        // Widest Path via Dijkstra com max heap
        int[] maxCube = new int[n + 1];
        Arrays.fill(maxCube, -1);
        maxCube[origin] = Integer.MAX_VALUE;

        PriorityQueue<Node> pq = new PriorityQueue<>();
        pq.add(new Node(origin, Integer.MAX_VALUE));

        while (!pq.isEmpty()) {
            Node curr = pq.poll();
            int u = curr.id;

            if (curr.cap < maxCube[u]) continue;

            for (Edge e : graph.get(u)) {
                int next = e.to;
                int newCap = Math.min(maxCube[u], e.capacity);
                if (newCap > maxCube[next]) {
                    maxCube[next] = newCap;
                    pq.add(new Node(next, newCap));
                }
            }
        }

        boolean allOk = true;
        List<String> output = new ArrayList<>();

        for (int i = 1; i <= n; i++) {
            if (i == origin) continue;
            int dim = maxCube[i];

            if (dim >= maxSize) continue;

            allOk = false;
            if (dim < minSize) dim = 0;
            output.add("No " + i + ": " + dim);
        }

        if (allOk) {
            System.out.println("Ok todos destinos!");
        } else {
            for (String line : output) {
                System.out.println(line);
            }
        }
    }
}



//gpt assisted