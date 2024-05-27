/* Write a program to perform string operations using ArrayList. Write functions for the following a.
Append - add at end b. Insert – add at particular index c. Search d. List all string starts with given letter.
Aim: Introduce java Collections.*/
import java.util.Scanner;
public class ExceptionHandling {
    public static void main(String[] args) {
        Scanner s  = new Scanner(System.in);
        int a , b , c;

        System.out.println("Enter two integers: ");
        a = s.nextInt();
        b = s.nextInt();

        try{
            if(b == 0)
            {
                throw new ArithmeticException("Divide by zero ");
            }
            c = a/b;
            System.out.println("The value of a divided by b is  : "+ c);
        }catch(ArithmeticException ae)
        {
            ae.printStackTrace();
        }
    }
}
