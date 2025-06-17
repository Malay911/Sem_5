import java.util.*;

public class BFS {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of vertices:");
        int V = sc.nextInt();
        System.out.println("Enter the number of edges:");
        int E = sc.nextInt();

        ArrayList<ArrayList<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < V; i++) {
            adj.add(new ArrayList<>());
        }

        System.out.println("Enter the edges (u v):");
        for (int i = 0; i < E; i++) {
            int u = sc.nextInt();
            int v = sc.nextInt();
            adj.get(u).add(v);
            adj.get(v).add(u);
        }

        System.out.println("BFS Traversal:");
        System.out.println(bfs(V, adj));

        sc.close();
    }

    public static ArrayList<Integer> bfs(int V, ArrayList<ArrayList<Integer>> adj) {
        ArrayList<Integer> result = new ArrayList<>();
        boolean[] visited = new boolean[V];
        Queue<Integer> queue = new LinkedList<>();

        queue.add(0);
        visited[0] = true;

        while (!queue.isEmpty()) {
            int node = queue.poll();
            result.add(node);

            for (int neighbor : adj.get(node)) {
                if (!visited[neighbor]) {
                    visited[neighbor] = true;
                    queue.add(neighbor);
                }
            }
        }
        return result;
    }
}

// import java.util.*;

// class BFS {
//     static ArrayList<Integer> bfs(
//         ArrayList<ArrayList<Integer>> adj) {
//         int V = adj.size();
//         int s = 0;
//         ArrayList<Integer> res = new ArrayList<>();
//         Queue<Integer> q = new LinkedList<>();
//         boolean[] visited = new boolean[V];
//         visited[s] = true;
//         q.add(s);
        
//         while (!q.isEmpty()) {            
//             int curr = q.poll();
//             res.add(curr);
//             for (int x : adj.get(curr)) {
//                 if (!visited[x]) {
//                     visited[x] = true;
//                     q.add(x);
//                 }
//             }
//         }
//         return res;
//     }
    
//     public static void main(String[] args) {
//         ArrayList<ArrayList<Integer>> adj = new ArrayList<>();
//         adj.add(new ArrayList<>(Arrays.asList(1, 2)));
//         adj.add(new ArrayList<>(Arrays.asList(0, 2, 3)));       
//         adj.add(new ArrayList<>(Arrays.asList(0, 4)));       
//         adj.add(new ArrayList<>(Arrays.asList(1,4)));          
//         adj.add(new ArrayList<>(Arrays.asList(2,3)));          
        
//         ArrayList<Integer> ans = bfs(adj);
//         for (int i : ans) {
//             System.out.print(i + " ");
//         }
//     }
// }