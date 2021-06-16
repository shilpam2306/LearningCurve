//
//  PrintOnlyIntegers.swift
//  DSAlgo
//
//  Created by Shilpa M on 16/06/21.
//

func numDifferentIntegers(_ word: String){
    var word = Array(word)
    word.append("a")
    var str = ""
    var result = [String]()
    for i in 0..<word.count {
        let n = Int(String(word[i]))
       print(n)
        if n != nil {
            str += String(n ?? 0)
            print(str)
        } else {
            result.append(str)
            str = ""
        }
    }
    let r = result.filter{$0 != ""}
    print(r)
}

//numDifferentIntegers("leet1234code234") -> 1234 , 234
