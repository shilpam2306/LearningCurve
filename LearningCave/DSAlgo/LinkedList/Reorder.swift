//
//  Reorder.swift
//  DSAlgo
//
//  Created by Shilpa M on 15/06/21.
//

//1->2->3->4->nil

//Reord to
//1->4->2->3->nil

//get to middle of the list and saperate it
// 1-> 2
// 3->4
// reverse the second list
//4->3
// merge 1st and 2nd list

func reorderList(_ node : NodeL) {
   
    if node == nil || node.next == nil {
        return
    }
    
    //head of first half
    var l1 : NodeL = node
    //head of second half
    var slow : NodeL = node
    //tail of second half
    var fast : NodeL = node
    //tail of first half
    var prev : NodeL? = nil
    
    while fast.next != nil && fast != nil {
       prev = slow
       slow = slow.next!
       fast = (fast.next?.next)!
    }
    
    prev!.next = nil
    
    //var l2 = reverseLinkedList(head: slow)
    
    //merge(l1,l2)
    
}
