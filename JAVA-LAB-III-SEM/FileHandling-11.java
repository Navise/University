/*Program-11: Write a java program that reads a file name from the user, displays information about whether the
file exists, whether the file is readable, or writable, the type of file and the length of the file in bytes */

import java.io.*;
import java.util.Scanner;

class fileHandling{
  public static void main(String[] args) {
    Scanner s = new Scanner(System.in);
    System.out.println("Enter the file Name: ");
    String filename = s.next();

    File f = new File(filename);
    System.out.println("File Exist- " + f.exists());
    System.out.println("File is readable- "  + f.canRead());
    System.out.println("File is Writable- " + f.canWrite());
    System.out.println("Lenght of the File- "+ f.length()+"bytes");
    
    int dot = filename.lastIndexOf('.');
    System.out.println("The type of file is- " + filename.substring(dot + 1));
  }
}
