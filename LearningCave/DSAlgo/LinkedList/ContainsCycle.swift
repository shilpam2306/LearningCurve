//
//  ContainsCycle.swift
//  DSAlgo
//
//  Created by Shilpa M on 13/06/21.
//



//Check if linked list has loop or contains cycle
// Algo : if both are running in diffrent speed they can meet only if there is loop or cycle

func containsCycle(head : NodeL) -> Bool {
    //start both at the begining
    var slowRunner = head // rabit
    var fastRunner = head  // tortise
    
    // slowRunner : one node per iteration- rabbit
    // fastRunner : two node per iteration -tortise
    // if both are running in diffrent speed they can meet only if there is loop or cycle
    // until we hit the end of the list
    while let nextRunner == slowRunner?.next, let nextFastRunner = fastRunner.next?.next {
        slowRunner = nextRunner
        fastRunner = nextFastRunner
        
        //use equatable - check if both are equal at any point, if equal it's a loop
        if fastRunner === slowRunner {
            return true
        }
    }
    
    return false
}




//tell which is the starting point of the loop

//My thoughts
// what if we store all the meeting points  and if any of the point has previous node out of the store then that should be the starting point. If none have previous node then start is 0
