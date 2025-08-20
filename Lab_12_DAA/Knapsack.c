#include <stdio.h>

void swapDouble(double *a, double *b) {
    double temp = *a;
    *a = *b;
    *b = temp;
}

void swapInt(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

double fractionalKnapsack(int value[], int weight[], int n, int capacity) {
    double ratio[n];
    
    for (int i = 0; i < n; i++) {
        ratio[i] = (double)value[i] / weight[i];
    }

    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (ratio[j] < ratio[j + 1]) {
                swapDouble(&ratio[j], &ratio[j + 1]);
                swapInt(&value[j], &value[j + 1]);
                swapInt(&weight[j], &weight[j + 1]);
            }
        }
    }

    double totalValue = 0.0;
    int curWeight = 0;

    for (int i = 0; i < n; i++) {
        if (curWeight + weight[i] <= capacity) {
            curWeight += weight[i];
            totalValue += value[i];
        } else {
            int remain = capacity - curWeight;
            totalValue += value[i] * ((double)remain / weight[i]);
            break;
        }
    }

    return totalValue;
}

int main() {
    int n, capacity;

    printf("Enter number of items: ");
    scanf("%d", &n);

    int value[n], weight[n];

    printf("Enter value and weight of each item:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d %d", &value[i], &weight[i]);
    }

    printf("Enter capacity of knapsack: ");
    scanf("%d", &capacity);

    double maxValue = fractionalKnapsack(value, weight, n, capacity);

    printf("Maximum value in Knapsack = %.2f\n", maxValue);

    return 0;
}
