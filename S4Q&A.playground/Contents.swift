import UIKit

/**
 * Composing Classes and Protocols
 */

protocol Shakeable {
    func shake()
}
extension UIButton: Shakeable { func shake() {} }
extension UISlider: Shakeable { func shake() {} }
func shakeEm(controls: [UIColor & Shakeable]) {
    for control in controls where control.ciColor == UIColor.red {
        control.shake()
    }
}

/**
 * String as a collection of characters
 */

let values = "one,two,three..."

var i = values.startIndex
// i... = i..<values.endIndex: from the index to the end of the collection
while let comma = values[i...].index(of: ",") {
    if values[i..<comma] == "two" {
        print("Found it!")
    }
    i = values.index(after: comma)
}

/**
 * Sorting
 */
let animals = ["fish", "cat", "chicken", "dog"]
let sorted = animals.sorted()
print(sorted)
let string: String? = Optional.none


