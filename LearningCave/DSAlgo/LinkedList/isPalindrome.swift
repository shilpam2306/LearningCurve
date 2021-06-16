//
//  isPlaindrome.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//




//Given a singly linked list, determine if it is a palindrome.
// check if all reverse node and straight nodes match each other
func isPalindrome(_ head: NodeL?) -> Bool {
    var currentNode = head
    var reverseNode = reverseLinkedList(head: head)
    
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        print(reverseNode?.value ?? -1)
        if currentNode?.value == reverseNode?.value {
            return true
        }
        currentNode = currentNode?.next
        reverseNode = reverseNode?.next
        
    }
    return false
}



//isPalindrome(oneNode)

