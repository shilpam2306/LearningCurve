//
//  LongestBitonicSubsequence.swift
//  DSAlgo
//
//  Created by Shilpa M on 16/06/21.
//

//Given an array arr[0 … n-1] containing n positive integers, a subsequence of arr[] is called Bitonic if it is first increasing, then decreasing. Write a function that takes an array as argument and returns the length of the longest bitonic subsequence.
//
//ex: Input arr[] = {1, 11, 2, 10, 4, 5, 2, 1};
//Output: 6 (A Longest Bitonic Subsequence of length 6 is 1, 2, 10, 4, 2, 1)



//Solution
//This problem is a variation of standard Longest Increasing Subsequence (LIS) problem. Let the input array be arr[] of length n. We need to construct two arrays lis[] and lds[] using Dynamic Programming solution of LIS problem. lis[i] stores the length of the Longest Increasing subsequence ending with arr[i]. lds[i] stores the length of the longest Decreasing subsequence starting from arr[i]. Finally, we need to return the max value of lis[i] + lds[i] – 1 where i is from 0 to n-1.

/* lbs() returns the length of the Longest Bitonic Subsequence in
    arr[] of size n. The function mainly creates two temporary arrays
    lis[] and lds[] and returns the maximum lis[i] + lds[i] - 1.
 
    lis[i] ==> Longest Increasing subsequence ending with arr[i]
    lds[i] ==> Longest decreasing subsequence starting with arr[i]
    */
//n = arr.count
func lbs( arr : [Int], n: Int ) -> Int {
        var i = 0
        var j = 0
 
        /* Allocate memory for LIS[] and initialize LIS values as 1 for
            all indexes */
        var lis = [Int]()
        for i in 0..<n {
           lis[i] = 1
        }
 
        /* Compute LIS values from left to right */
      for i in 1..<n {
        for j in 0..<n {
            if (arr[i] > arr[j] && lis[i] < lis[j] + 1) {
                    lis[i] = lis[j] + 1
            }
        }
    }
 
        /* Allocate memory for lds and initialize LDS values for
            all indexes */
        var lds = [Int]()
         for i in 0..<n {
            lds[i] = 1
         }
 
        /* Compute LDS values from right to left */
       for i in stride(from: n-2, to: 0, by: -1) {
           for j in stride(from: n-1, to: 0, by: -1) where j > i {
            
            if (arr[i] > arr[j] && lds[i] < lds[j] + 1) {
                    lds[i] = lds[j] + 1
            }
          }
       }
 
 
        /* Return the maximum value of lis[i] + lds[i] - 1*/
        var max = lis[0] + lds[0] - 1
        for i in 1..<n {
            if (lis[i] + lds[i] - 1 > max) {
                max = lis[i] + lds[i] - 1
            }
        }
        return max
}







//The Longest Increasing Subsequence (LIS) problem is to find the length of the longest subsequence of a given sequence such that all elements of the subsequence are sorted in increasing order. For example, the length of LIS for {10, 22, 9, 33, 21, 50, 41, 60, 80} is 6 and LIS is {10, 22, 33, 50, 60, 80}.

//We can see that there are many subproblems in the above recursive solution which are solved again and again. So this problem has Overlapping Substructure property and recomputation of same subproblems can be avoided by either using Memoization or Tabulation.

//The simulation of approach will make things clear:
//
//Input  : arr[] = {3, 10, 2, 11}
//LIS[] = {1, 1, 1, 1} (initially)
//Iteration-wise simulation :
//
//arr[2] > arr[1] {LIS[2] = max(LIS [2], LIS[1]+1)=2}
//arr[3] < arr[1] {No change}
//arr[3] < arr[2] {No change}
//arr[4] > arr[1] {LIS[4] = max(LIS [4], LIS[1]+1)=2}
//arr[4] > arr[2] {LIS[4] = max(LIS [4], LIS[2]+1)=3}
//arr[4] > arr[3] {LIS[4] = max(LIS [4], LIS[3]+1)=3}
//We can avoid recomputation of subproblems by using tabulation as shown in the below code:



func lis( arr : [Int], n: Int ) -> Int {
    var lis = [Int]()
 
    lis[0] = 1
 
    /* Compute optimized LIS values in
       bottom up manner */
    for i in 1..<n {
        lis[i] = 1
        for j in 0..<n {
            if (arr[i] > arr[j] && lis[i] < lis[j] + 1) {
                lis[i] = lis[j] + 1
            }
        }
    }
 
    // Return maximum value in lis[]
    return max(lis.max()!, lis.max()! + n);
}



var  arr = [ 10, 22, 9, 33, 21, 50, 41, 60 ]
var n = arr.count / arr.count[0]

