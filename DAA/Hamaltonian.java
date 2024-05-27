package DAA;

import java.util.Scanner;

public class Hamaltonian {
    static int n;

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Enter no. of vertices");
        int n = in.nextInt();
        int graph[][] = new int[10][10];
        System.out.println("Enter adjacency matrix ofgraph");
        for (int i = 1; i < n; i++)
            for (int j = 0; j < n; j++)
                graph[i][j] = in.nextInt();
        System.out.println("Entered adjacency matrix of graph is");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("\t" + graph[i][j]);
            }
            System.out.println();
        }
        hamCycle(graph);
        System.out.println("\n*********************************\n");
    }

    static void printSolution(int path[]) {
        System.out.println("Solution Exists:");
        System.out.println(" Following is one Hamiltonian Cycle ");
        for (int i = 0; i < n; i++)
            System.out.println(path[i]);
        System.out.println(path[0]);
    }

    static boolean isSafe(int v, int graph[][], int path[], int pos) {
        if (graph[path[pos - 1]][v] == 0)
            return false;
        for (int i = 0; i < pos; i++)
            if (path[i] == v)
                return false;
        return true;
    }

    static boolean hamCycleUtil(int graph[][], int path[], int pos) {
        if (pos == n) {
            if (graph[path[pos - 1]][path[0]] == 1)
                return true;
            else
                return false;
        }
        for (int v = 1; v < n; v++) {
            if (isSafe(v, graph, path, pos)) {
                path[pos] = v;
                if (hamCycleUtil(graph, path, pos + 1) == true)
                    return true;
                path[pos] = -1;
            }
        }
        return false;
    }

    static boolean hamCycle(int graph[][]) {
        int path[] = new int[n + 1];
        for (int i = 0; i < n; i++)
            path[i] = -1;
        path[0] = 0;
        if (hamCycleUtil(graph, path, 1) == false) {
            System.out.println("\nSolution does not exist");
            return false;
        }
        printSolution(path);
        return true;
    }
}