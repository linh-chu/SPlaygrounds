import Foundation

precedencegroup AssignmentTrue {
    assignment: true
}

precedencegroup AssignmentFalse {
    assignment: false
}

infix operator ++=: AssignmentPrecedence
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
assignmentTesting?.number ++= 3

print(assignmentTesting!.number)

// assigns 0 + 3 to assignmentTesting.number
//print(assignmentTesting!.number)
//assignmentTesting!.number ++ 5 // returns 3 + 5
//assignmentTesting?.number // == 3
