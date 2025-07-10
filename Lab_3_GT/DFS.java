// package Lab.Lab_3_GT;

import java.util.*;

public class DFS {
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

        for (ArrayList<Integer> list : adj) {
            Collections.sort(list);
        }

        boolean[] visited = new boolean[V];
        System.out.println("DFS starting from vertex 0:");
        dfs(0, adj, visited);

        sc.close();
    }

    public static void dfs(int v, ArrayList<ArrayList<Integer>> adj, boolean[] visited) {
        visited[v] = true;
        System.out.print(v + " ");

        for (int neighbor : adj.get(v)) {
            if (!visited[neighbor]) {
                dfs(neighbor, adj, visited);
            }
        }
    }
}