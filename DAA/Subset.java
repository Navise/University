package DAA;

class Subset {
    static void printSubsetsWithSum(int set[], int targetSum) {
        int n = set.length;

        for (int i = 0; i < (1 << n); i++) {
            int currentSum = 0;
            for (int j = 0; j < n; j++) {
                if ((i & (1 << j)) > 0) {
                    currentSum += set[j];
                }
            }
            if (currentSum == targetSum) {
                for (int j = 0; j < n; j++) {
                    if ((i & (1 << j)) > 0) {
                        System.out.print(set[j] + " ");
                    }
                }
                System.out.println();
            }
        }
    }

    // Driver code
    public static void main(String[] args) {
        int set[] = {1, 2, 5, 6, 8};
        int targetSum = 6;
        printSubsetsWithSum(set, targetSum);
    }
}
