#include<stdio.h>
#include<stdlib.h>

	struct node{
		char id[20], name[20], dept[20], area[10];
		struct node *prev;
		struct node *next;
	}*front = NULL , *rear = NULL;
	
	void enqueue(){
		struct node *new_node;
		new_node=(struct node*)malloc(sizeof(struct node));
		printf("Enter the ID : ");
		scanf("%s", new_node -> id);
		printf("Enter the Name : ");
		scanf("%s", new_node -> name);
		printf("Enter the Branch : ");
		scanf("%s", new_node -> dept);
		printf("Enter the Area of Specialization : ");
		scanf("%s", new_node -> area);
		if(front==NULL){
			front=new_node;
			rear=new_node;
			front->next=NULL;
			front->prev=NULL;
			}
		else{
			rear->next=new_node;
			new_node->next=NULL;
			new_node->prev=rear;
			rear=new_node;
			}
		}

	void dequeue(){
		struct node *ptr;
		if(front==NULL){
			printf("Queue is Empty");
		}
		else if(front->next == NULL && front->prev==NULL){
			printf("The data popped are : \n");
			printf("%s\t%s\t%s\t%s\n", front -> id, front -> name, front -> dept, front -> area);
			front=NULL;
		}
		else{
			struct node *ptr;
			ptr=front;
			front=front->next;
			front->prev=NULL;
			printf("The data popped are : \n");
			printf("%s\t%s\t%s\t%s\n", ptr -> id, ptr -> name, ptr -> dept, ptr -> area);
			free(ptr);
			}
		}

	void display(){
		if(front == NULL){
			printf("Queue is Empty");
		}
		else{
			struct node *temp;
			temp = front;
			printf("ID\tNAME\tBRANCH\tAREA\n");
			while(temp != NULL){
				printf("%s\t%s\t%s\t%s\n", temp -> id, temp -> name, temp -> dept, temp -> area);
				temp = temp -> next;
			}
		}
	}

	int main(){
		int ch;
		while(1){
			printf("\n1.ENQUEUE\n2.DEQUEUE\n3.DISPLAY\n4.EXIT\n");
			printf("Enter your choice: ");
			scanf("%d",&ch);
			switch(ch){
				case 1: enqueue();
					break;
				case 2: dequeue();
					break;
				case 3: display();
					break;
				case 4: exit(0);
					break;
				default: printf("Invalid choice");
				}
			}
		}
