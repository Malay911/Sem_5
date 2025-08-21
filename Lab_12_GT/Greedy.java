import java.util.*;

public class Greedy {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter number of virtual machines:");
        int n = sc.nextInt();

        System.out.println("Enter number of tasks:");
        int m = sc.nextInt();

        int[][] costMat = new int[n][m];
        int[][] vmCap = new int[n][2];
        int[][] taskReq = new int[m][2];

        System.out.println("Enter the cost matrix:");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                costMat[i][j] = sc.nextInt();
            }
        }

        System.out.println("\nEnter VM capabilities (CPU and Memory):");
        for (int i = 0; i < n; i++) {
            vmCap[i][0] = sc.nextInt();
            vmCap[i][1] = sc.nextInt();
        }

        System.out.println("\nEnter Task requirements (CPU and Memory):");
        for (int i = 0; i < m; i++) {
            taskReq[i][0] = sc.nextInt();
            taskReq[i][1] = sc.nextInt();
        }

        int totalCost = 0, throughput = 0;
        System.out.println("\nTask-to-VM Assignment:");

        for (int task = 0; task < m; task++) {
            int bestVM = -1, bestCost = Integer.MAX_VALUE;

            for (int vm = 0; vm < n; vm++) {
                if (vmCap[vm][0] >= taskReq[task][0] && vmCap[vm][1] >= taskReq[task][1]) {
                    if (costMat[vm][task] < bestCost) {
                        bestCost = costMat[vm][task];
                        bestVM = vm;
                    }
                }
            }

            if (bestVM != -1) {
                vmCap[bestVM][0] -= taskReq[task][0];
                vmCap[bestVM][1] -= taskReq[task][1];
                totalCost += bestCost;
                throughput++;
                System.out.println("Task " + (task + 1) + " -> VM " + (bestVM + 1) + " (Cost = " + bestCost + ")");
            } else {
                System.out.println("Task " + (task + 1) + " -> Not Assigned");
            }
        }

        // System.out.println("\nSummary:");
        // System.out.println("Total Cost = " + totalCost);
        // System.out.println("Tasks Assigned = " + throughput);
        sc.close();
    }
}
