// Swift-evolution: Range: https://github.com/apple/swift-evolution/blob/master/proposals/0065-collections-move-indices.md

import Foundation

/// Approach 1: casting
//extension Range {
//    init(_ range: NSRange, in string: String) {
//        let lower : Bound = string.index(string.startIndex, offsetBy: range.location) as! Bound
//        let upper : Bound = string.index(string.startIndex, offsetBy: NSMaxRange(range)) as! Bound
//        
//        self.init(uncheckedBounds: (lower: lower, upper: upper))
//    }
//}

/// Approach 2: specifying Range type
extension Range where Bound == String.Index {
    init(_ range: NSRange, in string: String) {
        let lower16 = string.utf16.index(string.utf16.startIndex, offsetBy: range.location)
        let upper16 = string.utf16.index(string.utf16.startIndex, offsetBy: NSMaxRange(range))
        
        if let lower = lower16.samePosition(in: string),
            let upper = upper16.samePosition(in: string) {
            self.init(lower..<upper)
        } else {
            fatalError("init(range:in:) could not be implemented")
        }
    }
}

let string = "❄️ Let it snow! ☃️"

let range1 = NSRange(location: 0, length: 2)
let r1 = Range<String.Index>(range1, in: string) // ❄️

let range2 = NSRange(location: 1, length: 3)
let r2 = Range<String.Index>(range2, in: string) // fatal error: init(range:in:) could not be implemented


/// Description: Returns the position in the given string that corresponds exactly to this index. This index must be a valid index of characters.utf16. This example first finds the position of a space (UTF-16 code point 32) in a string’s utf16 view and then uses this method find the same position in the string.
//func samePosition(in characters: String) -> String.Index? {
//    
//}




//let lower = string.index(string.startIndex, offsetBy: range.location)
//let upper = string.index(string.startIndex, offsetBy: NSMaxRange(range))
//
//var s = string.substring(with: lower..<upper)
//
//let r1 = Range(uncheckedBounds: (lower: lower, upper: upper))
//print(string[r1])
//
//let r = lower..<upper
//print(string[r])
//
//print(string[lower])
//print(string[upper])
