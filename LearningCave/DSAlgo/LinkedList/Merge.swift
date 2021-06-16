//
//  Merge.swift
//  DSAlgo
//
//  Created by Shilpa M on 15/06/21.
//

func MergeList(head1 : NodeL?, head2 : NodeL?) -> NodeL{
    
    while (head1 != nil ) {
        var l1 = head1?.next
        var l2 = head2?.next
        l1?.next = l2
        
        if l1?.next == nil {
            break
        }
        
        l2?.next = l1?.next
        l1 = l1?.next
        l2 = l2?.next
        
    }    
    
}
