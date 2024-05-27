#include<stdio.h>
#include<stdlib.h>

struct node{
    int info;
    struct node *next;
};

typedef struct node NODE;

void display(NODE *head)
{
    if(head != NULL)
    {
        printf("%d\t",head->info);
        display(head->next);
    }
}

void concan(NODE *a , NODE *b)
{
    if(a != NULL && b != NULL)
    {
        if(a->next == NULL)
        {
            a->next = b;
        }
        else
        {
            concan(a->next , b);
        }
    }
    else
    {
        printf("A or B Linked List is empty");
    }
}
int main()
{
    NODE *prev , *a , *b , *p;
    int n , i;
    printf("Enter the number of elements of a: ");
    scanf("%d",&n);
    a = NULL;
    for(i=0; i<n; i++)
    {
        p = malloc(sizeof(NODE));
        scanf("%d",&p->info);
        p->next = NULL;
        if(a == NULL) a = p;
        else prev->next = p;
        prev = p;
    }

    printf("Enter the number of elements of b: ");
    scanf("%d",&n);
    b = NULL;
    for(i=0; i<n; i++)
    {
        p = malloc(sizeof(NODE));
        scanf("%d",&p->info);
        p->next = NULL;
        if(b == NULL) b = p;
        else prev->next = p;
        prev = p;
    }
    concan(a ,b);
    printf("\nThe concatenated Linked List elements are:\n ");
    display(a);
    return 0;
}
