//: Playground - CALayer

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let redLayer = CALayer()
        redLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        redLayer.backgroundColor = UIColor.red.cgColor
        redLayer.contentsGravity = kCAGravityResizeAspect
        redLayer.contentsScale = UIScreen.main.scale
        redLayer.cornerRadius = 25
        redLayer.shadowColor = UIColor.black.cgColor
        redLayer.shadowOpacity = 0.8
        redLayer.shadowOffset = CGSize(width: 2, height: 2)
        redLayer.shadowRadius = 3
        view.layer.addSublayer(redLayer)
        
        // Create a blank animation using the keyPath "cornerRadius", the property we want to animate
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        // Set the starting value
        animation.fromValue = redLayer.cornerRadius
        // Set the completion value
        animation.toValue = 0
        // How may times should the animation repeat?
        animation.repeatCount = 10
        animation.speed = 0.5
        // Finally, add the animation to the layer
        redLayer.add(animation, forKey: "cornerRadius")
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()




