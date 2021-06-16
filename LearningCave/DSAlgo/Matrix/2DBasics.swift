//
//  2DBasics.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//



//Add diagnal values
func add2Diagnal(input : [[Int]]) -> Int {
    var total = 0
    for row in 0..<input.count {
        total += input[row][row] + input[row][input.count-row]
    }
    
    return total
}


//print diagnol values
func add2Diagnal(input : [[Int]]) {
    var total = [Int]()
    for row in 0..<input.count {
        total.append(input[row][row])
        total.append(input[row][input.count-row])
    }
    
    print(total)
}


// Add all values of matrix
func addAll(input : [[Int]]) -> Int {
    var total = 0
    
    //left to bottom
    for row in 0..<input.count {
        for col in 0..<input[0].count {
            total += input[row][col]
        }
    }
    
    return total
}



//Rotate the matrix
//The first row turns into last column
//The second row turns into the second last column




//Flip way
func rotate(matrix : [[Int]]) -> [[Int]] {
    var matrix = matrix
    //Step1 : Flip vertically
    matrix.reverse()
    //Step2 : diagnolly
    for i in 0..<matrix.count {
        for j in 0..<i {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
    
    return matrix
}
