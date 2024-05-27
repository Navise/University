#include<stdio.h>
#include<stdlib.h>

	struct Tree{
	    struct Tree *lchild;
	    int data;
	    struct Tree *rchild;
	}*root = NULL;

	struct Tree *insert(int val){
	    struct Tree *new_node, *temp, *prev;
	    new_node = (struct Tree*)malloc(sizeof(struct Tree));
	    new_node -> data = val;
	    new_node -> lchild =  NULL;
	    new_node -> rchild = NULL;

	    if(root == NULL){
	        root = new_node;
	        return root;
	    }
	    else{
	        temp = root;
	        while(temp!=NULL){
	            if(val < temp -> data){
	                prev = temp;
	                temp = temp -> lchild;
	            }
	            else{
	                prev = temp;
	                temp = temp -> rchild;
	            }
	        }

	        if(val < prev -> data){
	            prev -> lchild = new_node;
	        }
	
	        else{
	            prev ->rchild = new_node;
	        }
	    }
	    return root;
	}
	
	void inorder(struct Tree *temp){
	    if(temp!= NULL){
	        inorder(temp -> lchild);
	        printf("%d\t", temp -> data);
	        inorder(temp -> rchild);
	    }
	}
	
	void preorder(struct Tree *temp){
	    if(temp!= NULL){
	        printf("%d\t", temp -> data);
	        preorder(temp -> lchild);
	        preorder(temp -> rchild);
	    }
	}
	
	void postorder(struct Tree *temp){
	    if(temp!= NULL){
	        postorder(temp -> lchild);
	        postorder(temp -> rchild);
	        printf("%d\t", temp -> data);
	    }
	}

	void search(struct Tree *temp, int key){
	    if(temp == NULL){
	        printf("Element Not Found\n");
	    }
	    else if(key < temp -> data){
	        search(temp -> lchild, key);
	    }
	    else if(key > temp -> data){
	        search(temp -> rchild, key);
	    }
	    else{
	        printf("Element Found");
	    }
	}

	int main(){
	    int choice, val, key;
	    while(1){
	        printf("\n1.INSERT\n2.INORDER\n3.PREORDER\n4.POSTORDER\n5.SEARCH\n6.EXIT\n");
	        printf("Enter your choice : ");
	        scanf("%d", &choice);
	        switch(choice){
	            case 1: printf("Enter the value to Insert: ");
	                    scanf("%d", &val);
	                    root = insert(val);
	                    break;
	            case 2: inorder(root);
	                    break;
	            case 3: preorder(root);
	                    break;
	            case 4: postorder(root);
	                    break;
	            case 5: printf("Enter the value to search: \n");
	                    scanf("%d", &key);
	                    search(root, key);
	                    break;
	            case 6: exit(0);
	            default: printf("\nInvalid Choice\n\n");
	                     break;
	        }
	    }    
	    return 0;
	}
