//Write a java program to find the sum and average of array elements . Take input form the user

import java.util.Scanner;
public class arraySumAverage {
    public static void main(String[] args)
    {
        int sum = 0;
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the number of array elements: ");
        int n = s.nextInt();
        int[] arr = new int[5];

        System.out.println("Enter the array elements ");
        for(int i=0; i<n; i++)
        {
            arr[i] = s.nextInt();
            sum += arr[i];
        }
        System.out.println("The sum of elements is: "+sum);

        System.out.println("The average of elements is: "+ (sum/n));
    }
}
