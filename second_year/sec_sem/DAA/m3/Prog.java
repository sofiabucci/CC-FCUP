// -------------------------------------------------------------
// Design and Analysis of Algorithms 2024/2025 (FCUP)
// http://www.dcc.fc.up.pt/~apt/aulas/DAA/2425/
// File: Prog.java
//
//    Here Graph stands for an unweighted directed graph
// -------------------------------------------------------------


import java.io.*;
import java.util.*;

enum Color {
    WHITE, GRAY, BLACK
}
// Access to the constants using:   Color.WHITE  Color.GRAY  Color.BLACK 


// Class that represents a node
class Node {
    public LinkedList<Integer> adj; // The list of outgoing edges (to adjacent nodes)
    public boolean visited;         // Has the node been visited in a graph traversal?
    //public int distance;         // Distance from a source node (or to keep some value)?
    public int label;  // some useful value?
    public Color color; 

    Node() {
        adj = new LinkedList<Integer>();
    }
}

// Class that represents a graph
class Graph {
    int n;           // Number of nodes of the graph
    Node nodes[];    // Array that will contain the nodes

   

    // constructs a graph with n nodes and 0 edges
    Graph(int n) {
        this.n = n;
        nodes  = new Node[n+1]; // +1 if the labels start at 1 instead of 0
        for (int i=1; i<=n; i++)
            nodes[i] = new Node();
    }
    
    // Directed graph - adds edge from a to b
    public void addEdge(int a, int b) {
        nodes[a].adj.add(b);
    }

    // checks whether {a,b} is an edge
    public boolean isEdge(int a,int b) {
	return nodes[a].adj.contains(b);
    }

    // sets all nodes as not visited
    public void clearVisited() {
	for(int i=1; i<=n; i++)
	    nodes[i].visited = false;
    }
	
    // returns the number of vertices
    public int numVertices(){
	return n;
    }

    // --------------------------------------------------------------
    // Breadth-First Search (BFS) from node v: example implementation
    // --------------------------------------------------------------
    public void bfs(int v) {
        LinkedList<Integer> q = new LinkedList<Integer>();   // queue
        for (int i=1; i<=n; i++) nodes[i].visited = false;

        q.add(v);
        nodes[v].visited = true;
	    System.out.println(v);
	    
        while (q.size() > 0) {
            int u = q.removeFirst();
            for (int w : nodes[u].adj)
                if (!nodes[w].visited) {
                    q.add(w);
                    nodes[w].visited  = true;
		    System.out.println(w);
                }	    
        }
    }

    // --------------------------------------------------------------
    // Depth-First Search (DFS) from node v: example implementation
    // --------------------------------------------------------------
    public void dfs(int v) {
        nodes[v].visited = true;
	System.out.println(v);
	    
	for (int w : nodes[v].adj)
	    if (!nodes[w].visited) 
		dfs(w);
    }


    // --------------------------------------------------------------
    // Read a undirected graph in the format:
    // nr_nodes nr_edges
    // src_1 dest_1
    // src_2 dest_2
    // ...
    // src_n dest_n
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
  
    //--------------------------------------------------------------
    //  Checks whether the graph contains a cycle
    //---------------------------------------------------------------

    boolean dfs_hasCycle(int v) {
        nodes[v].color = Color.GRAY; // Mark as being visited (in recursion stack)
        
        for (int w : nodes[v].adj) {
            if (nodes[w].color == Color.GRAY) {
                return true; // Found a back edge, cycle exists
            }
            if (nodes[w].color == Color.WHITE && dfs_hasCycle(w)) {
                return true;
            }
        }
        
        nodes[v].color = Color.BLACK; // Mark as fully processed
        return false;
    }

    public boolean hasCycle() {
	for(int v=1; v <= n; v++) 
	    nodes[v].color = Color.WHITE;
  
	for(int v=1; v<=n; v++)
	    if (nodes[v].color == Color.WHITE && dfs_hasCycle(v)) 
		return true;
	
	return false; 
    }



    //------------------------------------------------------------------------------------
    //  Assuming g is a DAG (directed acyclic graph) and a permutation of V={1,...,n} given 
    //  in array order (from position 0 to n-1, inclusive), returns true iff order defines 
    //  the sequence of vertices sorted in topological order, i.e.,
    //  iff, for all i and j,  with j > i,  (order[j],order[i])  is not an edge of the graph
    //------------------------------------------------------------------------------------

  
    public boolean isTopologicalOrder(int [] order) {  
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


    //--------------------------------------------------------------------------------
    //  Computes indegree for every node
    //--------------------------------------------------------------------------------

    public void inDegrees(int [] inDegs) {
        for (int i = 1; i <= n; i++) {
            inDegs[i] = 0;
        }

        for (int u = 1; u <= n; u++) {
            for (int v : nodes[u].adj) {
                inDegs[v]++;
            }
        }
    }


    //------------------------------------------------------------------------------------
    //  Assuming g is a DAG (directed acyclic graph), returns true iff the graph
    //  admits a single topological order. 
    //  In addition, in the end, order[0],order[1],..., order[n-1] is 
    //  the sequence of nodes in topological order
    //------------------------------------------------------------------------------------


    public boolean topologicalSort(int [] order) {  
	int [] inDegs = new int[n+1];
	inDegrees(inDegs);

    Queue<Integer> q = new LinkedList<>();
    for (int i = 1; i <= n; i++) {
        if (inDegs[i] == 0) {
            q.add(i);
        }
    }

    int index = 0;

    while (!q.isEmpty()){
        if (q.size()>1) return false;

        int v = q.remove();

        order[index++] = v;

        for (int w : nodes[v].adj){
            inDegs[w]--;
            if (inDegs[w]==0) q.add(w);
        }
    }

	return true;
    }

}



//=============================
//  Testing
//=====================================


public class Prog {
    
    static void writeVec(int [] x, int n) {
	System.out.print(x[0]);
	for(int i= 1; i< n; i++)
	    System.out.print(" " + x[i]);
	System.out.println();
    }

    /* 
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

	// Number of graphs to test
	int instances = scanner.nextInt();
	
	// For each graph: read, call the method, output the result, and delete graph at the end
	for(int i=1; i <= instances; i++) {
	    Graph g = Graph.readGraph(scanner);
	    System.out.println("Graph #" + i + ": hasCycle() = " + (g.hasCycle()? "true": "false"));
	}
    }

    */



    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

	// Number of graphs to test
	int instances = scanner.nextInt();
	
	// For each graph: read, call the method, output the result, and delete graph at the end
	for(int i=1; i <= instances; i++) {
	    Graph g = Graph.readGraph(scanner);
	    if (g.hasCycle()) 
		System.out.println("Graph #" + i + ": not a DAG (has cycle)");
	    else {
		int[] order = new int[g.numVertices()+1];
		if (g.topologicalSort(order)) {
		    System.out.print("Graph #" + i + ": DAG with a single topological order: ");
		    writeVec(order,g.numVertices());
		} else 
		    System.out.println("Graph #" + i + ": DAG with more than one topological order");
	    }
	}
    }
    
}
