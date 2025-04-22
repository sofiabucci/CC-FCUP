import java.util.*;

public class B {
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
                grafo.addLink(origemT, destinoT, temp);
            }
        }

        int caminho = grafo.caminho_bfs(origem, destino);
        if (caminho != -1) {
            System.out.println("Sim " + caminho);
        } else {
            System.out.println("Nao");
        }

        in.close();
    }
}

class Edge {
    int enode;     // end node
    int temperature;
    
    Edge(int n, int t) {
        enode = n;
        temperature = t;
    }
}

class Node {
    public LinkedList<Edge> adj; // List of outgoing edges
    public boolean visited;
    public int distance;
    
    Node() {
        adj = new LinkedList<>();
        visited = false;
        distance = -1;
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

    public int caminho_bfs(int start, int end) {
        // Reset all nodes
        for (int i = 1; i <= n; i++) {
            nodes[i].visited = false;
            nodes[i].distance = -1;
        }

        Queue<Integer> q = new LinkedList<>();
        nodes[start].distance = 0;
        nodes[start].visited = true;
        q.add(start);
        
        while (!q.isEmpty()) {
            int current = q.poll();
            
            for (Edge edge : nodes[current].adj) {
                int neighbor = edge.enode;
                if (!nodes[neighbor].visited) {
                    nodes[neighbor].visited = true;
                    nodes[neighbor].distance = nodes[current].distance + 1;
                    
                    // Early termination if we found the destination
                    if (neighbor == end) {
                        return nodes[neighbor].distance;
                    }
                    
                    q.add(neighbor);
                }
            }
        }
        
        return -1; // No path found
    }
}