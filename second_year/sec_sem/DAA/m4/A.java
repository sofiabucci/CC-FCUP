import java.util.*;

public class A {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int nos = in.nextInt();
        int ramos = in.nextInt();

        Graph grafo = new Graph(nos);

        for (int i = 1; i <= ramos; i++) {
            int a = in.nextInt();
            int b = in.nextInt();
            int temp = in.nextInt();
            int custo = in.nextInt();

            grafo.addLink(a, b, custo, temp);
        }

        while (true) {
            int sizePath = in.nextInt();
            if (sizePath == 0) break;
            
            int minTemp = Integer.MAX_VALUE;
            int maxTemp = Integer.MIN_VALUE;
            int prev = in.nextInt();

            for (int i = 1; i <= sizePath - 1; i++) {
                int next = in.nextInt();
                
                // Find the edge between prev and next nodes
                for (Edge e : grafo.nodes[prev].adj) {
                    if (e.enode == next) {
                        minTemp = Math.min(minTemp, e.temperature);
                        maxTemp = Math.max(maxTemp, e.temperature);
                        break;
                    }
                }
                prev = next;
            }

            System.out.println(minTemp + " " + maxTemp);
        }
    }
}

class Edge {
    int enode;     // end node
    int cost;
    int temperature;
    
    Edge(int n, int c, int t) {
        enode = n;
        cost = c;
        temperature = t;
    }
}

class Node {
    public LinkedList<Edge> adj; // List of outgoing edges
    
    Node() {
        adj = new LinkedList<>();
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
    
    void addLink(int a, int b, int c, int d) {
        nodes[a].adj.add(new Edge(b, c, d));
        nodes[b].adj.add(new Edge(a, c, d));
    }
}