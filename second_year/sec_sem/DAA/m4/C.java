import java.util.*;

public class C {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int temp_min = in.nextInt();
        int temp_max = in.nextInt();
        int origem = in.nextInt();
        int destino = in.nextInt();

        int nos = in.nextInt();
        int ramos = in.nextInt();

        Graph grafo = new Graph(nos);

        for (int i = 0; i < ramos; i++) {
            int origemT = in.nextInt();
            int destinoT = in.nextInt();
            int temp = in.nextInt();
            int cost = in.nextInt();

            if (temp >= temp_min && temp <= temp_max) {
                grafo.addLink(origemT, destinoT, cost);
            }
        }

        int n = in.nextInt();

        for (int i = 0; i < n; i++) {
            int valor = in.nextInt();
            boolean possible = grafo.hasPathWithinBudget(origem, destino, valor);
            System.out.println(possible ? "Sim" : "Nao");
        }

        in.close();
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
    public int minCost;
    
    Node() {
        adj = new LinkedList<>();
        minCost = Integer.MAX_VALUE;
    }  
}

class Graph {
    int n;          // Number of nodes
    Node[] nodes;   // Array of nodes 
    
    Graph(int n) {
        this.n = n;
        nodes = new Node[n + 1];   // +1 if nodes are numbered from 1
        for (int i = 1; i <= n; i++) {
            nodes[i] = new Node();
        }
    }
    
    void addLink(int a, int b, int c) {
        nodes[a].adj.add(new Edge(b, c));
        nodes[b].adj.add(new Edge(a, c));
    }

    public boolean hasPathWithinBudget(int start, int end, int maxBudget) {
        // Reset all nodes
        for (int i = 1; i <= n; i++) {
            nodes[i].minCost = Integer.MAX_VALUE;
        }

        Queue<Integer> q = new LinkedList<>();
        nodes[start].minCost = 0;
        q.add(start);
        
        while (!q.isEmpty()) {
            int current = q.poll();
            
            // Early termination if we found the destination within budget
            if (current == end && nodes[current].minCost <= maxBudget) {
                return true;
            }
            
            for (Edge edge : nodes[current].adj) {
                int neighbor = edge.enode;
                int newCost = nodes[current].minCost + edge.cost;
                
                // Only consider if within budget and better than previous path
                if (newCost <= maxBudget && newCost < nodes[neighbor].minCost) {
                    nodes[neighbor].minCost = newCost;
                    q.add(neighbor);
                }
            }
        }
        
        return false;
    }
}