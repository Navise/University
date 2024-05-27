import java.util.*;

class Square implements Runnable
{
    int x;
    Square(int n)
    {
        x = n;
    }
    public void run()
    {
        int sqr = x*x;
        System.out.println("The square of "+ x + " is "+ sqr);
    }
}
class Cube implements Runnable
{
    int x;
    Cube(int n)
    {
        x = n;
    }
    public void run()
    {
        int cube = x*x*x;
        System.out.println("The cube of "+ x + " is " + cube);
    }
}
class Number extends Thread
{
    public void run()
    {
        Random random = new Random();

        for(int i=0; i<5; i++)
        {
            int randint = random.nextInt(100);
            System.out.println("Random integer generated: "+ randint);
        
        Thread t1 = new Thread(new Square(randint));
        t1.start();

        Thread t2 = new Thread(new Cube(randint));
        t2.start();

        try{
            Thread.sleep(1000);
        }catch(InterruptedException e)
        {
            System.out.println(e);
        }
        }
    }
}
public class multithread{
    public static void main(String[] args) {
        Number n = new Number();
        n.start();
    }
}
