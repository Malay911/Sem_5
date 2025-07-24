public class Adjacency_Matrix {
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
    }
}
