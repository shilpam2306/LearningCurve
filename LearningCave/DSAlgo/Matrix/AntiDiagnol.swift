//
//  AntiDiagnol.swift
//  DSAlgo
//
//  Created by Shilpa M on 15/06/21.
//

func diagonal(_ m : [[Int]]) -> [[Int]]
{
 
    var N = m.count
    
    var resultMatrix = [[Int]]()
 
    // upper trianle coloumn iterate
    for i in 0..<N {
 
        var startcol = i
        var startrow = 0
        var ar = [Int]()
        //col shoul be greter then 0
        while (startcol >= 0) {
           
            ar.append(m[startrow][startcol])
            startcol -= 1
            startrow += 1
        }
        resultMatrix.append(ar)
    }
 
    // lower triangle row iterate
    for i in 1..<N {
        var startrow = i
        var startcol = N-1
        var ar = [Int]()
        while (startrow < N) {
            ar.append(m[startrow][startcol])
            startcol -= 1
            startrow += 1
        }
        resultMatrix.append(ar)
    }
    
    return resultMatrix
}


//diagonal([[1,2,3,4],
//                    [6,7,8,9],
//                    [11,12,13,14],
//                    [16,17,18,19]])

 

