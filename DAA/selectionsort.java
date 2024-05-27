package DAA;

public class selectionsort {
    public static void sort(int a[])
    {
        int n = a.length;
        for(int i=0; i<n-1; i++)
        {
            int min = i;
            for(int j =i+1; j<n; j++)
            {
                if(a[j] < a[min]){
                    min = j;
                }
            }
            int temp = a[min];
            a[min] = a[i];
            a[i] = temp;
        }
    }
    public static void main(String[] args)
    {
        int arr[] = new int[]{2,5,4,3,1,0};
        sort(arr);
        for(int i:arr)
        {
            System.out.print(i +" ");
        }
    }
}
