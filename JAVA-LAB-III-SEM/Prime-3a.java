/*
Program-3: a) Write a program to check prime number
*/
import java.util.Scanner;
public class AimPrime {
    public static void main(String[] args) {
        System.out.println("Enter the number: ");
        Scanner p = new Scanner(System.in);
        int x = p.nextInt();
        int flag = 0;

        for(int i=2; i<x/2; i++)
        {
            
            if(x%i == 0)
            {
                flag = 1;
                break;
            }
            else{
                flag = 0;
            } 
        }
        if (x == 1)
        {
            System.out.println("1 is Neither prime nor composite number");
        }
        else if(x <= 0)
        {
            System.out.println("The number is negative or zero");
        }
        else if(flag == 1)
        {
            System.out.println( x + " is not a prime number");
        }
        else
        {
            System.out.println(x +" is a prime number");
        }
    }
}
