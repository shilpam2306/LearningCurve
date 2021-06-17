//
//  DeleteInsertBinary.swift
//  DSAlgo
//
//  Created by Shilpa M on 17/06/21.
//

//Delete

//We have discussed BST search and insert operations. In this post, the delete operation is discussed. When we delete a node, three possibilities arise.
//1) Node to be deleted is the leaf: Simply remove from the tree.
//
//              50                            50
//           /     \         delete(20)      /   \
//          30      70       --------->    30     70
//         /  \    /  \                     \    /  \
//       20   40  60   80                   40  60   80
//2) Node to be deleted has only one child: Copy the child to the node and delete the child
//
//              50                            50
//           /     \         delete(30)      /   \
//          30      70       --------->    40     70
//            \    /  \                          /  \
//            40  60   80                       60   80
//3) Node to be deleted has two children: Find inorder successor of the node. Copy contents of the inorder successor to the node and delete the inorder successor. Note that inorder predecessor can also be used.
//
//
//              50                            60
//           /     \         delete(50)      /   \
//          40      70       --------->    40    70
//                 /  \                            \
//                60   80                           80
//The important thing to note is, inorder successor is needed only when the right child is not empty. In this particular case, inorder successor can be obtained by finding the minimum value in the right child of the node.

//O(n)

/// Java program to demonstrate
// delete operation in binary
// search tree
class BinarySearchTree {
    /* Class containing left
    and right child of current node
     * and key value*/
    class Node {
        var key : Int
        var left : Node?
        var right : Node?
 
        init (key : Int, left : Node?, right : Node?)
        {
            self.key = key
            self.left = left
            self.right = left
        }
    }
 
    // Root of BST
    //var root = Node?
 
    // Constructor
    //BinarySearchTree() { root = null }
 
    // This method mainly calls deleteRec()
    //var deleteKey = deleteRec(root, key)
 
    /* A recursive function to
      delete an existing key in BST
     */
    func deleteRec(_ root : Node?, _ key : Int) -> Node?
    {
        
        /* Base Case: If the tree is empty */
        if (root == nil) {
            return root
        }
 
        /* Otherwise, recur down the tree */
        if (key < root!.key) {
            root?.left = deleteRec(root?.left, key)
        }
        else if (key > root!.key) {
            root?.right = deleteRec(root?.right, key)
        }
 
        // if key is same as root's
        // key, then This is the
        // node to be deleted
        else {
            // node with only one child or no child
            if (root?.left == nil) {
              return root?.right
            }
            else if (root?.right == nil) {
                return root?.left
            }
 
            // node with two children: Get the inorder
            // successor (smallest in the right subtree)
            root?.key = minValue(root?.right)
 
            // Delete the inorder successor
            root?.right = deleteRec(root?.right, root!.key)
        }
 
        return root;
    }
 
    func minValue(_ root : Node?) -> Int
    {
        var minv = root?.key
        var root = root
        while (root?.left != nil)
        {
            minv = root?.left?.key
            root = root?.left
        }
        return minv ?? 0
    }
 
    // This method mainly calls insertRec()
   // void insert(int key) { root = insertRec(root, key); }
 
    /* A recursive function to
       insert a new key in BST */
    func insertRec(_ root : Node?, _ key : Int) -> Node?
    {
 
        /* If the tree is empty,
          return a new node */
        if (root == nil) {
            //root = new Node(key);
            return root
        }
 
        /* Otherwise, recur down the tree */
        if (key < root!.key) {
            root?.left = insertRec(root?.left, key)
        }
        else if (key > root!.key) {
            root?.right = insertRec(root?.right, key)
        }
 
        /* return the (unchanged) node pointer */
        return root
    }
 
    // This method mainly calls InorderRec()
    //void inorder() { inorderRec(root); }
 
    // A utility function to do inorder traversal of BST
    func inorderRec(_ root : Node?)
    {
        if (root != nil) {
            inorderRec(root?.left)
            //print("\(root?.key) + " " ")
            inorderRec(root?.right)
        }
    }
}





//Optimization to above code for two children case :
//In the above recursive code, we recursively call delete() for the successor. We can avoid recursive calls by keeping track of the parent node of the successor so that we can simply remove the successor by making the child of a parent NULL. We know that the successor would always be a leaf node.
