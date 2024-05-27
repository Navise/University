/*
Design, Develop and Implement a menu-driven Program in C for the following Array operations
Creating an Array of N Integer Elements
Display of Array Elements with Suitable Headings
Inserting an Element (ELEM) at a given valid Position (POS)
Deleting an Element at a given valid Position(POS)
Exit.
Support the program with functions for each of the above operations.
*/

#include<stdio.h>
#include<stdlib.h>        

int a[10],n,elem,i,pos;

void create()
{

 printf("Enter the size of array\n");
 scanf("%d",&n);
 printf("Enter the elements of array\n");
 for(i=0; i<n; i++)
  scanf("%d",&a[i]);
}

void display()
{
 printf("The array elements are:\n");
 for(i=0; i<n; i++)
  printf("%d\t",a[i]);
}

void insert()
{
 printf("Enter the position for new element:\n");
 scanf("%d",&pos);
 printf("Enter the element to be inserted:\n");
 scanf("%d",&elem);
 for (i = n-1; i >=pos; i--)
  a[i+1]=a[i];
 a[pos]=elem;
 n=n+1;
}

void delete()
{
 printf("Enter  position of element to be deleted:\n");
 scanf("%d",&pos);
 elem=a[pos];
 for (i = pos; i < n-1; i++)
  a[i]=a[i+1];
 n=n-1;
 printf("Deleted element is %d\n",elem );
}

int main()
{
 int ch;
 do
 {
  printf("\n____MENU____\n");
  printf("1.Create\n2.Display\n3.Insert\n4.Delete\n5.Exit\n");
  printf("Enter Your Choice:");
  scanf("%d",&ch);
  switch(ch)
  {
   case 1:create();break;
   case 2:display();break;
   case 3:insert();break;
   case 4:delete();break;
   case 5:exit(0);break;
   default :printf("INVALID CHOICE\n");
  }
 }while(1);
 return 0;
}
