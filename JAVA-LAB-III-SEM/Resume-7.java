/*Write a program to generate the resume. Create 2 Java classes Teacher (data: personal information,
qualification, experience, achievements) and Student (data: personal information, result, discipline) which
implements the java interface Resume with the method biodata().
 */

import java.util.Scanner;

interface resumes {
    public void biodata();
}

class Teacher implements resumes
{
    String name , qual  , exp  , achiv ;
    Scanner in = new Scanner(System.in);
    public void biodata()
    {
        System.out.println("Enter the name of the teacher: ");
        name = in.next();
        System.out.println("Enter the qualification of the teacher: ");
        qual = in.next();
        System.out.println("Enter the experience of the teacher: ");
        exp = in.next();
        System.out.println("Enter the achievements of the teacher: ");
        achiv = in.next();

        System.out.println("Name: "+ name);
        System.out.println("Qualification "+ qual);
        System.out.println("Experience: "+exp);
        System.out.println("Achievments: "+achiv);
    }
}
class Student implements resumes
{
    String name , result , disc;
    int roll;
    Scanner in = new Scanner(System.in);
    public void biodata()
    {
        System.out.println("Enter the name of the student: ");
        name = in.next();
        System.out.println("Enter the roll of the student: ");
        roll = in.nextInt();
        System.out.println("Enter the result of the student: ");
        result = in.next();
        System.out.println("Enter the discipline: ");
        disc = in.next();

        System.out.println("Name: "+name);
        System.out.println("Roll Number: "+roll);
        System.out.println("Result: "+result);
        System.out.println("Discipline: "+disc);
    }
}
class Main{
    public static void main(String[] args) {
        Teacher t  = new Teacher();
        Teacher  t2 = new Teacher();
        t.biodata();
        t2.biodata();
        
        Student s0 = new Student();
        Student s1 = new Student();
        s0.biodata();
        s1.biodata();
    }
}
