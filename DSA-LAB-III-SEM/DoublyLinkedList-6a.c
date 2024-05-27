#include<stdio.h>
#include<stdlib.h>
int count = 0;
	struct node{
		char id[20], name[20], dept[20], area[10];
		struct node *prev;
		struct node *next;
	}*TOP = NULL;

	void push(){
		struct node *new_node;
		new_node = (struct node*)malloc(sizeof(struct node));
		printf("Enter the ID : ");
		scanf("%s", new_node -> id);
		printf("Enter the Name : ");
		scanf("%s", new_node -> name);
		printf("Enter the Branch : ");
		scanf("%s", new_node -> dept);
		printf("Enter the Area of Specialization : ");
		scanf("%s", new_node -> area);

		if(TOP == NULL){
			new_node -> next = NULL;
			new_node -> prev = NULL;
			TOP = new_node;
		}
		else{
			new_node -> prev = TOP;
            TOP -> next = new_node;
			TOP = new_node;
			new_node -> next = NULL;
		}
		count++;
	}

	void pop(){
		struct node *ptr;
		if(TOP == NULL){
			printf("Stack Underflow");
		}
		else if(TOP -> next == NULL && TOP -> prev == NULL){
			ptr = TOP;
			printf("The data popped are : \n");
			printf("%s\t%s\t%s\t%s\n", ptr -> id, ptr -> name, ptr -> dept, ptr -> area);
			free(ptr);
			TOP = NULL;

		}

		else{
			ptr = TOP;
			TOP = TOP -> prev;
			TOP -> next = NULL;
			printf("The data popped are : \n");
			printf("%s\t%s\t%s\t%s\n", ptr -> id, ptr -> name, ptr -> dept, ptr -> area);
			free(ptr);
		}
		count--;
	}
	void display(){
		if(TOP == NULL){
			printf("Stack is Empty");
		}
		else{
			struct node *temp;
			temp = TOP;
			printf("ID\tNAME\tBRANCH\tAREA\n");
			while(temp != NULL){
				printf("%s\t%s\t%s\t%s\n", temp -> id, temp -> name, temp -> dept, temp -> area);
				temp = temp -> prev;
			}
		}
	}
	int main(){
		int choice;
		while (1){
			printf("\n1.PUSH\n2.DISPLAY\n3.POP\n4.COUNT\n5.EXIT\n");
			printf("Enter your choice : \n");
			scanf("%d", &choice);
			switch(choice){
			case 1: push();
				break;
			case 2: display();
				break;
			case 3: pop();
				break;
			case 4: printf("The number of nodes are %d",count);
				break;
            case 5: exit(0);
            break;
			default: printf("\nInvalid Choice\n\n");
	        		 break;
			}
		}
		return 0;
	}

