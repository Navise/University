#include<stdio.h>
#include<stdlib.h>

	struct Node{
	    struct Node *lchild;
	    int data;
	    struct Node *rchild;
	};

	struct Node *new_node(int data){
	    struct Node *node = (struct Node*)malloc(sizeof(struct Node));
		
	    node -> data = data;
	    node -> lchild = NULL;
	    node -> rchild = NULL;
		
	    return (node);
	}

	struct Node *insertLevelOrder(int arr[], int i, int n){
	    struct Node *root = NULL;
	    if(i<n){
	        root = new_node(arr[i]);
	        root -> lchild = insertLevelOrder(arr, (2*i+1), n);
	        root -> rchild = insertLevelOrder(arr, (2*i+2), n);
	    }
	    return root;
	}

	void inorder(struct Node *temp){
	    if(temp!= NULL){
	        inorder(temp -> lchild);
	        printf("%d\t", temp -> data);
	        inorder(temp -> rchild);
	    }
	}

	void preorder(struct Node *temp){
	    if(temp!= NULL){
	        printf("%d\t", temp -> data);
	        preorder(temp -> lchild);
	        preorder(temp -> rchild);
	    }
	}

	void postorder(struct Node *temp){
	    if(temp!= NULL){
	        postorder(temp -> lchild);
	        postorder(temp -> rchild);
	        printf("%d\t", temp -> data);
	    }
	}
	
	int main(){
	    int arr[] = {1, 2, 3, 4, 5, 6};
	    int n = sizeof(arr)/sizeof(arr[0]);
	    struct Node *root = insertLevelOrder(arr, 0, n);
	    printf("\nINORDER TRAVERSAL :: \n");
	    inorder(root);
	    printf("\nPREORDER TRAVERSAL :: \n");
	    preorder(root);
	    printf("\nPOSTORDER TRAVERSAL :: \n");
	    postorder(root);  
	}
