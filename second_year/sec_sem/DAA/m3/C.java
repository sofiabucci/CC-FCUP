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