//Array as input and printing it
import java.util.Scanner;
public class array{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        int[] arr=new int[5];
        System.out.println("Enter the elements of the array: ");
        for(int i=0;i<5;i++){
            arr[i]=sc.nextInt();
            System.out.println("Element at index "+i+" is "+arr[i]);
        }
    }
}