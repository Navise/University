/*
b) Write a program for Arithmetic calculator using switch case menu
*/

import java.util.Scanner;
public class Aimcalc {
    public static void main(String[] args) {
        System.out.println("\tCalculator\t");
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the numbers a and b");
        Double a = sc.nextDouble();
        Double b= sc.nextDouble();
        
        System.out.println("Enter the operator (+ , - , * , / , %): ");
        char op = sc.next().charAt(0);

    
            switch (op) {
                case '+':
                System.out.println("The sum of the numbers is "+ (a+b));                    
                    break;
                case '-':
                System.out.println("The differenct of the numbers is "+ (a-b));
                    break;
                case '*':
                System.out.println("The product of the numbers is "+(a*b));
                    break;
                case '/':
                System.out.println("The division of the numbers is "+(a/b));
                    break;
                case '%':
                System.out.println("The remainder of the two numbers is"+ (a%b));
                    break;
                default:System.out.println("The input is invalid");
                    break;
            }
        }
    
}
