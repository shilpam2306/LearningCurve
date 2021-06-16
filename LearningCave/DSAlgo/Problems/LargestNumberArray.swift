//
//  LargestNumberArray.swift
//  DSAlgo
//
//  Created by Shilpa M on 15/06/21.
//

import Foundation

//Arrange given numbers to form the biggest number

//solution 1
// Use permutation and check for highest permutation



//solution 2
//Given two numbers X and Y, how should  decide which number to put first – we compare two numbers XY (Y appended at the end of X) and YX (X appended at the end of Y). If XY is larger, then X should come before Y in output, else Y should come before. For example, let X and Y be 542 and 60. To compare X and Y, we compare 54260 and 60542. Since 60542 is greater than 54260, we put Y first.


func largestNumber1(_ nums: [Int]) -> String {
     let largestNum = nums.map{ String($0) }.sorted{ $0 + $1 > $1 + $0 }
     if largestNum[0] == "0"{
         return "0"
     }
     return largestNum.joined()
}





//wrong
// append each element with other and check which is greater and swap
func largetNumber( _ array : [Int]) -> [Int] {
    var array = array
    for i in 0..<array.count {
        for j in 0..<array.count {
            if i != j {
               let val = myCompare(String(i), String(j))
                if val == 1 {
                    array.swapAt(i,j)
                } else {
                    array.swapAt(j,i)
                }
            }
        }
    }
}

func myCompare( _ X : String, _ Y : String) -> Int {
        // first append Y at the end of X
    let XY = X + Y
     
        // then append X at the end of Y
    let YX = Y + X
     
        // Now see which of the two
        // formed numbers is greater
    return Int(XY) ?? 0 > Int(YX) ?? 0 ? 1 : 0
}

//largetNumber([3,30,34,5,9])
