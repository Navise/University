package DAA;
import java.util.*;

class Edge implements Comparable<Edge> {
    int src, dst, weight;
    public int compareTo(Edge compareEdge) {
        return this.weight - compareEdge.weight;
    }
}

public class Krushkal{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("No of vertices: ");
        int v = sc.nextInt();
        System.out.print("No of edges: ");
        int e = sc.nextInt();

        Edge[] inp = new Edge[e];

        for (int i = 0; i < e; i++) {
            inp[i] = new Edge();
            System.out.printf("\n[%d] Source: ", i + 1);
            inp[i].src = sc.nextInt();
            System.out.print("    Destination: ");
            inp[i].dst = sc.nextInt();
            System.out.print("    Weight: ");
            inp[i].weight = sc.nextInt();
        }
        sc.close();
        krushkals(inp, v);
    }

    public static void krushkals(Edge[] inp, int v) {
        Arrays.sort(inp);
        Edge[] op = new Edge[v - 1];
        int k = 0;
        int[] parent = new int[v];
        for (int i = 0; i < v; i++)
            parent[i] = i;

        for (int i = 0; i < inp.length; i++) {
            if (k == v - 1)
                break;

            Edge currEdge = inp[i];
            int src_parent = find(currEdge.src, parent);
            int dst_parent = find(currEdge.dst, parent);

            if (src_parent != dst_parent) {
                op[k] = currEdge;
                k++;
                parent[src_parent] = dst_parent;
            }
        }

        for (int i = 0; i < op.length; i++)
            System.out.println(op[i].src + " ->" + op[i].dst + " ->" + op[i].weight);

    }

    public static int find(int v, int[] parent) {
        if (parent[v] == v)
            return v;
        return find(parent[v], parent);
    }
}

