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



//Max Continous subArray
//The simple idea of Kadane’s algorithm is to look for all positive contiguous segments of the array (max_ending_here is used for this). And keep track of maximum sum contiguous segment among all positive segments (max_so_far is used for this). Each time we get a positive-sum compare it with max_so_far and update max_so_far if it is greater than max_so_far

//Lets take the example:
//{-2, -3, 4, -1, -2, 1, 5, -3}
//
//max_so_far = max_ending_here = 0
//
//for i=0,  a[0] =  -2
//max_ending_here = max_ending_here + (-2)
//Set max_ending_here = 0 because max_ending_here < 0
//
//for i=1,  a[1] =  -3
//max_ending_here = max_ending_here + (-3)
//Set max_ending_here = 0 because max_ending_here < 0
//
//for i=2,  a[2] =  4
//max_ending_here = max_ending_here + (4)
//max_ending_here = 4
//max_so_far is updated to 4 because max_ending_here greater
//than max_so_far which was 0 till now
//
//for i=3,  a[3] =  -1
//max_ending_here = max_ending_here + (-1)
//max_ending_here = 3
//
//for i=4,  a[4] =  -2
//max_ending_here = max_ending_here + (-2)
//max_ending_here = 1
//
//for i=5,  a[5] =  1
//max_ending_here = max_ending_here + (1)
//max_ending_here = 2
//
//for i=6,  a[6] =  5
//max_ending_here = max_ending_here + (5)
//max_ending_here = 7
//max_so_far is updated to 7 because max_ending_here is
//greater than max_so_far
//
//for i=7,  a[7] =  -3
//max_ending_here = max_ending_here + (-3)
//max_ending_here = 4

//o(n)

 
func maxSubArraySum(_ a : [Int]) -> Int
    {
        var size = a.count
        var max_so_far = Int.min
        var max_ending_here = 0
 
       for i in 0..<size
        {
            max_ending_here = max_ending_here + a[i];
        if (max_so_far < max_ending_here) {
                max_so_far = max_ending_here
        }
        if (max_ending_here < 0) {
                max_ending_here = 0;
        }
       }
        return max_so_far
    }


//maxSubArraySum([-2, -3, 4, -1, -2, 1, 5, -3])


