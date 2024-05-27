//Write a java program to Reverse String. Get string input from the User

import java.util.Scanner;
public class ReverseString {
    public static void main(String[] args)
    {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the String: ");
        String str = s.next();
        String rev = "";

        System.out.println("Orignial String: "+str);
        for(int i = str.length() - 1; i>=0;  i--)
        {
            rev += str.charAt(i);
        }
        System.out.println("Reversed String: "+rev);
    }
}
