//
//  CandyDistribute.swift
//  DSAlgo
//
//  Created by Shilpa M on 16/06/21.
//

//There are N children standing in a line and each child is assigned a rating value. You are giving candies to these children while making sure that each child must have at least one candy and children with a higher rating get more candies than their neighbors. What is the minimum candies you must give?

//Solution :
//Forward Traversal: Start traversing the ratings from the first child and update the candy count of the next child on the way. If the rating of the current child is less than the next child’s rating, then the next child’s candy count must be at least 1 more than the candy count of the current child.
//Backward Traversal: Start traversing the ratings from the last child and update the candy count of the previous child on the way. If the rating of the current child is less than the previous child’s rating then the previous child’s candy count must be at least 1 more than the candy count of the current child.
//Count Candies: Calculate sum of the candy counts for each child for the final count.


// first give 1 for all then comparing with the previous elment increase the candy count + 1 the previous count if rating is more then the previous child else live as it is- left to right
// first give 1 for all then comparing with the previous elment increase the candy count + 1 the previous count if rating is more then the previous child else live as it is- right to left

//// Time Complexity: O(n) 3 Linear traversals.
// Space Complexity: O(n) Array of candies.

func candy(ratings : [Int]) -> Int {
      if (ratings.count < 2) {
        return ratings.count
      }
        
      //var candies = 0
      var candies = Array(repeating: 1, count: ratings.count)
      
        
      // ** Step 1: Forward **
      for i in 0..<ratings.count-1{
        if (ratings[i] >= ratings[i+1]) {
          continue
        }
        candies[i+1] = candies[i] + 1;
      }
        
      // ** Step 2: Backward **
     
     for i in stride(from: ratings.count-1, to: -1, by: -1) {
        if (ratings[i] >= ratings[i-1]) {
          continue
        }
        candies[i-1] = max(candies[i] + 1, candies[i-1]);
      }
        
      // ** Step 3: Count Candies **
      var count = 0
      for i in 0..<candies.count {
        count += candies[i];
      }
        
      return count
 }
