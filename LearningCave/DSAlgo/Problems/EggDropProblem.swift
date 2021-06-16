//
//  EggDropProblem.swift
//  DSAlgo
//
//  Created by Shilpa M on 05/06/21.
//

import Foundation


//Problem : which floor is the min floor breaks the egg on drop


// Recursive solution
//The solution is to try dropping an egg from every floor(from 1 to k) and recursively calculate the minimum number of droppings needed in the worst case. The floor which gives the minimum value in the worst case is going to be part of the solution.



func eggDropRecursive( _ eggs : Int , _ floor : Int) -> Int {
    // If there are no floors,
    // then no trials needed.
    // OR if there is one floor,
    // one trial needed.
    if (floor == 1 || floor == 0) {
        return floor
    }
     
    // We need k trials for one
    // egg and k floors
    if (eggs == 1) {
       return floor
    }
     
    var min = Int.max
    var res = 0
    
    // Consider all droppings from
    // 1st floor to kth floor and
    // return the minimum of these
    // values plus 1.
    for x in 1..<floor {
        res = max(
           eggDropRecursive(eggs-1, floor-1),eggDropRecursive(eggs, floor - x))
        if (res < min) {
           min = res
        }
            
    }
 
    return min + 1
        
}



//1) Optimal Substructure:
//When we drop an egg from a floor x, there can be two cases (1) The egg breaks (2) The egg doesn’t break.

//If the egg breaks after dropping from ‘xth’ floor, then we only need to check for floors lower than ‘x’ with remaining eggs as some floor should exist lower than ‘x’ in which egg would not break; so the problem reduces to x-1 floors and n-1 eggs.
//If the egg doesn’t break after dropping from the ‘xth’ floor, then we only need to check for floors higher than ‘x’; so the problem reduces to ‘k-x’ floors and n eggs.



//Solution 2 : DynamicProblem using memorisation
//In this approach, we work on the same idea as described above neglecting the case of calculating the answers to sub-problems again and again..
//storing the values in matrix

func eggDropDp( _ numberOfEggs : Int , _ numberOfFloors : Int) -> Int {
    if numberOfEggs == 0 || numberOfFloors == 0{ //edge case: When either number of eggs or number of floors is 0, answer is 0
            return 0
        }
        if numberOfEggs == 1 || numberOfFloors == 1{ //edge case: When either number of eggs or number of floors is 1, answer is 1
            return 1
        }
        
        var eggFloor = [[Int]](repeating: [Int](repeating: 0, count: numberOfFloors+1), count: numberOfEggs+1) //egg(rows) floor(cols) array to store the solutions
        var attempts: Int = 0
        
    for floorNumber in 0..<numberOfFloors+1 {
            eggFloor[1][floorNumber] = floorNumber  //base case: if there's only one egg, it takes 'numberOfFloors' attempts
        }
        eggFloor[2][1] = 1 //base case: if there are two eggs and one floor, it takes one attempt
        
    for eggNumber in 2..<numberOfEggs+1{
        for floorNumber in 2..<numberOfFloors+1{
                eggFloor[eggNumber][floorNumber] = Int.max   //setting the final result a high number to find out minimum
            for visitingFloor in (1..<(floorNumber+1)){
                    //there are two cases
                    //case 1: egg breaks. meaning we'll have one less egg, and we'll have to go downstairs -> visitingFloor-1
                    //case 2: egg doesn't break. meaning we'll still have 'eggs' number of eggs, and we'll go upstairs -> floorNumber-visitingFloor
                    attempts = 1 + max(eggFloor[eggNumber-1][visitingFloor-1], eggFloor[eggNumber][floorNumber-visitingFloor])//we add one taking into account the attempt we're taking at the moment
                    
                    if attempts < eggFloor[eggNumber][floorNumber]{ //finding the min
                        eggFloor[eggNumber][floorNumber] = attempts;
                    }
                }
            }
        }
        
    return eggFloor[numberOfEggs][numberOfFloors]
}


