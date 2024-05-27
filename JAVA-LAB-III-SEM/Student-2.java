/*
 Create a Java class called Student with the following details as variables within it.
USN, Name, Branch, Phone.
Write a Java program to create n Student objects and print the USN, Name, Branch, and Phone of these objects
with suitable headings
*/

import java.util.*;
class student{
    String usn , name , branch ;
    long ph;
    student()
    {
        usn = name = branch = null;
        ph = 0;
    }
    void read(String u , String n , String b , long p)
    {
        usn = u;
        name = n;
        branch = b;
        ph = p;
    }
    void display()
    {
        System.out.println(usn + "\t" + name + "\t" + branch + "\t" + ph);
    }
}
    class program2{
        public static void main(String[] args)
        {
            String u, n, b;
            long p;
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter number of students: ");
            int no = sc.nextInt();
            student[] s = new student[no];
            for(int i=0; i<s.length; i++)
            {
                System.out.println("Enter the student record: ");
                s[i] = new student();
                System.out.println("Enter the usn: ");
                u = sc.next();
                System.out.println("Enter the name: ");
                n = sc.next();
                System.out.println("Enter the Branch: ");
                b = sc.next();
                System.out.println("Enter the phone number: ");
                p = sc.nextLong();
                s[i].read(u, n, b, p);
            }
            System.out.println("\n The data of students:\n");
            System.out.println("USN\t"+"Name\t"+"Branch\t"+"phone");
            for(int i=0; i<s.length; i++)
            {
                s[i].display();
            }
            
        }
    }

