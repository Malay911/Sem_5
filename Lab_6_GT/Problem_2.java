// Identify all pendent (leaf) vertices in a given tree.

import java.util.*;

class Node {
    int data;
    Node left, right;

    Node(int item) {
        this.data = item;
        this.left = null;
        this.right = null;
    }
}

public class Problem_2 {
    public static void findLeafNodes(Node root){
        if(root==null){
            return;
        }
        if(root.left == null && root.right == null){
            System.out.print(root.data + " ");
        }
        findLeafNodes(root.left);
        findLeafNodes(root.right);
    }

    public static Node buildTree(Integer[] arr) {
        if (arr.length == 0 || arr[0] == null)
            return null;

        Node root = new Node(arr[0]);
        Queue<Node> queue = new LinkedList<>();
        queue.add(root);
        int i = 1;
        while (!queue.isEmpty() && i < arr.length) {
            Node current = queue.poll();

            if (i < arr.length && arr[i] != null) {
                current.left = new Node(arr[i]);
                queue.add(current.left);
            }
            i++;

            if (i < arr.length && arr[i] != null) {
                current.right = new Node(arr[i]);
                queue.add(current.right);
            }
            i++;
        }
        return root;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number of nodes: ");
        int n = sc.nextInt();
        Integer[] arr = new Integer[n];

        System.out.println("Enter node values(use -1 for null):");
        for (int i = 0; i < n; i++) {
            int val = sc.nextInt();
            arr[i] = (val == -1) ? null : val;
        }

        Node root = buildTree(arr);
        System.out.println("Leaf nodes in the tree:");
        findLeafNodes(root);
    }
}
