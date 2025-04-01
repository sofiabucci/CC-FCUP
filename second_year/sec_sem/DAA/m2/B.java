import java.util.*;

public class B {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int nosRede = in.nextInt();
        Graph grafo = new Graph(nosRede);
        int[] aboboras = new int[nosRede + 1];

        for (int i = 1; i <= nosRede; i++) {
            aboboras[i] = in.nextInt();
        }

        int ramos = in.nextInt();

        for (int i = 0; i < ramos; i++) {
            int x = in.nextInt();
            int y = in.nextInt();

            if (!grafo.isEdge(x, y)) {
                grafo.addEdge(x, y);
            }
        }

        int casos = in.nextInt();

        for (int i = 0; i < casos; i++) {
            int mercado = in.nextInt();

            if (aboboras[mercado] > 0) {
                System.out.println(mercado);
            } else {
                List<Integer> acessiveis = grafo.bfs(mercado);
                int maisAboboras = 0;
                int mercadoEscolhido = -1;

                for (int m : acessiveis) {
                    // Exclude the starting node if it has no pumpkins
                    if (m == mercado) continue;

                    if (aboboras[m] > maisAboboras || (aboboras[m] == maisAboboras && m < mercadoEscolhido)) {
                        maisAboboras = aboboras[m];
                        mercadoEscolhido = m;
                    }
                }

                if (maisAboboras == 0) {
                    System.out.println("Impossivel");
                } else {
                    System.out.println(mercadoEscolhido);
                }
            }
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
    public List<Integer> bfs(int start) {
        List<Integer> acessiveis = new ArrayList<>(); // Lista de nós acessíveis
        for (int i = 1; i <= n; i++) nodes[i].visited = false; // Array para marcar nós visitados
        Queue<Integer> queue = new LinkedList<>();   // Fila para gerenciar a busca

        queue.add(start);
        nodes[start].visited = true;

        while (!queue.isEmpty()) {
            int current = queue.poll();
            acessiveis.add(current); // Adiciona o nó atual à lista de acessíveis

            for (int adj : nodes[current].adj) {
                if (!nodes[adj].visited) {
                    nodes[adj].visited = true;
                    queue.add(adj);
                }
            }
        }

        return acessiveis; // Retorna a lista de nós acessíveis
    }
}