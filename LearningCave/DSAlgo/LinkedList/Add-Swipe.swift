//
//  Add-Swipe.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//

// Adding 2 linked list

func AddLinkedList(head1 : NodeL?, head2 : NodeL?) {
    if head1 == nil || head2 == nil {
        return
    }
    
    let d = (head1?.value ?? 0) + (head2?.value ?? 0)
    
    while head1?.next != nil && head2?.next != nil {
        AddLinkedList(head1: head1?.next, head2: head2?.next)
    }
}




//sort the linked list
class Solution {
    func sortList(_ head : NodeL?) -> NodeL? {
        if head == nil || head?.next == nil {
            return head
        }
        
        
    }
}


