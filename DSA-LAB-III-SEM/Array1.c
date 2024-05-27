#include<stdio.h>
#include<stdlib.h>

int a[50] , n;

void create()
{
    int i;
    printf("Enter the number of elements: ");
    scanf("%d",&n);
    printf("Enter the array elements: ");
    for(i=0; i<n; i++)
    {
        scanf("%d",&a[i]);
    }
}

void display()
{
    int i;
    printf("The elements of the array are: ");
    for(i=0; i<n; i++)
    {
        printf("%d\t",a[i]);
    }
}

int main()
{
    int ch;
    do{
        printf("\nEnter the menu options: \n1.Create\n2.display\n3.Exit: ");
        scanf("%d",&ch);
        switch(ch)
        {
            case 1:create(); break;
            case 2:display();break;
            case 3:exit(0); break;
            default: printf("Invalid option! ");
        }
    }while(ch);
}
