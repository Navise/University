//Part - B Display n Fibonacci series sequence e.g n = 4 , output 0 1 1 2

import java.util.Scanner;
public class fibonacci {
    public static void main(String[] args)
    {
        int f = 0, s = 1, t ;
        Scanner in = new Scanner(System.in);
        System.out.println("Enter the number of terms: ");
        int term = in.nextInt();
        
        int i = 0;
        while(i++<term)
        {
            System.out.print(f+" ");
            t = f + s;
            f = s;
            s = t;
        }
    }
}
