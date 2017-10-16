//: Playground - noun: a place where people can play

import UIKit

//class Dog {
//    let company = "Cat"
//    lazy var toy: String = {
//        print(#function)
//        return "Mr Love " + self.company
//    }()
//    deinit {
//        print(#function)
//    }
//}
//
//
//print("Dog")
//var dog: Dog? = Dog()
//print("Dog")
//dog = Dog()
//dog?.toy
//dog = nil
//print("Exit")


class RetainCycle {
    var closure: (() -> Void)!
    var string = "Hello"
    
    init() {
//        closure = { [unowned self] in
        closure = {
            print(#function)
            self.string = "Hello, World!"
        }
    }
    
    deinit {
        print("D " + #function)
    }
}

//Initialize the class and activate the retain cycle.
var retainCycleInstance: RetainCycle? = RetainCycle()
retainCycleInstance?.closure() //At this point we can guarantee the captured self inside the closure will not be nil. Any further code after this (especially code that alters self's reference) needs to be judged on whether or not unowned still works here.
retainCycleInstance = nil


/**********************************/

/// Capture semantics when assigning a function to a block in Swift?

//class Button {
//    var wasTapped: () -> Void
//
//    init() {
//        wasTapped = {}
//    }
//}
//
//class ViewController {
//    let button: Button
//
//    func setUpButtonHandler() {
//        //button.wasTapped = { [weak self] in self?.buttonWasTapped() } // no retain cycle
//        //button.wasTapped = { self.buttonWasTapped() } // retain cycle
//        //button.wasTapped = buttonWasTapped // retain cycle
//    }
//
//    func buttonWasTapped() {
//        print("tapped!")
//    }
//
//    init() {
//        button = Button()
//        setUpButtonHandler()
//    }
//
//    deinit {
//        print("deinit")
//    }
//}
//
//func test() {
//    let vc = ViewController()
//    vc.button.wasTapped()
//}
//
//test()

