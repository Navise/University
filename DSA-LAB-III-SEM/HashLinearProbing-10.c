#include <stdio.h>
#include <stdlib.h>
	int ht[10]={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
	int n =10;

	void insert(int key){
	    int i;
	    int hash = key % 10;
	    if(ht[hash] == -1)
	        ht[hash] = key;
	    else{
	             int j = 1;
	            //j= hash;
	           while(j<n){
	                hash = (hash + j)%10;
	                if(ht[hash]== -1){
	                    ht[hash]=key;
	                    j++;
	                    break;
	                }
	            }
	        printf("\nThe elements in the hash table are::\n");
	        for(i=0;i<n;i++)
	            printf("%d\t",ht[i]);
	        printf("\n");
	    }
	}

	void display(){
	    int i;
	    for(i=0;i<n;i++)
	        printf("%d\t",ht[i]);
	}

	int main(){
	    int ch=1,key;
	    while(ch>0)
	    {
	        printf("\n\nChoose your option \n1. Insert\n2. Display\n3. Exit\n");
	        scanf("%d",&ch);
	        switch(ch){
	            case 1: printf("Enter the element to be inserted::\n");
	                    scanf("%d",&key);
	                    insert(key);
	                    break;
	            case 2: printf("\nThe elements are :: \n");
	                    display();
	                    break;
	            case 3: exit(0);
	            default: printf("Invalid option");
	        }
	    }
	}
