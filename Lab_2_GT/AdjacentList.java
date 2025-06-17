import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AdjacentList {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of vertices:");
        int V=sc.nextInt();
        System.out.println("Enter the number of edges:");
        int E=sc.nextInt();
        List<List<Integer>> adjList = new ArrayList<>();
        for(int i=0;i<V;i++){
            adjList.add(new ArrayList<>());
        }
        System.out.println("Enter the edges(u v):");
        for(int i=0;i<E;i++){
            int u=sc.nextInt();
            int v=sc.nextInt();
            adjList.get(u).add(v);
        }
        System.out.println("Adjacent list:");
        for(int i=0;i<V;i++){
            System.out.print(i+"->");
            for (int j : adjList.get(i)) {
                System.out.print(j + " ");
            }
            System.out.println();
        }
        sc.close();
    }
}
