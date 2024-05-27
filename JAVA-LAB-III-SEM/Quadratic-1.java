/*
Write a java program that prints all real solutions to the quadratic equation. ax2+bx+c=0. Read in a, b,
c and use the quadratic formula.
*/

import java.util.Scanner;

public class Quadratic-1 {
    public static void main(String[] args)
    {
        System.out.println("Enter the coefficents of x^2 , x and constant: ");
        Scanner ins = new Scanner(System.in);
        double a = ins.nextDouble();
        double b = ins.nextDouble();
        double c = ins.nextDouble();
        double d = (b*b) - 4*a*c;
        double r1, r2;
        ins.close();
        if(a == 0)
        {
            System.out.println("this is a linear equation");
        }
        else if(d == 0)
        {
            System.out.println("The equations are real and equal ");
            r1 = r2 = (-b)/(2*a);
            System.out.println("The roots are "+ r1 + "and "+ r2);
        }
        else if(d > 0)
        {
            System.out.println("The roots are real and distinct: ");
            r1 = (-b + Math.sqrt(d))/(2*a);
            r2 = (-b - Math.sqrt(d))/(2*a);
            System.out.println("The roots of the equation are "+ r1 + "and" + r2);
        }
        else{
            System.out.println("The roots are imaginary and complex");
            r1 = -b/(2*a);
            r2 = (-d)/(2*a);
            System.out.println("The roots of the quadratic equation is " + r1 +"+i" + r2 + "and " + r1 + "-i" + r2);
        }
    }
}
