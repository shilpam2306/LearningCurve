//
//  Power.swift
//  DSAlgo
//
//  Created by Shilpa M on 17/06/21.
//



// we can do it to any power - 2 ,4 ..
func isPowerOfThree(_ n: Int) -> Bool {
        var n = n
         if (n < 1) {
            return false
        }

        while (n % 3 == 0) {
            n /= 3
        }

        return n == 1
}
