//: Playground - noun: a place where people can play

import UIKit
import Foundation

func loopManager(printable: String) {
    for i in 0...3 {
        doABC(printable: String(i) + ", " + printable)
//        sleep(1)
    }
}

func doABC(printable: String) {
    print(printable)
}

// 1
let queue1 = DispatchQueue(label: "com.example.appname", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .inherit, target: DispatchQueue.main)

DispatchQueue.main.async {
    loopManager(printable: "1A") // 1A
    loopManager(printable: "1B") // 1B
}

// 2
DispatchQueue.global().async {
    loopManager(printable: "2A") // 2A
}



