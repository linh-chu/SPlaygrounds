/*
 an operator marked assignment gets folded into an optional chain, allowing foo?.bar += 2 to work as foo?(.bar += 2) instead of failing to type-check as (foo?.bar) += 2. This behavior will be passed to assignment: true on precedence groups from SE-0077. 
 https://lists.swift.org/pipermail/swift-evolution-announce/2016-June/000191.html
 */

precedencegroup AssignmentTrue {
    assignment: true
}

precedencegroup AssignmentFalse {
    assignment: false
}

infix operator ++=: AssignmentFalse
infix operator ++: AssignmentFalse


extension Int {
    // ++= behaving like +=
    static func ++= (left: inout Int, right: Int) {
        left += right
    }
    
    // ++ behaving like +
    static func ++ (left: Int, right: Int) -> Int {
        return left + right
    }
}

struct AssignmentTesting { var number = 0 }

var assignmentTesting: AssignmentTesting? = AssignmentTesting()
assignmentTesting!.number ++= 3

print(assignmentTesting!.number)

// assigns 0 + 3 to assignmentTesting.number
//print(assignmentTesting!.number)
//assignmentTesting!.number ++ 5 // returns 3 + 5
//assignmentTesting?.number // == 3
