//print addition of two matrix
import java.util.Scanner;
public class matrixaddition{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        int[][] arr=new int[3][3];
        int[][] brr=new int[3][3];
        int[][] crr=new int[3][3];
        // System.out.println("Enter the elements of the array: ");
        for(int i=0;i<crr.length;i++){
            for(int j=0;j<crr.length;j++){
                arr[i][j]=sc.nextInt();
                brr[i][j]=sc.nextInt();
                crr[i][j]=arr[i][j]+brr[i][j];
                System.out.println("Enter the elements of the array: ");
            }
        }
        for(int i[]:crr){
            for(int j:i){
                System.out.print(j+" ");
            }
            System.out.println("");
        }
        sc.close();
    }
}