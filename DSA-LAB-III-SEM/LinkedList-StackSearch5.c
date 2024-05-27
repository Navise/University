#include<stdio.h>
#include<stdlib.h>

struct node{
    int info;
    struct node *next;
};

typedef struct node NODE;

NODE *first= NULL;
void insert_front()
{
    int data;
    NODE *new;
    new = (NODE*)malloc(sizeof(NODE));
    printf("Enter the data: ");
    scanf("%d",&new->info);
    new->next = first;
    first = new;
}
void delete_front()
{
    NODE *temp;
    if(first == NULL)
    {
        printf("List is Empty");
        return;
    }
    temp = first;
    first = first ->next;
    free(temp);
}
void display(NODE *head)
{
    if(head != NULL)
    {
        printf("%d\t",head->info);
        display(head->next);
    }
}

void search()
{
    int key;
    NODE *temp;
    if(first == NULL)
    {
        printf("the list is empty");
        return;
    }
    else
    {
        printf("Enter the search element: ");
        scanf("%d",&key);
        temp = first;
        int count = 0;
        while(temp != NULL)
        {
            if(temp->info == key)
            {
                printf("The element is found at %d position\n",count);
            }
            temp = temp ->next;
            count++;
        }
    }
}
void main()
{
    int ch;
    while(1)
    {
        printf("\n1.PUSH\n2.POP\n3.display\n4.Exit\n5.Search:");
        scanf("%d",&ch);
        switch(ch)
        {
            case 1:insert_front();
            break;
            case 2:delete_front();
            break;
            case 3:display(first);
            break;
            case 4:exit(0);
            break;
            case 5:search();
            break
        }
    }
}





