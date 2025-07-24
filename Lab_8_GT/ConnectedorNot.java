public class ConnectedorNot {
    public static void main(String[] args) {
        int m=4;
        int n=5;
        int[][] adj_matrix = new int[5][5];
        int arr[][]={{1,2},{2,3},{4,5},{1,5}};
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                for(int k=0;k<arr.length;k++){
                    if(arr[k][0]==i+1 && arr[k][1]==j+1){
                        adj_matrix[i][j]=1;
                        adj_matrix[j][i]=1;
                    }
                }
            }
        }
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                System.out.print(adj_matrix[i][j]+" ");
            }
            System.out.println();
        }
        boolean is_connected = isGraphConnected(adj_matrix);
        System.out.println("Is graph connected: "+is_connected);
    }
    public static boolean isGraphConnected(int[][] adj_matrix){
        int n=adj_matrix.length;
        boolean[] visited=new boolean[n];
        int count=0;
        for (int i=0;i<n;i++) {
            if (!visited[i]){
                dfs(adj_matrix, i, visited);
                count++;
            }
        }
        return count == 1;
    }
    public static void dfs(int[][] adj_matrix,int node,boolean[] visited){
        visited[node]=true;
        for(int i=0;i<adj_matrix.length;i++){
            if(adj_matrix[node][i]==1 && !visited[i]){
                dfs(adj_matrix,i,visited);
            }
        }
    }
}
