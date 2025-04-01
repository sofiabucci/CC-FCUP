import java.io.*;
import java.util.*;

class Graph {
    int n;
    List<int[]> edges;
    List<List<Integer>> adj;
    int[] inDegree;
    Map<String, Integer> durationMap;

    Graph(int n) {
        this.n = n;
        edges = new ArrayList<>();
        adj = new ArrayList<>(n + 1);
        inDegree = new int[n + 1];
        durationMap = new HashMap<>();
        for (int i = 0; i <= n; i++) adj.add(new ArrayList<>());
    }

    void addEdge(int i, int j, int d) {
        adj.get(i).add(j);
        inDegree[j]++;
        edges.add(new int[]{i, j, d});
        durationMap.put(i + "," + j, d);
    }

    int[] computeSchedule() {
        int[] es = new int[n + 1]; // Early Start
        Queue<Integer> queue = new LinkedList<>();
        for (int i = 1; i <= n; i++) {
            if (inDegree[i] == 0) queue.add(i);
        }
        
        while (!queue.isEmpty()) {
            int node = queue.poll();
            for (int next : adj.get(node)) {
                int duration = durationMap.get(node + "," + next);
                es[next] = Math.max(es[next], es[node] + duration);
                if (--inDegree[next] == 0) queue.add(next);
            }
        }
        
        int projectDuration = Arrays.stream(es).max().getAsInt();
        
        TreeMap<Integer, Integer> eventMap = new TreeMap<>();
        for (int[] edge : edges) {
            int start = es[edge[0]];
            int end = start + edge[2];
            eventMap.put(start, eventMap.getOrDefault(start, 0) + 1);
            eventMap.put(end, eventMap.getOrDefault(end, 0) - 1);
        }
        
        int maxConcurrent = 0, maxTime = 0, activeTasks = 0;
        for (Map.Entry<Integer, Integer> entry : eventMap.entrySet()) {
            activeTasks += entry.getValue();
            if (activeTasks > maxConcurrent) {
                maxConcurrent = activeTasks;
                maxTime = entry.getKey();
            }
        }
        
        return new int[]{projectDuration, maxConcurrent, maxTime};
    }
}

public class D {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int t = in.nextInt();
        Graph graph = new Graph(n);
        
        for (int i = 0; i < t; i++) {
            int u = in.nextInt(), v = in.nextInt(), d = in.nextInt();
            graph.addEdge(u, v, d);
        }
        
        int[] result = graph.computeSchedule();
        System.out.println(result[0] + " " + result[1] + " " + result[2]);
        in.close();
    }
}
