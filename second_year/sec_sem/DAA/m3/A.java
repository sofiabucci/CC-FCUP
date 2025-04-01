import java.util.*;

public class A {
    public static void main(String[] args) {

    }

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
}