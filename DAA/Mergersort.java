package DAA;

public class Mergersort {
    static void merge(int a[] , int l , int mid , int h)
    {
        int n1 = mid - l + 1;
        int n2 = h - mid;
        int L[] = new int[n1];
        int R[] = new int[n2];
        for(int i=0; i<n1; i++)
        {
            L[i] = a[l + i];
        }
        for(int i=0; i<n2; i++)
        {
            R[i] = a[mid + 1 + i];
        }

        int i=0 , j = 0,  k = l;
        while(i < n1 && j < n2)
        {
            if(L[i] < R[j])
            {
                a[k] = L[i];
                i++;
            }else{
                a[k] = R[j];
                j++;
            }
            k++;
        }
        while(i < n1)
        {
            a[k] = L[i];
            i++;
            k++;
        }
        while(j < n2)
        {
            a[k] = R[j];
            j++;
            k++;
        }

    }
    static void mergesort(int a[] , int l , int h)
    {
        if(l < h)
        {
            int mid = (l + h)/2;
            mergesort(a, l, mid);
            mergesort(a, mid + 1, h);
            merge(a , l , mid , h);
        }
    }
    public static void main(String[] args) {
        
        int arr[] = new int[]{5,4,3,2,1,1,0,10};
        mergesort(arr, 0, arr.length - 1);
        for(int i: arr)
        {
            System.out.print(i + " ");
        }
    }
}
