package DAA;

public class QuickSort {
    static int partition(int a[] , int low , int high)
    {
        int pivot = a[high];
        int i=low -1;
        for(int j=low; j<high; j++)
        {
            if(a[j] < pivot)
            {
                i++;
                int temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }
        i++;
        int temp = a[i];
        a[i] = pivot;
        a[high ] = temp;
        return i;
    }
    static void sort(int a[] , int low , int high)
    {
        if(low < high)
        {
            int p = partition(a , low , high);
            sort(a , low , p - 1);
            sort(a , p + 1 , high);
        }
    }
    public static void main(String[] args) {
        int arr[] = new int[]{0 ,5,4,3,2,1,-1};
        sort(arr , 0 , arr.length - 1);
        for(int i : arr)
        {
            System.out.print(i + " ");
        }

    }
}
