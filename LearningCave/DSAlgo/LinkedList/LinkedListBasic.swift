//
//  LinkedList.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//

//Linked list 1->2->3->nil - reverse

class NodeL {
    var value : Int
    var next : NodeL?
    
    init(value : Int , next : NodeL?) {
        self.value = value
        self.next = next
    }
}

let threeNode = NodeL(value: 3, next: nil)
let twoNode = NodeL(value: 2, next: threeNode)
let oneNode = NodeL(value: 1, next: twoNode)

func printLinkedList(head : NodeL?) {
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        currentNode = currentNode?.next
        
    }
}

//printLinkedList(head: oneNode)




// insert whenever found node nil
func insert(head : NodeL? , toInsert : Int) {
    var currentNode = head
    if currentNode == nil {
        head?.value = toInsert
    }
    
    //loop through to find the next empty node to insert
    while currentNode?.next != nil {
        currentNode = currentNode?.next
    }
    
    //Insert in the next emptynode
    currentNode?.next = NodeL(value: toInsert, next: nil)
}





//Insert at position

func insertAtPosition(head : NodeL? , toInsert : Int, position : Int) {
    var currentNode = head
    
    // make ready the newNode to insert
    let newNode = NodeL(value: toInsert, next: nil)
    
    // currentNode is nil just insert there
    if currentNode == nil {
        head?.value = toInsert
    }
    
    //if the position 0 , simply take the new node's next node ad set it as out current node
    if position == 0 {
        //make newNode  0 and current not to next node
        newNode.next = currentNode
        currentNode = newNode
    } else { //take currentNode and set it's previous to our newNode
        var prev = currentNode
        for _ in 0..<position {
            //prev to current node and and current node to next node
            prev = currentNode
            currentNode = currentNode?.next
        }
        
        //make current node our new node
        newNode.next = prev?.next
        prev?.next = newNode
    }
    
}




//Linked list 1->2->3->nil - reverse
// To delete we need to move the point of the prev node to next node as we are deleting the current node
func delete(head : NodeL? , position : Int) {
    if head == nil {
        return
    }
    var currentNode = head
    
    if position == 0 {
        // current node becomes the next node and current node will be removed
        currentNode = currentNode?.next
        return
    }
    
    // make current node to the position
    for _ in 0..<position-1 where currentNode != nil {
        currentNode = currentNode?.next
    }
    
    //move the current node to next node so the current node will be deleted
    let nextToNextNode = currentNode?.next?.next
    currentNode?.next = nextToNextNode
    
}







//Find Index
func nodeAt(head : NodeL? , index : Int) -> Node? {
    
    if index > = 0 {
        var currentNode = head
        var i = index
        
        while currentNode != nil {
            if i == 0 {
                return currentNode
            }
            
            i -= 1
            currentNode = currentNode.next
        }
        
        return nil
}




    
    

func adjacentSwapLinkedList(head: NodeL?) -> NodeL? {
    var currentNode = head
    var next : NodeL?
    var prev : NodeL?
    while currentNode != nil {
       next = currentNode?.next
       currentNode?.next = currentNode
       
       currentNode = next
       print(currentNode?.value ?? -1)
       currentNode?.next = currentNode?.next?.next
    }
    
    return currentNode
}

//adjacentSwapLinkedList(head: oneNode)








//Linked list insert/delete

class LinkedList {
    var head : NodeL?
    
    func insert(value : Int) {
        //empty list
        if head == nil {
          head = NodeL(value: value, next: nil)
            //print(head?.value ?? "")
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            print(currentNode?.value ?? "")
            currentNode = currentNode?.next
        }
        
        currentNode?.next = NodeL(value: value, next: nil)
    }
    
    func delete(value : Int)
    {
        if head?.value == value {
            head = head?.next
        }
        
        var prev : NodeL?
        var currentNode = head
        
        while currentNode != nil && currentNode?.value != value {
            prev = currentNode
            currentNode = currentNode?.next
        }
        
        prev?.next = currentNode?.next
    }
    
    func display() {
       var currentNode  = head
        while currentNode != nil {
            print("xxxxxxxxxxx\(currentNode?.value ?? -1)")
            currentNode = currentNode?.next
        }
    }
    
    //Find the index
    func nodeAt(index: Int) -> NodeL? {
      // 1
      if index >= 0 {
        var currentNode = head
        var i = index
        // 2
        while currentNode != nil {
          if i == 0 { return currentNode }
          i -= 1
          currentNode = currentNode!.next
        }
      }
      // 3
      return nil
    }
    
    
}

//var list = LinkedList()
//list.insert(value: 1)
//list.insert(value: 2)
//list.insert(value: 3)
//list.display()
//
//let a = list.nodeAt(index: 0)
//print(a?.value as Any)
//list.delete(value: a?.value ?? 0)
//list.display()


