import java.util.Arrays;

public class Problem_1 {
    public static void main(String[] args) {
        int edges[][] = {
                { 0, 1, 10 },
                { 1, 3, 15 },
                { 2, 3, 4 },
                { 2, 0, 6 },
                { 0, 3, 5 }
        };
        int n = 4;
        int m = edges.length;
        int cost = Kruskal(edges, n, m);
        System.out.println("Minimum Cost of Spanning Tree: " + cost);
    }

    public static int Kruskal(int edges[][], int n, int m) {
        DSU dsu = new DSU();
        int parent[] = new int[n];
        int rank[] = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = -1;
            rank[i] = 0;
        }
        Arrays.sort(edges, (a, b) -> a[2] - b[2]);
        int cost = 0;
        for (int i = 0; i < m; i++) {
            int u = edges[i][0];
            int v = edges[i][1];
            int wt = edges[i][2];
            if (dsu.find(parent, u) != dsu.find(parent, v)) {
                dsu.union(u, v, parent, rank);
                cost += wt;
            }
        }
        return cost;
    }
}

class DSU {
    public int find(int parent[], int i) {
        if (parent[i] == -1) {
            return i;
        }
        return parent[i] = find(parent, parent[i]);
    }

    void union(int x, int y, int[] parent, int[] rank) {
        int xroot = find(parent, x);
        int yroot = find(parent, y);

        if (xroot == yroot)
            return;
        if (rank[xroot] < rank[yroot]) {
            parent[xroot] = yroot;
        } else if (rank[xroot] > rank[yroot]) {
            parent[yroot] = xroot;
        } else {
            parent[yroot] = xroot;
            rank[xroot]++;
        }
    }
}
