//
//  SlidingWindow.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//

//Return the maximum sliding window

func maxSlidingWindow( _ nums : [Int] , _ k : Int)  -> [[Int]] {
    var resultArray = [Int]()
    var resultMatrix = [[Int]]()
    var left = 0
    var right = k
    while right <= nums.count {
        for i in left...right {
            resultArray.append(nums[i])
            if resultArray.count == k {
                resultMatrix.append(resultArray)
                resultArray.removeAll()
                left += 1
                right += 1
            }
        }
    }
    return resultMatrix
}


//maxSlidingWindow([1,3,-1,-3,5,3,6,7],3) ->[1,3,-1],[3,-1,-3]





func lengthOfRepeatingSubstring(_ str : String) -> Int {
    let str = Array(str)
    var resultSet = Set<String>()
    var max = 0
    var left = 0
    var right = 0
    while right <= str.count {
        if resultSet.contains(String(str[right])) {
            resultSet.removeAll()
            left += right
        }else {
            resultSet.insert(String(str[left]))
            if resultSet.count > max {
                //if you want to save the suset save it here ina array here only checking for max element
                max = resultSet.count
                right += 1
            }
        }
    }
    
    return max
}

//lengthOfRepeatingSubstring("aaabcde")-> abcde
