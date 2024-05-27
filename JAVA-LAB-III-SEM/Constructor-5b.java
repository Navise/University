// Write a java program demonstrating Method overloading and constructor overloading

import java.util.Scanner;
public class constructor {
    int s ;
    constructor()
    {
        System.out.println("Sum =");
    }
    constructor(int a , int b)
    {
        s = a + b;
    }
    void display()
    {
        System.out.println(s);
    }
    public static void main(String[] args) {
        
        Scanner s = new Scanner(System.in);
        int a ,b;
        System.out.println("Enter the two numbers: ");
        a = s.nextInt();
        b = s.nextInt();

        constructor con = new constructor();
        constructor conart = new constructor(a ,b);
        
        conart.display();
    }
}
