import java.util.*;

public class C {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int nosRede = in.nextInt();
        Graph grafo = new Graph(nosRede);
        int[] paiNatal = new int[nosRede + 1];

        for (int i = 1; i <= nosRede; i++) {
            paiNatal[i] = in.nextInt();
        }

        int ramos = in.nextInt();

        for (int i = 0; i < ramos; i++) {
            int x = in.nextInt();
            int y = in.nextInt();

            if (!grafo.isEdge(x, y)) {
                grafo.addEdge(x, y);
            }
        }

        int loja = in.nextInt();
        int distancia = in.nextInt();

        if (paiNatal[loja]>0){
            System.out.println("Que sorte");
        }
        else {
            int lojasTotais = 0;
            List<Integer> acessiveis = grafo.bfs(loja, distancia);

            for (int l : acessiveis){
                if (paiNatal[l]>0){
                    lojasTotais++;
                }
            }

            System.out.println(lojasTotais);

        }

        in.close();
    }
}


// Class that represents a node
class Node {
    public LinkedList<Integer> adj; // List of adjacent nodes
    public boolean visited;         // Has the node been visited in a graph traversal?

    Node() {
        adj = new LinkedList<>();
    }
}

// Class that represents a graph
class Graph {
    int n;           // Number of nodes of the graph
    Node nodes[];    // Array that will contain the nodes

    // constructs a graph with n nodes and 0 edges
    Graph(int n) {
        this.n = n;
        nodes = new Node[n + 1]; // +1 if the labels start at 1 instead of 0
        for (int i = 1; i <= n; i++)
            nodes[i] = new Node();
    }

    // adds edge from a to b and another from b to a
    public void addEdge(int a, int b) {
        nodes[a].adj.add(b);
        nodes[b].adj.add(a);
    }

    // checks whether {a,b} is an edge
    public boolean isEdge(int a, int b) {
        return nodes[a].adj.contains(b);
    }

    // Returns a list of all accessible nodes from a given node using BFS
    public List<Integer> bfs(int start, int maxDistance) {
        List<Integer> acessiveis = new ArrayList<>(); // Lista de nós acessíveis
        for (int i=1; i<=n; i++) nodes[i].visited = false; // Array para marcar nós visitados
        int[] distance = new int[n + 1];

        Queue<Integer> queue = new LinkedList<>();   // Fila para gerenciar a busca

        queue.add(start);
        nodes[start].visited = true;
        distance[start]= 0;

        while (!queue.isEmpty()) {
            int current = queue.poll();
            acessiveis.add(current); // Adiciona o nó atual à lista de acessíveis

            if (distance[current]>= maxDistance){
                continue;
            }

            for (int adj : nodes[current].adj) {
                if (!nodes[adj].visited) {
                    nodes[adj].visited = true;
                    distance[adj]= distance[current] +1 ;
                    queue.add(adj);
                }
            }
        }

        return acessiveis; // Retorna a lista de nós acessíveis
    }
}