package DAA;

import java.util.*;

public class Dijkstras {

    public static int[] dijkstra(int[][] graph, int source) {
        int n = graph.length;
        int[] distances = new int[n];
        Arrays.fill(distances, Integer.MAX_VALUE);
        distances[source] = 0;
        PriorityQueue<Integer> pq = new PriorityQueue<>(Comparator.comparingInt(i -> distances[i]));
        pq.add(source);

        while (!pq.isEmpty()) {
            int u = pq.poll();
            for (int v = 0; v < n; v++) {
                if (graph[u][v] != 0 && distances[u] != Integer.MAX_VALUE && distances[u] + graph[u][v] < distances[v]) {
                    distances[v] = distances[u] + graph[u][v];
                    pq.add(v);
                }
            }
        }
        return distances;
    }

    public static void main(String[] args) {
        int[][] graph = {
            {0, 2, 4, 0, 0},
            {2, 0, 1, 7, 0},
            {4, 1, 0, 0, 3},
            {0, 7, 0, 0, 1},
            {0, 0, 3, 1, 0}
        };
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the source vertex: ");
        int source = s.nextInt();
        int[] distances = dijkstra(graph, source);
        s.close();
        System.out.println("Shortest distances from source " + source + " to all other vertices:");
        for (int i = 0; i < distances.length; i++) {
            System.out.println("Source Vertex "+source+" to Destination Vertex " + i + ": " + distances[i]);
        }
    }
}
