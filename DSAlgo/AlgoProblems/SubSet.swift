//
//  SubSet.swift
//  DSAlgo
//
//  Created by Shilpa M on 06/06/21.
//

import Foundation

// PRoblem : Input an array without duplicate numbers, and your algorithm needs to output all subsets of these numbers.


// Solution : BackTraking
//Same as SumCombination - remove target and all condition related to it
//[1,2,3]
// 2 choise
//1. ignore the current element and call the recursion function with current subset and the next index

//2. Insert the current element in the subset and call the recursion function with current subset and the next index
//                                []
//                        /        |         \
//               [1]              [2]          [3]
//            /      \             |
//       [1,2]       [1,3]       [2,3]
//         |
//     [1,2,3]



func subSet(_ array : [Int]) -> [[Int]] {
    var resultmatrix = [[Int]]()
    var resultArray = [Int]()
    helperSubset(array, 0, &resultArray, &resultmatrix)
    return resultmatrix
}

func helperSubset( _ array : [Int], _ index : Int , _ resultArray : inout [Int] , _ resultmatrix : inout [[Int]]) {
    
    if array.count < 1 {
        return
    }
    
    resultmatrix.append(resultArray)
   //index keeps increasing on every recursion
    for i in index..<array.count {
       
        //not to take repetation
        if i > index && array[i-1] == array[i] {
           continue
        }
        //Insert the current element in the subset and call the recursion function with current subset and the next index
        resultArray.append(array[i])
        helperSubset(array, i+1, &resultArray, &resultmatrix)
        resultArray.removeLast()
    }
        
}







//Solution : Suppose now I know the results of a smaller subproblem,
//I know subset of [1] is [1] -> add next to that subset [1,2] [2]
//[] -> [1] -> [2] [1,2] -> [3] [1,3] [2,3] [1,2,3]
//= A + [A[i].add(3) for i = 1..len(A)]
