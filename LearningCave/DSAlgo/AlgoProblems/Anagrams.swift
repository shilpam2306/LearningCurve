//
//  Anagrams.swift
//  DSAlgo
//
//  Created by Shilpa M on 12/06/21.
//

//An anagram is a word or phrase formed be rearranging the letters of a diffrent word or  phrase, typically using all the orginal letters exactly once

func isAnagram(_ a : String , _ b : String) -> Bool {
    return a.lowercased().sorted() == b.lowercased().sorted()
}



//Group Anagrams
func groupAnagrams( _ str : [String]) -> [[String]] {
    var resultDictionary = [String : [String]]()
    
    for i in str {
        resultDictionary[String(i.sorted()), default : []].append(i)
    }
    
    return Array(resultDictionary.values)
}

//groupAnagrams(["eat", "tea", "tan", "ate", "nat" ,"bat"])
