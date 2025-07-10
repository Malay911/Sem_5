// import java.util.*;

// class Node{
//     int data;
//     Node left,right;

//     Node(int item){
//         this.data=item;
//         this.right=null;
//         this.left=null;
//     }
// }

// public class Problem_1 {
//     public static int maxDepth(Node root){
//         if(root==null){
//             return 0;
//         }
//         int leftDepth=maxDepth(root.left);
//         int rightDepth=maxDepth(root.right);
//         return Math.max(leftDepth,rightDepth)+1;
//     }
//     public static void main(String[] args) {
//         Scanner sc=new Scanner(System.in);
//         Node root=new Node(3);
//         root.left = new Node(9);
//         root.right = new Node(20);
//         root.right.left = new Node(15);
//         root.right.right = new Node(7);
//         System.out.println("Maximum depth of the binary tree: " + maxDepth(root));
//     }
// }


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

public class Problem_1 {
    public static int maxDepth(Node root) {
        if (root == null)
            return 0;
        int leftDepth = maxDepth(root.left);
        int rightDepth = maxDepth(root.right);
        return Math.max(leftDepth, rightDepth) + 1;
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
        int depth = maxDepth(root);
        System.out.println("Maximum depth of the binary tree: " + depth);
    }
}
