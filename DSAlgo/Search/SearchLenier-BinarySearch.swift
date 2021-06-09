//
//  Search.swift
//  DSAlgo
//
//  Created by Shilpa M on 09/06/21.
//

import Foundation


//Lenier Search
//space complexity o(1), Time o(n)
func leniarSearch(_ array : [Int], searchValue : Int) -> Bool {
    for i in array {
        if i == searchValue {
            return true
        }
    }
    
    return false
}





//Binary search - Devide in middle and search
//space Complexity o(1) Time - o(log n)
func binarySearch(_ array : [Int], searchValue : Int) -> Bool {
   //sorted array is important here
    let array = array.sorted()
    var leftIndex = 0
    var rightIndex = array.count-1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex)/2
        let middleValue = array[middleIndex]
        
        if middleValue == searchValue {
            return true
        }
        if middleValue < searchValue {
            rightIndex = middleIndex - 1
        }
        if middleValue > searchValue {
            leftIndex = middleIndex + 1
        }
    }
    
    return false
}
