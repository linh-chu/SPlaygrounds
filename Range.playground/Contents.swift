// Swift-evolution: Range: https://github.com/apple/swift-evolution/blob/master/proposals/0065-collections-move-indices.md

import Foundation

// Approach 1: casting
//extension Range {
//    init(_ range: NSRange, in string: String) {
//        let lower : Bound = string.index(string.startIndex, offsetBy: range.location) as! Bound
//        let upper : Bound = string.index(string.startIndex, offsetBy: NSMaxRange(range)) as! Bound
//        
//        self.init(uncheckedBounds: (lower: lower, upper: upper))
//    }
//}

// Approach 2: specifying Range type
extension Range where Bound == String.Index {
    // Add an initializer to Range
    init(_ range: NSRange, in string: String) {
        let lower = string.index(string.startIndex, offsetBy: range.location)
        let upper = string.index(string.startIndex, offsetBy: NSMaxRange(range))
        self.init(uncheckedBounds: (lower: lower, upper: upper))
    }
}

let string = "Swift"
let range = NSRange(location: 1, length: 3)

let r = Range<String.Index>(range, in: string)
print(string[r])

//extension String.Index: Comparable {
//    // MARK: Comparable
//    
//    static func <(lhs: String.Index, rhs: String.Index) -> Bool {
//        return lhs < rhs
//    }
//    
//    // MARK: Equatable
//    
//    static func ==(lhs: String.Index, rhs: String.Index) -> Bool {
//        return lhs == rhs
//    }
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
