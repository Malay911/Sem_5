//minimum and maximum values
import java.util.Scanner;
public class minmax{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        int[] arr=new int[5];
        System.out.println("Enter the elements of the array: ");
        for(int i=0;i<5;i++){
            arr[i]=sc.nextInt();
            System.out.println("Element at index "+i+" is "+arr[i]);
        }
        int min=arr[0];
        int max=arr[0];
        for(int i=0;i<arr.length;i++){
            if(arr[i]<min){
                min=arr[i];
            }
            if(arr[i]>max){
                max=arr[i];
            }
        }
        System.out.println("Minimum value in the array is "+min);
        System.out.println("Maximum value in the array is "+max);
    }
}