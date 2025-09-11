// Find and print all cut-vertices (articulation points) in an undirected graph.

import java.util.*;
public class CutVertex {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println(" Enter the number of vertices ");
        int n = sc.nextInt();

        int[][] edgeSet = new int[n][n];
        for( int i = 0; i < n; i++ ) {
            for( int j = 0; j < n; j++ ) {
                System.out.println(" Enter 1 if there is edge between the vertices  " +( i )+ " and " +( j )+ " : " );
                edgeSet[i][j] = sc.nextInt();
            }
        }

        for (int i = 0; i < n; i++) {
            if (isCutVertex(edgeSet, n, i)) {
                System.out.println("The vertex " + i + " is a cut vertex");
            } else {
                System.out.println("The vertex " + i + " is not a cut vertex");
            }
        }
        sc.close();
    }

    private static boolean isCutVertex(int[][] edgeSet, int n, int notInclude){
        boolean[] visited = new boolean[n];
        int start = (notInclude == 0) ? 1 : 0;
        dfs(edgeSet, visited, n, start, notInclude);
        int count = 0;
        for (int i = 0; i < n; i++) {
            if (i != notInclude && visited[i]) {
                count++;
            }
        }
        return ( count < n - 1) ? true : false;
    }
    static void dfs(int[][] edgeSet, boolean[] visited, int n, int node, int notInclude) {
        visited[node] = true;
        for (int j = 0; j < n; j++) {
            if (j != notInclude && edgeSet[node][j] == 1 && !visited[j]) {
                dfs(edgeSet, visited, n, j, notInclude);
            }
        }
    }
}