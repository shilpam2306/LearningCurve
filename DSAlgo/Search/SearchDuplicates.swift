//
//  SearchDuplicates.swift
//  DSAlgo
//
//  Created by Shilpa M on 09/06/21.
//

import Foundation


//Search Duplicates in a String or number anything - frequency - dictinory

//Create dictionary of input array as keys and add values if duplicates increase the value count
func duplicateSearch(_ str : String) {
    
    let str = Array(str)
    var dictionary = [String : Int]()
    let value = 1
    
    for i in str {
        if dictionary[String(i)] == nil {
            dictionary[String(i)] = value
        } else {
            dictionary.updateValue(dictionary[String(i)]! + 1, forKey: String(i))
        }
    }
    
    //to get values and keys
    for (key ,value) in dictionary.enumerated() {
        print(value)
        print(value.key) // gives keys
        print(value.value) // gives values
    }
    
    //To get key for value using extention below
    let key = dictionary.allKeys(forValue : 3)
    
    
    //To get max frequency keys
    for (key ,value) in dictionary {
        if dictionary[key] == dictionary.values.max() {
            print(key)
        }
    }
}

extension Dictionary where Value : Equatable {
    func allKeys(forValue val : Value) -> [Key] {
        return self.filter{$1 == val}.map{$0.0}
    }
    
}
