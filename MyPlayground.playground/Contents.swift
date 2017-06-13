//: Playground - noun: a place where people can play

import UIKit
import Foundation


// Add days to a date
let today = Date(timeIntervalSince1970: 0)
var dateComponent = DateComponents()
dateComponent.day = 3
let next3Days = Calendar.current.date(byAdding: dateComponent, to: today)

// Convert attributed string to string
var attributedString = NSMutableAttributedString(string: "hello, world!")
var s = attributedString.string

// Insert an element to a particular array index
var array = ["a", "b", "c", "a", "c", "d"]
array.insert("1", at: 0)

// Find array elements with prefix
if let i = array.index(where:{$0.hasPrefix("a")}) {
    print(i) // index of the 1st found
}

let tupleArray = array.enumerated().map { ($0.offset, $0.element)}.filter {$0.1 == "a"}
if tupleArray.count >= 2 {
    print(tupleArray[1].0) //2
}

let ys = array.indices.filter { array[$0] == "a" }
print(ys)
