import java.util.*;

class Node{
    int data;
    Node left,right;

    Node(int item){
        this.data=item;
        this.right=null;
        this.left=null;
    }
}

class Solution {
    public boolean isSymmetric(Node root){
        if (root==null){
            return true;
        }
        
        Queue<Node> queue = new LinkedList<>();
        queue.add(root.left);
        queue.add(root.right);  
        while (!queue.isEmpty()) {
            Node left = queue.poll();
            Node right = queue.poll();
            
            if (left==null && right==null){
                continue;
            }
            if (left==null || right==null){
                return false;
            }
            if (left.data!=right.data){
                return false;
            }
            
            queue.add(left.left);
            queue.add(right.right);
            queue.add(left.right);
            queue.add(right.left);
        }
        return true;
    }
}

//Using Recursion
// class Solution{
//     public boolean isSymmetric(Node root){
//         if(root == null) return true;
//         return isMirror(root.left,root.right);
//     }

//     boolean isMirror(Node left, Node right){
//         if (left==null && right==null) return true;
//         if (left==null || right==null) return false;
//         return (left.data == right.data) && isMirror(left.left, right.right) && isMirror(left.right, right.left);
//     }
// }

public class Problem_1 {
    public static void main(String[] args){
        Node root = new Node(1);
        root.left = new Node(2);
        root.right = new Node(2);
        root.left.left = new Node(3);
        root.left.right = new Node(4);
        root.right.left = new Node(4);
        root.right.right = new Node(3);
        Solution solution = new Solution();
        boolean result = solution.isSymmetric(root);
        System.out.println("Is the tree symmetric? " + result);
    }
}
