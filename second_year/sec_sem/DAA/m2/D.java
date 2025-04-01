import java.util.*;

public class D {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int nosRede = in.nextInt();
        int ramos = in.nextInt();

        Graph grafo = new Graph(nosRede);

        // Construção do grafo
        for (int i = 0; i < ramos; i++) {
            int x = in.nextInt();
            int y = in.nextInt();

            if (!grafo.isEdge(x, y)) {
                grafo.addEdge(x, y);
            }
        }

        // Pré-processamento: identificar componentes conexas e seus maiores nós
        grafo.conectionMax();

        int questões = in.nextInt();

        // Resposta às consultas
        for (int i = 0; i < questões; i++) {
            int no = in.nextInt();
            int maiorNo = grafo.nodeMax(no);
            System.out.println("No " + no + ": " + maiorNo);
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
    int[] maxNode; // Armazena o maior nó de cada componente conexa

    // constructs a graph with n nodes and 0 edges
    Graph(int n) {
        this.n = n;
        nodes = new Node[n + 1]; // +1 porque os nós são indexados de 1 a n
        for (int i = 1; i <= n; i++) {
            nodes[i] = new Node();
        }
        maxNode = new int[n + 1];
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

    // Pré-processamento: identificar componentes conexas e seus maiores nós
    public void conectionMax() {
        // Percorre os nós em ordem decrescente (do maior para o menor)
        for (int i = n; i >= 1; i--) {
            if (!nodes[i].visited) { // Se o nó ainda não foi visitado
                int max = i; // Assume que o nó atual é o maior da componente
                Queue<Integer> queue = new LinkedList<>(); // Fila para a BFS
                queue.add(i);
                nodes[i].visited = true;

                // BFS para explorar a componente conexa
                while (!queue.isEmpty()) {
                    int current = queue.poll();
                    maxNode[current] = max; // Mapeia o nó para a componente
 

                    // Explora os nós adjacentes
                    for (int adj : nodes[current].adj) {
                        if (!nodes[adj].visited) {
                            nodes[adj].visited = true;
                            queue.add(adj);
                        }
                    }
                }
                
            }
        }
    }

    // Retorna o maior nó da componente conexa do nó 'node'
    public int nodeMax(int node) {
        return maxNode[node]; // Retorna o maior nó da componente
    }
}