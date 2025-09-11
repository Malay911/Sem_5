import java.util.Scanner;

public class LaplacianMatrix {
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        System.out.println("Enter number of vertices:");
        int n = sc.nextInt();
        System.out.println("Enter number of edges:");
        int m = sc.nextInt();
        int[][]matrix=new int[m][2];
        System.out.println("Enter edges (u v):");
        for(int i=0;i<m;i++){
            matrix[i][0]=sc.nextInt()-1;
            matrix[i][1]=sc.nextInt()-1;
        }

        int[][] adj = new int[n][n];
        for(int i=0;i<m;i++){
            int u = matrix[i][0];
            int v = matrix[i][1];
            adj[u][v] = 1;
            adj[v][u] = 1;
        }

        int[] degree = new int[n];
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                degree[i] += adj[i][j];
            }
        }
        
        int[][] laplacian = new int[n][n];
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                if(i == j) {
                    laplacian[i][j] = degree[i];
                } else {
                    laplacian[i][j] = -adj[i][j];
                }
            }
        }
        System.out.println("Laplacian Matrix:");
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                System.out.print(laplacian[i][j] + " ");
            }
            System.out.println();
        }
        sc.close();
    }    
}
