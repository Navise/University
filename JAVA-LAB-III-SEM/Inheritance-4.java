/*
  Design a super class called Staff with details as StaffId, Name, Phone, Salary. Extend this class by
writing three subclasses namely Teaching (domain, publications), Technical (skills), and Contract (period). Write a
Java program to read and display at least 3 staff objects of all three categories.
 */


import java.util.Scanner;

class staff{
    String staffid , name ;
    long phone;
    float salary;

    public void accept()
    {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the Staff id: ");
        staffid = s.next();
        System.out.println("Enter the name: ");
        name = s.next();
        System.out.println("Enter Phone number: ");
        phone = s.nextLong();
        System.out.println("Enter the salary of the staff: ");
        salary = s.nextFloat();
    }
    public void display()
    {
        System.out.println("Staff id = "+staffid);
        System.out.println("Name     = "+name);
        System.out.println("Phone no = "+phone);
        System.out.println("Salary   = "+salary);
    }
}

class Teaching extends staff{
    String domain , publication;
    public void accept()
    {
        super.accept();
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the domain :");
        domain = s.next();
        System.out.println("Enter the publication: ");
        publication = s.next();
    }
    public void display()
    {
        super.display();
        System.out.println("Domain      ="+domain);
        System.out.println("Publication ="+publication);
    }
}

class Technical extends staff{
    String skills;
    public void accept()
    {
        super.accept();
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the skill: ");
        skills = s.next();
    }
    public void display()
    {
        super.display();
        System.out.println("Skills = "+skills);
    }
}

class Contract extends staff{
    int period;
    public void accept()
    {
        super.accept();
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the period of working: ");
        period= s.nextInt();
    }
    public void display()
    {
        super.display();
        System.out.println("Period of working ="+period);
    }
}

public class Inheritance {
    public static void main(String[] args) {
        Teaching teach = new Teaching();
        Technical tech = new Technical();
        Contract con = new Contract();

        System.out.println("Enter the details of the Staff members : ");
        teach.accept();
        tech.accept();
        con.accept();

        System.out.println("The Staff panel members are: ");
        teach.display();
        tech.display();
        con.display();
    }
}
