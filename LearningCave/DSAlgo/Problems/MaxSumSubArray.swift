//
//  MaxSumSubArray.swift
//  DSAlgo
//
//  Created by Shilpa M on 15/06/21.
//

//Maximum Subarray : Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its

//Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.
//Solution : Kadane’s algorithm – Devide and conquer
//
//we will create 2 initial elements one maxCurrent and one for maxGlobal.
//
//we loop through the array and find the max between nums[i] and add of (maxCurrent element + nums[i])
//first we will take the first element and add it to currentArray and to globalArray.
//Next we will check , if maxCurrent element is greater then maxGlobal element . If yes we will make the maxCurrent as maxGlobal
//[ -1, 2 ,3 ,-5,4]
//
//maxcurrent = -1, 2, 5, 0, 4
//
//maxGlobal = -1, 2, 5, 5,5
//
//ans : 5

//Time : o(n) , space o(n)

func maxSubArray(nums : [Int]) -> Int {
    
    //we will put first element to maxCurrent and maxGlobal
    var maxCurrent = nums[0]
    var maxGlobal = nums[0]
    let i = 1
    for i in i..<nums.count {
      //Find max of current element of an array and previous element in currentArray + current element
      maxCurrent = max(nums[i], maxCurrent + nums[i])
      
      // if maxCurrent is greater the maxGlobal make maxGlobal = maxCurrent
      if (maxCurrent > maxGlobal) {
        maxGlobal = maxCurrent;
      }
    }

    return maxGlobal
}

