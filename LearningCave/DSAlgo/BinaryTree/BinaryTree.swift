//
//  BinaryTree.swift
//  DSAlgo
//
//  Created by Shilpa M on 11/06/21.
//
//
//        10
//      /    \
//     5       14
//    /        / \
//   1        11 20

//Binary tree is where each node has 0,1 or 2 child abd 2 is a mac so it is called binary tree
//right child is greater then the node and left chils is smaller then the node
//o(log n

class NodeB {
    var value : Int
    var leftChild : NodeB?
    var rightChild : NodeB?
    
    init(value : Int , leftChild : NodeB?, rightChild : NodeB?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

let oneNode = NodeB(value: 1, leftChild: nil, rightChild: nil)
let fiveNode = NodeB(value: 5, leftChild: oneNode, rightChild: nil)
let elevenNode = NodeB(value: 11, leftChild: nil, rightChild: nil)
let twentyNode = NodeB(value: 20, leftChild: nil, rightChild: nil)
let fourteenNode = NodeB(value: 14, leftChild: elevenNode, rightChild: twentyNode)
let tenNode = NodeB(value: 10, leftChild: fiveNode, rightChild: fourteenNode)



//search Recursive
func search(node : NodeB?, searchValue : Int) -> Bool {
    if node?.value == nil {
        return false
    }
    if node?.value == searchValue {
        return true
    }
    
    else {
       return  search(node: node?.leftChild, searchValue: searchValue) || search(node: node?.rightChild, searchValue: searchValue)
    }
}





//insert at the end
func insert(node : NodeB? , insertValue : Int) -> NodeB {
    if node?.value == nil {
        node?.value = insertValue
    }
    if insertValue < node!.value {
        if node?.leftChild == nil {
            node?.value = insertValue
        }else {
            insert(node: node?.leftChild, insertValue: insertValue)
        }
    } else {
        if node?.rightChild == nil {
            node?.value = insertValue
        }else {
            insert(node: node?.rightChild, insertValue: insertValue)
        }
    }
    print(node!.value)
    return node!
}

//insert(node: fiveNode, insertValue: 6)





//Reverse
func reverse(node : NodeB?) {
    if node?.value == nil {
       return
    }
    else {
        let temp = node?.rightChild
        node?.rightChild = node?.leftChild
        node?.leftChild = temp
        
        if node?.leftChild != nil {
            reverse(node: node?.leftChild)
        }
        if node?.rightChild != nil {
            reverse(node: node?.rightChild)
        }
    }
    print(node!.value)
}

//reverse(node: tenNode)





//Add nodes
var count = 0
func add(node : NodeB?) -> Int {
    if node?.value == nil {
        return 0
    } else {
        count = count + node!.value
    }
    if node?.leftChild != nil {
        add(node: node?.leftChild)
    }
    if node?.rightChild != nil {
        add(node: node?.rightChild)
    }
    
    return count
}

//add(node: tenNode)




//Find successor of ansister
func findSuccessor(node : NodeB?, succesorOf : Int) -> Int {
    if node?.value == nil {
        return 0
    }
    if node?.value == succesorOf {
        if node?.rightChild != nil {
           return node?.rightChild?.value ?? 0
        } else if node?.leftChild != nil {
           return node?.leftChild?.value ?? 0
        }else {
            return 0
        }
    }
    
    else if (search(node: node?.leftChild, searchValue: succesorOf)) {
        return findSuccessor(node: node?.leftChild, succesorOf: succesorOf)
    }
    else if (search(node: node?.rightChild, searchValue: succesorOf)) {
        return findSuccessor(node: node?.rightChild, succesorOf: succesorOf)
    }
    else {
        return 0
    }
    
}



//find Leaf Node // has child
func findLeaf(node : NodeB?)->Int {
    if node?.value == nil {
        return 0
    }
    else {
        if node?.leftChild?.value == nil && node?.rightChild?.value == nil {
            return (node?.value ?? 0)
        }
        else if node?.leftChild != nil {
            return findLeaf(node: node?.leftChild)
        }
        else  {
            return findLeaf(node: node?.rightChild)
        }
    }
}

//findLeaf(node: fourteenNode)




//Print only left child and right child
var resultArray = [Int]()
func printValue(node : NodeB?) -> [Int] {
    if node?.value == nil {
        resultArray.append(0)
    }else {
        if node?.value != nil {
            resultArray.append(node?.value ?? 0)
        }
        //left
        if node?.leftChild != nil {
            printValue(node: node?.leftChild)
        }
        //right //both
        if node?.rightChild != nil {
            printValue(node: node?.rightChild)
        }
    }
    
    return resultArray
}

//printValue(node: tenNode)





//diffrent order traversal
func depthOrderTraversal(node : NodeB?) {
    guard let node = node else {
        return
    }
    //preorder
    //print(node.value)
    depthOrderTraversal(node: node.leftChild)
    
    // In order
    print(node.value)
    depthOrderTraversal(node: node.rightChild)
    
    //Post order
    //print(node.value)
}

//depthOrderTraversal(node: tenNode)





//Check wether binary tree is a full tree
func isFullTree(node : NodeB?) -> Bool {
    if node == nil {
        return true
    }
    if node?.leftChild == nil && node?.rightChild == nil {
        return true
    }
    if node?.leftChild != nil && node?.rightChild != nil {
        return isFullTree(node: node?.leftChild) && isFullTree(node: node?.rightChild)
    }
    return false
}

//isFullTree(node: fourteenNode)






// Return the sum of values - Time Complexity o(n) n number of nodes , Space complexity 0(h) h is height
// If left node is less then the parent node and right node is greater then parent node then it is BST
func rangeSumBSTC(node : NodeB? , L : Int , R : Int) -> Int {
    var result = 0
    if node != nil {
        if L <= node?.value ?? 0 && node?.value ?? 0 <= R  {
            result = node?.value ?? 0
        }
        if L <= node?.value ?? 0 || R <= node?.value ?? 0 {
            result += rangeSumBSTC(node: node?.leftChild, L: L, R: R)
        }
        if node?.value ?? 0 <= L || node?.value ?? 0 <= R {
            result += rangeSumBSTC(node: node?.rightChild, L: L, R: R)
        }
    }
    
    return result
}

//rangeSumBSTC(node: tenNode, L: 5, R: 20)







// If left node is less then the parent node and in valid range between it's parent and above parent and right node is greater then parent node then it is BST
//• The left subtree of a node contains only nodes with keys less than the node’s key.
//• The right subtree of a node contains only nodes with keys greater than the node’s key.
//• Both the left and right subtrees must also be binary search trees.

func isBST(node : NodeB?)-> Bool {
    if node == nil {
        return true
    }
    
    if node?.value ?? 0 > node?.rightChild?.value ?? 0 || node?.value ?? 0 < node?.leftChild?.value ?? 0 {
        return false
        
    }
    if (!isBST(node: node?.leftChild) || !isBST(node: node?.rightChild)) {
        return false
        
    }
    
    return true
}

//isBST(node: fiveNode)








//Root to leaf path sum equal to a given number - root to leaf addition
var ans = false
var s = 0
func hasPathSum(node : NodeB? , sum : Int) -> Bool {
    if node == nil {
        return sum == 0
    } else {
        s = s + (node?.value ?? 0)
        print(s)
        let subSum  = sum - s
        //If we reach a leaf node and sum becomes 0 then return true
        if subSum == 0 && node?.leftChild == nil && node?.rightChild == nil {
            return true
        }

        if node?.leftChild != nil {
           ans = ans || hasPathSum(node: node?.leftChild, sum: sum)
        }

        if node?.rightChild != nil {
           ans = ans  || hasPathSum(node: node?.rightChild, sum: sum)
        }
        
        return ans
    }
    
}

//hasPathSum(node: tenNode, sum: 61)






//Depth-Fisrt-Search(DFS)
//As illustrated, our goal will be to explore the left side of the model, visit the root node, then visit the right side 1 is start and 20 should be end
//For example, administrators will often deploy software updates to networked computers as a single task

func DST(node : NodeB?, searchElement : Int) -> Bool  {
    guard let node = node else {
        return false
    }
    
    if node.value == searchElement {
        
        return true
    }
    if node.leftChild != nil {
      return DST(node: node.leftChild, searchElement: searchElement)
    }
    print(node.value)
    
    if node.rightChild != nil {
      DST(node: node.rightChild, searchElement: searchElement)
    }
    return false
}

//DST(node: tenNode, searchElement: 5)







//Breadth-First Search (BFS) : This algorithm is designed for open-ended data models and is typically used with graphs
//With BFS, our goal is to visit all neighbors before visiting our neighbor’s, “neighbor”
//As discussed, BFS works by exploring neighboring vertices. Since our data structure is an undirected graph, we need to ensure each node is visited only once. As a result, vertices are processed using a generic queue.
var result = 0
func sumOfLeftLeaves(_ root: NodeB?) -> Int {
    guard let root = root else {
        return result
    }
    if root.leftChild?.value == nil {
       result = result + root.value
    }
    
    if root.leftChild != nil {
        sumOfLeftLeaves(root.leftChild)
    }
    
    if root.rightChild != nil {
        sumOfLeftLeaves(root.rightChild)
        
    }
    
    return result
}

//sumOfLeftLeaves(fourteenNode)







//Given a binary tree, check wether it is mirror of itself
//1. their two roots have same value
//2. The right subtree of each tree is a mirror reflection of the left subtree of the other tree

func isSymetric( _ node : NodeB?) -> Bool {
    //send node and clone of the node to check for mirror
    return isMirror(node,node)
}

func isMirror(_ t1 : NodeB? , _ t2 : NodeB?) -> Bool {
    if t1 == nil && t2 == nil {
        return true
    }
    if t1 == nil || t2 == nil {
        return false
    }
    //Check if node1 value is equal to node2 value recursivley
    return t1?.value == t2?.value && isMirror(t1?.leftChild, t2?.rightChild) && isMirror(t1?.rightChild, t2?.leftChild)
}







//Convert sorted array to binary tree
//Sorted so we will go for binary serach and add to binary tree

func sortedArrayToBst(_ nums : [Int]) -> NodeB? {
    
    return BST(nums, 0 , nums.count-1)
    
}

private func BST(_ nums : [Int], _ left : Int , _ right : Int) -> NodeB? {
    if left > right {
        return nil
    }
    let mid = left + (right-left) / 2
    //add mid value as root
    let root = NodeB(value : nums[mid],leftChild: nil,rightChild: nil)
    
    //left values of binary tree goes down the midvalue
    root.leftChild = BST(nums,left,mid-1)
    
    //right values of binary tree goes up the mid value
    root.rightChild = BST(nums, mid+1, right)
    
    return root
}




//Find Lowest Common Ancestor in a Binary Tree
//1) Find a path from the root to n1 and store it in a vector or array.
//2) Find a path from the root to n2 and store it in another vector or array.
//3) Traverse both paths till the values in arrays are the same. Return the common element just before the mismatch.






//How to determine if a binary tree is height-balanced?
//To check if a tree is height-balanced, get the height of left and right subtrees. Return true if difference between heights is not more than 1 and left and right subtrees are balanced, otherwise return false.
func isBalanced(_ node : NodeB?) -> Int {
    
    var lh = 0
    var rh = 0
    
    if node?.leftChild?.value != nil {
        lh += 1
    }
    if node?.rightChild?.value != nil {
        lh += 1
    }
    
    /* If tree is empty then return true */
    if (node == nil) {
            return 1
    }
     
        /* Get the height of left and right sub trees */
        lh = leftHeight(node)
        rh = rightHeight(node)
     
    if (abs(lh - rh) <= 1 && (isBalanced(node?.leftChild) != 0) && (isBalanced(node?.rightChild) != 0)) {
            return 1
    }
        /* If we reach here then
        tree is not height-balanced */
        return 0
    
    
}

func leftHeight(_ node : NodeB?) -> Int {
    var lh = 0
    if node?.value != nil {
        lh += 1
    }
    
    if node?.leftChild != nil {
        leftHeight(node?.leftChild)
    }
    
    return lh
}
func rightHeight(_ node : NodeB?) -> Int {
    var lh = 0
    if node?.value != nil {
        lh += 1
    }
    
    if node?.rightChild != nil {
        rightHeight(node?.rightChild)
    }
    
    return lh
}


