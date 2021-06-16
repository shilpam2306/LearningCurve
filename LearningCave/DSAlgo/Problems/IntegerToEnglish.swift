//
//  IntegerToEnglish.swift
//  DSAlgo
//
//  Created by Shilpa M on 11/06/21.
//

class solution {
    var LESS_THAN_TWENTY = ["","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen",
    "Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"]
    var TWENTY = ["","","Twenty","Thirty","Forty","Fifty","Sixty","Seventy","Eighty","Ninety"]
    
    func intToEng(num : Int) -> String {
        if num == 0 {
            return "Zero"
        }
        
        return helper(num)
    }
    
    func helper(_ num : Int) -> String {
        var sb = [String]()
        if num == 0 {
            return ""
        }
        if num >= 1000000000 {
            sb.append(helper(num/1000000000))
            sb.append("Billion")
            sb.append(helper(num%1000000000))
        }
        else if num >= 1000000 {
            sb.append(helper(num/1000000))
            sb.append("Million")
            sb.append(helper(num%1000000))
        }
        else if num >= 1000 {
            sb.append(helper(num/1000))
            sb.append("Thousand")
            sb.append(helper(num%1000))
        }
        else if num >= 100 {
            sb.append(helper(num/100))
            sb.append("Hundred")
            sb.append(helper(num%100))
        }
        else if num >= 20 {
            sb.append(TWENTY[num/10])
            sb.append("")
            sb.append(helper(num%10))
        }
        else {
            sb.append(LESS_THAN_TWENTY[num])
        }
        
        return sb.joined(separator: " ")
        
    }
}

//let sol = solution()
//sol.intToEng(num: 6795)
