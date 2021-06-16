//
//  Permutation.swift
//  DSAlgo
//
//  Created by Shilpa M on 11/06/21.
//

//permutation and combination- Backtraking






func permutaionWith<T>(_ a : [T] , _ n : Int) {
    var a = a
    if n == 0 {
        print(a)
    } else {
       //calling permutation function by keeping the element at the index start fixed
        permutaionWith(a, n-1)
        for i in 0..<n {
            //Swaping
            a.swapAt(i,n)
            //Calling permutation function by keeping the element at the index start fixed which is in end now
            permutaionWith(a, n-1)
            //restoring the array - to recover the orginal array
            a.swapAt(i,n)
        }
        
    }
}

//let array = [a,b,c]
//permutaionWith(array, array.count-1)







//Good

//                                        abc
//            a(bc)                      b(ac)                          c(ba)
//        (a is fixed swap a)        (b is fixed swap a with b)    (c is fixed swap a with c)
//      ab(c)           ac(b)       ba(c)        bc(a)             cb(a)           ca(b)
//(ab is fixed,if remaining is 1 return)

func permutaionWithFixed<T>(_ a : [T] , _ l : Int , _ r : Int) {
    var a = a
    if l == r {
        print(a)
    } else {
       for i in l..<r {
            //Swaping
            a.swapAt(l,i)
            //Calling permutation function by keeping the element at the index start fixed which is in end now
            permutaionWithFixed(a, l+1 , r) // b and c it is calling
            //restoring the array - to recover the orginal array - backtracking
            a.swapAt(l,i)
        }
        
    }
}

//let ar = ["a","b","c"]
//permutaionWithFixed(["a","b","c"],0, ar.count)
