//write a java program to find a factorial of a number. Take input from the user

import java.util.Scanner;
public class factorial {
    public static int fact(int no)
        {
            if(no == 0)
            {
                return 1;
            }
            else{
                return no * fact(no - 1);
            }
        }
    public static void main(String[] args)
    {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the Number: ");
        int n = s.nextInt();

        int result = fact(n);
        System.out.println("The factorial of "+n+" is "+result);
    }
}
