import java.util.*;

public class DominantSetOFUndirectedGraph {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number of vertices: ");
        int vertices = sc.nextInt();
        System.out.print("Enter number of edges: ");
        int edges = sc.nextInt();

        int[][] arr = new int[edges][2];
        for (int i = 0; i < edges; i++) {
            System.out.println("Edge " + (i + 1) + ":");
            System.out.print("Start vertex: ");
            arr[i][0] = sc.nextInt();
            System.out.print("End vertex: ");
            arr[i][1] = sc.nextInt();
        }

        findDominatingSets(arr, vertices);
        sc.close();
    }

    public static void findDominatingSets(int[][] arr, int vertices) {
        HashMap<Integer, ArrayList<Integer>> graph = new HashMap<>();
        for (int i = 1; i <= vertices; i++) {
            graph.put(i, new ArrayList<>());
        }

        for (int[] edge : arr) {
            int u = edge[0];
            int v = edge[1];
            graph.get(u).add(v);
            graph.get(v).add(u);
        }

        int totalSubsets = 1 << vertices; // 2^n
        System.out.println("\nAll Dominating Sets:");
        for (int mask = 1; mask < totalSubsets; mask++) {
            Set<Integer> currentSet = new HashSet<>();
            boolean[] visited = new boolean[vertices + 1]; 

            for (int i = 0; i < vertices; i++) {
                if ((mask & (1 << i)) != 0) {
                    int node = i + 1;
                    currentSet.add(node);
                    visited[node] = true;
                    for (int neighbor : graph.get(node)) {
                        visited[neighbor] = true;
                    }
                }
            }

            if (isAllDominated(visited, vertices)) {
                System.out.println(currentSet);
            }
        }
    }

    public static boolean isAllDominated(boolean[] visited, int vertices) {
        for (int i = 1; i <= vertices; i++) {
            if (!visited[i]) return false;
        }
        return true;
    }
}