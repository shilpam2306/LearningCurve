//
//  spiralPrint.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//




//Print in spiral way
func spiralPrint(input : [[Int]]) -> [Int] {
    let numRows = input.count
    let numColms = input[0].count
    
    var topRow = 0
    var btmRow = numRows - 1
    var leftCol = 0
    var rightCol = numColms - 1
    
    var resultArray = [Int]()
    
    while topRow <= btmRow && leftCol <= rightCol {
        for i in leftCol...rightCol {
            resultArray.append(input[topRow][i])
        }
        topRow = topRow + 1
        
        for i in topRow...btmRow {
            resultArray.append(input[i][rightCol])
        }
        rightCol = rightCol - 1
        
        for i in stride(from: rightCol, to: leftCol-1, by: -1) {
            resultArray.append(input[btmRow][i])
        }
        btmRow = btmRow - 1
        
        for i in stride(from: btmRow, to: topRow-1, by: -1) {
            resultArray.append(input[i][leftCol])
        }
        leftCol = leftCol + 1
    }
    
    return resultArray
}


//spiralPrint(input: [[1,2,3,4,5],
//                    [6,7,8,9,10],
//                    [11,12,13,14,15],
//                    [16,17,18,19,20]])
