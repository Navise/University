// Write a java program demonstrating Method overloading and constructor overloading

public class method {
    void add(int a , int b)
    {
        int sum = a + b;
        System.out.println("Sum ="+ (sum));
    }
    void add(int a , int b , int c)
    {
        int sum = a + b + c;
        System.out.println("Sum ="+ sum);
    }
    void add(float a , float b)
    {
        float sum = a + b;
        System.out.println("Sum ="+ sum);
    }
    public static void main(String[] args) {
        method m = new method();
        m.add(5, 41);
        m.add(7, 89, 87745);
    }
}
