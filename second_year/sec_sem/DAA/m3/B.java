import java.io.*;
import java.util.*;

enum Color {
    WHITE, GRAY, BLACK
}

class Node {
    public LinkedList<Integer> adj;
    public boolean visited;
    public int label;
    public Color color;

    Node() {
        adj = new LinkedList<Integer>();
    }
}

class Graph {
    int n;
    Node nodes[];

    Graph(int n) {
        this.n = n;
        nodes = new Node[n + 1];
        for (int i = 1; i <= n; i++)
            nodes[i] = new Node();
    }

    public void addEdge(int a, int b) {
        nodes[a].adj.add(b);
    }

    public boolean isTopologicalOrder(int[] order) {
        if (order.length != n) {
            return false;
        }

        int[] position = new int[n + 1];
        for (int i = 0; i < order.length; i++) {
            position[order[i]] = i;
        }

        for (int u = 1; u <= n; u++) {
            for (int v : nodes[u].adj) {
                if (position[u] >= position[v]) {
                    return false;
                }
            }
        }

        return true;
    }

    public static Graph readGraph(Scanner scanner) {
        int n = scanner.nextInt();
        Graph g = new Graph(n);
        int nedges = scanner.nextInt();
        for (int i = 0; i < nedges; i++) {
            int u = scanner.nextInt();
            int v = scanner.nextInt();
            g.addEdge(u, v);
        }
        return g;
    }
}

public class Prog {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Graph g = Graph.readGraph(scanner);
        int k = scanner.nextInt();
        for (int i = 0; i < k; i++) {
            int[] order = new int[g.n];
            for (int j = 0; j < g.n; j++) {
                order[j] = scanner.nextInt();
            }
            System.out.println(g.isTopologicalOrder(order) ? "true" : "false");
        }
    }
}