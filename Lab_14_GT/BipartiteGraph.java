import java.util.Scanner;

public class BipartiteGraph {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.print("Enter the number of vertices in set 1: ");
        int n = sc.nextInt();
        System.out.print("Enter the number of vertices in set 2: ");
        int m = sc.nextInt();
        System.out.print("Enter the number of edges: ");
        int e = sc.nextInt();

        int [][] graph=new int[n][m];
        for(int i=0;i<e;i++){
            System.out.print("Enter vertex of set 1 for edge " + (i + 1) + ": ");
            int u = sc.nextInt()-1;

            System.out.print("Enter vertex of set 2 for edge " + (i + 1) + ": ");
            int v = sc.nextInt()-1;
            
            graph[u][v]=1;
        }
        System.out.println("Select the Set you want to check Hall's condition:");
        int setNo=sc.nextInt();

        System.out.println("Enter the number of vertices in set "+setNo+": ");
        int k=sc.nextInt();

        int[] subset=new int[k];
        for(int i=0;i<k;i++){
            System.out.print("Enter vertex "+(i+1)+" of set "+setNo+": ");
            subset[i]=sc.nextInt()-1;
        }

        int connections=0;
        if(setNo==1){
            boolean[] isvisited=new boolean[m];
            for (int i = 0; i < k; i++) {
                int u = subset[i];
                for (int v = 0; v < m; v++) {
                    if (graph[u][v] == 1 && !isvisited[v]) {
                        connections++;
                        isvisited[v] = true;
                    }
                }
            }
        }
        else{
            boolean[] isvisited=new boolean[n];
            for (int i = 0; i < k; i++) {
                int u = subset[i];
                for (int v = 0; v < n; v++) {
                    if (graph[v][u] == 1 && !isvisited[v]) {
                        connections++;
                        isvisited[v] = true;
                    }
                }
            }
        }

        if(k<=connections){
            System.out.println("Hall's condition holds.");
        }
        else{
            System.out.println("Hall's condition does not hold.");
        }
        sc.close();
    }
}
