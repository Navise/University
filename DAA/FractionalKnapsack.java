package DAA;
import java.util.*;

public class FractionalKnapsack{
    static void knapsack(int p[] , int w[] , int c){
        int n = p.length;
        double pwr[] = new double[n];
        Integer indices[] = new Integer[n];

        for(int i=0; i<n; i++)
        {
            pwr[i] = (double)p[i]/w[i];
            indices[i] = i;
        }
        Arrays.sort(indices , (a , b) -> Double.compare(pwr[b], pwr[a]));
        int cw = 0;
        double profit = 0;
        for(int j=0; j<n; j++)
        {
            int i= indices[j];
            if(cw + w[i] <= c){
                profit += p[i];
                cw += w[i];
            }else{
                profit += p[i]*(double)(c - cw)/w[i];
                break; 
            }
        }
        System.out.println(profit);
        
    }

    public static void main(String[] args) {
        int p[] = {18,10 ,54};
        int w[] = {5 ,4 ,3};
        int cap = 10;
        knapsack(p , w , cap);
    }
}