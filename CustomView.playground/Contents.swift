//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class CustomView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
                
        // Draw a switch
        let swt = UISwitch(frame: CGRect(x: 150, y: 150, width: 100, height: 100))
        swt.addTarget(self, action: #selector(switchClicked(_:)), for: .valueChanged)
        self.addSubview(swt)
        
        let sSubview = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width * 0.9, height: self.frame.height * 0.9))
        sSubview.backgroundColor = UIColor.purple // just for test, to make it visible
        sSubview.center = self.center // that s pretty easy!
        self.addSubview(sSubview)
        
        let sLabel = UILabel(frame: CGRect(x: 0, y: 0, width: sSubview.frame.width * 0.3, height: sSubview.frame.height * 0.2))
        sLabel.backgroundColor = UIColor.orange // just for test, to make it visible
        sLabel.center = CGPoint(x: sSubview.frame.size.width  / 2, y: sSubview.frame.size.height / 2)
        sLabel.text = "This label has to be centered!"
        sLabel.textAlignment = .center
        sLabel.numberOfLines = 0
        sSubview.addSubview(sLabel)
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        print("switch cliked")
    }
}

let containerView = CustomView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
PlaygroundPage.current.liveView = containerView
