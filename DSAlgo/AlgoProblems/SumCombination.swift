//
//  SumCombination.swift
//  DSAlgo
//
//  Created by Shilpa M on 06/06/21.
//

import Foundation

//Algorithm - backtracking dp 
// array : [1,2,3] , Target : 3
                        //Start with empty array - append number if less then target
//                                           []
//                              /             |                          \
//                     [1]                   [2]                         [3] - 0(found target)
//            (remaining is 2)      (remaining is 1 for the target 3)
//                 /         \                /       \
//        [1,2]-0           [1,3] x          [2,1]     [2,3] x
//(found so append
//   to matrix)        (>3 so don't take)    (already done so dp)

//[1,2,3] -> [1,2] , [3]


//only diffrence for repeating and non repeating elements
// index : i+1 // non repeating
// index : i // repeating


// Non Repeating

var resultmatrixNP = [[Int]]()
func someCombinationNonRepeating(_ array : [Int], target : Int) ->[[Int]] {
    helperDp(array, target, 0, [])
    return resultmatrixNP
}

func helperDp( _ array : [Int], _ target : Int , _ index : Int , _ sol : [Int]) {
    //sorted so easy to increament and can stop as soon as element becomes greater then target, we can do this or not that's ok - this is just ot optimise
    let array = array.sorted()
    
    //base condition
    if target < 0 {
        return
    }
    
    //when target becomes 0 we got the sum combination array append to matrix
    if target == 0 {
        resultmatrixNP.append(sol)
    }
    
    
    //index keeps increasing on every recursion
    for i in index..<array.count {
       
        //if next value is same value continue - If same value we can continue, this is just to optimise, if we don't add this also works
        if i > index && array[i-1] == array[i] {
           continue
        }
        
        // array element is greater then target we can stop
        if array[i] > target {
            break
        } else {
            //if array element is less then target - target minus current element , increace index and append that element to solution array
            //if repeating needed i not i + 1
            helperDp(array, target-array[i], i+1, sol + [array[i]])
        }
        
    }
}







//Repeating
var resultmatrixR = [[Int]]()
func someCombinationRepeating(_ array : [Int], target : Int) ->[[Int]] {
    helperDpR(array, target, 0, [])
    return resultmatrixR
}

func helperDpR( _ array : [Int], _ target : Int , _ index : Int , _ sol : [Int]) {

    let array = array.sorted()
    
    if target < 0 {
        return
    }
    
    //when target becomes 0 we got the sum combination array append to matrix
    if target == 0 {
        resultmatrixR.append(sol)
    }
    
    //index keeps increasing on every recursion
    for i in index..<array.count {
        // array element is greater then target we can stop
        if array[i] > target {
            break
        } else {
            //if array element is less then target - target minus current element , dont increase index as we need repeating and append that element to solution array
            helperDp(array, target-array[i], i, sol + [array[i]])
        }
        
    }
}

