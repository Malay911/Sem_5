//matrix multiplication
import java.util.Scanner;
public class matrixmultiplication {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int[][] arr=new int[3][3];
        int[][] brr=new int[3][3];
        int[][] crr=new int[3][3];
        System.out.println("Enter the elements of first matrix: ");
        for(int i=0;i<crr.length;i++){
            for(int j=0;j<crr.length;j++){
                arr[i][j]=sc.nextInt();
            }
        }
        System.out.println("Enter the elements of second matrix: ");
        for(int i=0;i<crr.length;i++){
            for(int j=0;j<crr.length;j++){
                brr[i][j]=sc.nextInt();
            }
        }
        System.out.println("Multiplication of the two array is:");
        for(int i=0;i<crr.length;i++){
            for(int j=0;j<crr.length;j++){
                crr[i][j]=0;
                for(int k=0;k<crr.length;k++){
                    crr[i][j] += arr[i][k] * brr[k][j];
                }
            }
        }
        System.out.println("The result of the multiplication is:");
        for(int i=0;i<crr.length;i++){
            for(int j=0;j<crr.length;j++){
                System.out.print(crr[i][j] + " ");
            }
        }
        sc.close();
    }
}