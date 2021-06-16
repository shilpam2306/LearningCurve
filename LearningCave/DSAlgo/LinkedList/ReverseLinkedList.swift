//
//  ReverseLinkedList.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//


//Print ReverseLinked list - Recursive

func printReverseLinkedList(head: NodeL?) {
    let currentNode = head
    if currentNode == nil {
        return
    }
    
    printReverseLinkedList(head: currentNode?.next)
    print("Reverse : \(currentNode?.value ?? 0)")
}




//Reverse LinkedList
//1->2->3
//nil<-1->2->3
//nil<-1<-2->3

func reverseLinkedList(head: NodeL?) -> NodeL? {
    var currentNode = head
    var next : NodeL?
    var prev : NodeL?
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = prev
        
        print("Prev : \(prev?.value ?? -1), Curr : \(currentNode?.value ?? -1), Next : \(next?.value ?? -1)")
        
        prev = currentNode
        currentNode = next
    }
    
    return prev
}
