#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define V 5

int findMinkey(int visited[], int distance[]) {
    int min = INT_MAX;
    int key = -1;
    for (int i = 0; i < V; i++) {
        if (!visited[i] && distance[i] < min) {
            min = distance[i];
            key = i;
        }
    }
    return key;
}

void dijkstra(int graph[V][V], int source) {
    int distance[V], visited[V];

    for (int i = 0; i < V; i++) {
        distance[i] = INT_MAX;
        visited[i] = 0;
    }

    distance[source] = 0;

    for (int i = 0; i < V - 1; i++) {
        int u = findMinkey(visited, distance);
        visited[u] = 1;

        for (int v = 0; v < V; v++) {
            if (!visited[v] && graph[u][v] != 0 &&
                distance[u] != INT_MAX &&
                distance[u] + graph[u][v] < distance[v]) {
                distance[v] = distance[u] + graph[u][v];
            }
        }
    }

    printf("Vertex\tDistance from Source\n");
    for (int i = 0; i < V; i++) {
        if (distance[i] == INT_MAX)
            printf("%d\tINF\n", i);
        else
            printf("%d\t%d\n", i, distance[i]);
    }
}

int main() {
    int graph[V][V] = {
        {0, 9, 75, 0, 0},
        {0, 0, 95, 0, 42},
        {0, 0, 0, 51, 0},
        {0, 19, 0, 0, 0},
        {0, 0, 0, 31, 0}
    };

    printf("Graph (Adjacency Matrix):\n");
    for (int i = 0; i < V; i++) {
        for (int j = 0; j < V; j++) {
            if (graph[i][j] == 0)
                printf("INF\t");
            else
                printf("%d\t", graph[i][j]);
        }
        printf("\n");
    }

    printf("\nShortest distances from source vertex 0:\n");
    dijkstra(graph, 0);

    return 0;
}
