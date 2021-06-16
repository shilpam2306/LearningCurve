//
//  UniquePaths.swift
//  DSAlgo
//
//  Created by Shilpa M on 16/06/21.
//



//Print all possible paths from top left to bottom right of a mXn matrix


func printAllPaths(_ matrix : [[Int]]) {
    let numRows = matrix.count
    let numCols = matrix[0].count
    
    let currentRow = 0
    let currentCol = 0
    var path = ""
    
    if(currentRow == numRows-1) {
        for i in currentCol..<numCols {
            path = path + "\(matrix[currentRow][i])"
        }
        print(path)
        return
    }
    
    if(currentCol == numCols-1) {
        for i in currentRow..<numRows {
            path = path + "\(matrix[i][currentCol])"
        }
        print(path)
        return
    }
    
    path = path + "\(matrix[currentRow][currentCol])"
}







//Unique paths in a Grid with Obstacles
//Given a grid of size m * n, let us assume you are starting at (1, 1) and your goal is to reach (m, n). At any instance, if you are on (x, y), you can either go to (x, y + 1) or (x + 1, y).
//Now consider if some obstacles are added to the grids. How many unique paths would there be?


//Solution:
//Create a 2D matrix of same size of the given matrix to store the results.
//Traverse through the created array row wise and start filling the values in it.
//If an obstacle is found, set the value to 0.
//For the first row and column, set the value to 1 if obstacle is not found.
//Set the sum of the right and the upper values if obstacle is not present at that corresponding position in the given matrix
//Return the last value of the created 2d matrix

//Time Complexity: O(m*n)
//Auxiliary Space: O(1)


func uniquePathsWithObstacles(A : [[Int]]) {
 
    var r = 3
    var c = 3
 
    // create a 2D-matrix and initializing
    // with value 0
     paths = [[Int]]()
    for(int i = 0; i < r; i++)
    {
      for(int j = 0; j < c; j++)
      {
        paths[i][j] = 0;
      }
    }
 
    // Initializing the left corner if
    // no obstacle there
    if (A[0][0] == 0)
      paths[0][0] = 1;
 
    // Initializing first column of
    // the 2D matrix
    for(int i = 1; i < r; i++)
    {
      // If not obstacle
      if (A[i][0] == 0)
        paths[i][0] = paths[i - 1][0];
    }
 
    // Initializing first row of the 2D matrix
    for(int j = 1; j < c; j++)
    {
 
      // If not obstacle
      if (A[0][j] == 0)
        paths[0][j] = paths[0][j - 1];
    }
 
    for(int i = 1; i < r; i++)
    {
      for(int j = 1; j < c; j++)
      {
 
        // If current cell is not obstacle
        if (A[i][j] == 0)
          paths[i][j] = paths[i - 1][j] +
          paths[i][j - 1];
      }
    }
 
    // Returning the corner value
    // of the matrix
    return paths[r - 1];
  }
