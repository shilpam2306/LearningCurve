//
//  Plandrome.swift
//  DSAlgo
//
//  Created by Shilpa M on 12/06/21.
//

// a word , phrase or sequence that reads the same backwards as forwords ex: madam , nurses run

//Plandrome checking whether firat and last elements are same and moving inwords - sandwich approch
func plandrome( _ str : String , _ l : Int , _ r : Int) -> Bool {
    let s = Array(str)
    if l >= r {
        return true
    }
    
    if s[l] != s[r] {
        return false
    }
    
    return plandrome(str , l+1, r-1)
}

//plandrome("abea", 0, 2)







//reverse and check if it is plandrome
func reverseString(_ s : String) -> String {
    let s = Array(s)
    var reversed = [String]()
    for i in stride(from: s.count-1, to: 0, by: -1) {
        reversed.append(String(s[i]))
    }
    return reversed.joined()
}

func reverseInt( _ s : Int) -> Int {
    var s = s
    var reversed = 0
    while s > 0 {
        reversed = reversed * 10 + s % 10
        s = s/10
    }
    
    return reversed
}


func isPlandrome( _ s : String) -> Bool {
    if s == reverseString(s) {
        return true
    }
    return false
}







// get the longest plandrome in the string

// Left and Right pointers move inwords(Sandwich Principle)
func longestPalindrome( _ s : String) -> String {
    //If empty or equal to one we return
    if s.count == 0 {
        return ""
    }
    
    if s .count == 1 {
        return s
    }
    //start and end represent the palindrome with the longest length
    var start = 0 , end  = start , stringArray = Array(s), max = 0
    
    for i in 0..<s.count {
        // Left and right pointers move inwords(sandwich principle)
        var left = i , right = s.count-1 , tempStart = left, tempEnd = right
        
        while(left < right) {
            //if the values are left and right index are equal then we tempprarily store index if greater then max
            if stringArray[left] == stringArray[right] {
                if(right - left) > max {
                    max = (right-left)
                    tempStart = left
                    tempEnd = right
                }
                
                left += 1
                right -= 1
            } else { // reset temp variable and current max
                left = i
                right = tempEnd-1
                tempStart = left
                tempEnd = right
                max = 0
            }
        }
        //Store temp variable and continue the loop
        if tempEnd - tempEnd > end - start {
            end = tempEnd
            start = tempStart
        }
    }
    
    return (String(stringArray[start...end]).count > 1) ? String(stringArray[start...end]) : String(s.first!)
}



//longestPalindrome("beabad") ->aba






// Find Palindrome allowed to remove one

//remove one elemnt from the string check if it is valid and add back the element
func isPlaindromeRemovingOne(_ s : String) -> Bool {
    var s = Array(s)
    for i in 0..<s.count {
        //put the element in c temp
        let c = s[i]
        
        //remove element at i
        s.remove(at : i)
        
        //check now string is valid plandrome
        if helperIsPlanindrome(String(s)) {
            return true
        }
        
        //add element back
        s.insert(c, at: i)
    }
    
    return  helperIsPlanindrome(String(s))
}


func helperIsPlanindrome(_ s : String)  -> Bool{
    return plandrome(s, 0, s.count-1)
}

//helperIsPlanindrome("maddami") -> true


