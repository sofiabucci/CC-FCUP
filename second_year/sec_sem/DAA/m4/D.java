import java.util.*;

public class D {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int nos = in.nextInt();
        int destino = in.nextInt();

        Graph grafo = new Graph(nos);

        while (true) {
            int a = in.nextInt();
            if (a == -1) break;
            int b = in.nextInt();
            int dist = in.nextInt();

            grafo.addLink(a, b, dist);
        }

        grafo.order(destino);
    }
}

class Edge {
    int enode;     // end node
    int cost;
    
    Edge(int n, int c) {
        enode = n;
        cost = c;
    }
}

class Node {
    public LinkedList<Edge> adj; // List of outgoing edges
    public int distance;
    public int id;
    public boolean visited;
    
    Node(int id) {
        this.id = id;
        adj = new LinkedList<>();
        distance = Integer.MAX_VALUE;
        visited = false;
    }
}

class Graph {
    int n;          // Number of nodes
    Node[] nodes;   // Array of nodes 
    
    Graph(int n) {
        this.n = n;
        nodes = new Node[n + 1];   // +1 if nodes are numbered from 1
        for (int i = 1; i <= n; i++) {
            nodes[i] = new Node(i);
        }
    }
    
    void addLink(int a, int b, int c) {
        nodes[a].adj.add(new Edge(b, c));
        nodes[b].adj.add(new Edge(a, c));
    }

    void order(int destination) {
        // Initialize distances
        for (int i = 1; i <= n; i++) {
            nodes[i].distance = Integer.MAX_VALUE;
            nodes[i].visited = false;
        }
        nodes[destination].distance = 0;

        // Use a priority queue based on distance
        PriorityQueue<Node> pq = new PriorityQueue<>(Comparator.comparingInt(node -> node.distance));
        pq.add(nodes[destination]);

        while (!pq.isEmpty()) {
            Node current = pq.poll();
            if (current.visited) continue;
            
            current.visited = true;

            for (Edge edge : current.adj) {
                Node neighbor = nodes[edge.enode];
                int newDistance = current.distance + edge.cost;
                if (newDistance < neighbor.distance) {
                    neighbor.distance = newDistance;
                    pq.add(neighbor);
                }
            }
        }

        // Create a list of all nodes except destination
        List<Node> nodeList = new ArrayList<>();
        for (int i = 1; i <= n; i++) {
            if (i != destination) {
                nodeList.add(nodes[i]);
            }
        }

        // Sort by distance, then by id
        nodeList.sort((a, b) -> {
            if (a.distance != b.distance) {
                return Integer.compare(a.distance, b.distance);
            }
            return Integer.compare(a.id, b.id);
        });

        // Print the contact order
        System.out.print(destination); // The destination store should be contacted first
        for (Node node : nodeList) {
            System.out.print(" " + node.id);
        }
        System.out.println();
    }
}