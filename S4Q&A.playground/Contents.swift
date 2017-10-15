import UIKit

// Composing Classes and Protocols

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
