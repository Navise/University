  #include<stdio.h>

	int adj[][10] = {{0, 1, 0, 1, 0}, {1, 0, 1, 0, 0}, {0, 1, 0, 0, 1}, {1, 0, 0, 0, 1}, {0, 0, 1, 1, 0}};
	int visited[10];
	
	void bfs(){
	    visited[10] = 0;
	    int start = 0 , f = -1 , r = -1 , q[10] ;
	    q[++r] = start;
	    visited[start] = 1;

	    while(r!=f){
	        start = q[++f];
	        printf("%d -> ", start);
	        for(int i = 0; i< 10; i++){
	            if(adj[start][i] == 1 && visited[i] == 0){
	                q[++r] =  i;
	                visited[i] = 1;
	            }
	        }
	    }
	}

	void dfs(int start, int n) {
    visited[start] = 1;
    printf("%d -> ", start);

    for (int i = 0; i < n; i++) {
        if (adj[start][i] == 1 && visited[i] == 0) {
            dfs(i, n);
        }
    }
}

	int main(){
	    printf("\nBFS :: \n");
	    bfs(0);
		for(int i = 0; i<10 ; i++)
		{
			visited[i] = 0;
		}
	    printf("\nDFS :: \n");
	    dfs(0 , 5);
	    return 0;
	}
