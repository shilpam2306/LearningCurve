//
//  SearchRotated.swift
//  DSAlgo
//
//  Created by Shilpa M on 09/06/21.
//

import Foundation


//Serach index f an element in a sorted and rotated array
//space Complexity o(1) Time - o(log n)


// The intresting property of a sorted + rotated array is that when you devide it into two halves. atleast one of the two halves will always be sorted

//[5,4,1,2,3] - ascending
//[5,4,3,2,1] - decending

func binarySearch(_ array : [Int], searchValue : Int) -> Int {
   
    //First check if the array is sorted in ascending order or descending order
    var leftIndex = 0
    var rightIndex = array.count-1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex)/2
        let middleValue = array[middleIndex]
        
        if middleValue == searchValue {
            return middleIndex
        }
        
        //If Ascending Order
        //If right is sorted and mid is not
        if middleValue <=  array[rightIndex] {
            if middleValue < searchValue && searchValue <= array[rightIndex] {
                leftIndex = middleIndex + 1
            } else {
                rightIndex = middleIndex - 1
            }
        //if left is sorted and mid is not
        } else {
            if middleValue > searchValue && searchValue > array[leftIndex] {
                rightIndex = middleIndex - 1 // go seraching right
            } else {
                leftIndex = middleIndex + 1 // go seraching in left sorted half
            }
        }
        
        /*//If Decending Order
        //If right is sorted and mid is not
        if middleValue >=  array[rightIndex] {
            if middleValue > searchValue && searchValue >= array[rightIndex] {
                leftIndex = middleIndex + 1
            } else {
                rightIndex = middleIndex - 1
            }
        //if left is sorted and mid is not
        } else {
            if middleValue < searchValue && searchValue < array[leftIndex] {
                rightIndex = middleIndex - 1 // go seraching right
            } else {
                leftIndex = middleIndex + 1 // go seraching in left sorted half
            }
        }*/
    }
    return -1// element not found
}





//Find if the array is sorted decending or ascending

func checkOrder( _ array : [Int]) -> String {
    let n = array.count-1
    
    //check if first 2 and last 2 elements are in increaasing order
    if array[0] <= array[1] && array[n-1] <= array[n] {
        return "ascending"
    }
    
    //check if first 2 and last 2 elements are in decreasing order
    else if array[0] >= array[1] && array[n-1] >= array[n] {
        return "decending"
    }
    
    // If first 2 elements are in increasing order and last 2 elements are in decreasing order
    else if array[0] <= array[1] && array[n-1] >= array[n] {
        return "Increasing and then decending"
    }
    else {
        return "decreasing and then acending"
    }
    
}
