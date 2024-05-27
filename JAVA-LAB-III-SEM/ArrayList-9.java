/*Write a program to perform string operations using ArrayList. Write functions for the following a.
Append - add at end b. Insert – add at particular index c. Search d. List all string starts with given letter.
Aim: Introduce java Collections. */
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

class arraylist {
    public static void main(String[] args) {
        ArrayList<String> obj = new ArrayList<String>();
        Scanner s = new Scanner(System.in);
        int i , j ,c , ch;

        String str , str1;
        do{
            System.out.println("String manipulations ");
            System.out.println("1.Enter the string to append\n2. Enter the string to add at a particular index\n3. Search \n4.List all string starts with given letter\n4. Starts with a given letter \n5.Size of the array list \n6.Remove an element form the array list\n7.Sort the array list");
            System.out.println("enter the choice ");
            c = s.nextInt();
            switch(c)
            {
                case 1:
                {
                    System.out.println("Enter the string ");
                    str = s.next();
                    obj.add(str);
                    break;
                }
                case 2:
                {
                    System.out.println("Enter the string ");
                    str = s.next();

                    System.out.println("Entre the position ");
                    i = s.nextInt();

                    obj.add(i-1, str);
                    System.out.println(obj);
                    break;
                }
                case 3:
                {
                    System.out.println("Enter the string to search ");
                    str = s.next();
                    j = obj.indexOf(str);
                    if(j == -1) System.out.println("Element not found");
                    else System.out.println("str is at " + j);
                    break;
                }
                case 4:
                {
                    System.out.println("Enter the character to list string that startswith the given string ");
                    str  = s.next();
                    for(i=0; i<(obj.size() - 1); i++)
                    {
                        str1 = obj.get(i);
                        if(str1.startsWith(str))
                        {
                            System.out.println(str1);
                        }
                    }
                    break;
                }
                case 5:
                {
                    System.out.println(obj.size());
                    break;
                }
                case 6:
                {
                    System.out.println("Enter the element to remove ");
                    str = s.next();
                    if(obj.remove(str))
                    {
                        System.out.println(str+ "removed ");
                    }
                    else
                    {
                        System.out.println("element not present ");
                    }
                }
                case 7:
                {
                    Collections.sort(obj);
                    System.out.println(obj);
                }
            }
            System.out.println("Enter 1 to continue");
            ch = s.nextInt();
        }while(ch == 1);
    }
}
    
