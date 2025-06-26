import java.util.*;

public class Problem_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int count = 0;
        System.out.println("Enter the number of vertices (N):");
        int N = sc.nextInt();
        sc.nextLine();
        int[][] matrix = new int[N][N];
        int n = N;
        System.out.println("Enter the adjacency matrix (N x N):");
        for (int i = 0; i < n; i++) {
            String[] row = sc.nextLine().split(" ");
            for (int j = 0; j < n; j++) {
                matrix[i][j] = Integer.parseInt(row[j]);
            }
        }
        boolean[] visited = new boolean[n * n];
        int countOfCircles = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (matrix[i][j] == 1 && !visited[i * n + j]) {
                    countOfCircles++;
                    dfs(i, j, matrix, visited);
                }
            }
        }
        System.out.println("Total number of friend circles: " + countOfCircles);
        sc.close();
    }

    public static void dfs(int i, int j, int[][] matrix, boolean[] visited) {
        if (i < 0 || i >= matrix.length || j < 0 || j >= matrix[0].length || visited[i * matrix.length + j] || matrix[i][j] == 0) {
            return;
        }
        visited[i * matrix.length + j] = true;
        dfs(i - 1, j, matrix, visited);
        dfs(i + 1, j, matrix, visited);
        dfs(i, j - 1, matrix, visited);
        dfs(i, j + 1, matrix, visited);
    }
}
