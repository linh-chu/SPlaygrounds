//: Playground - noun: a place where people can play

import UIKit
import Foundation
import SpriteKit




private class SomeClass {
    public init(foo: String) {}
    public required init(bar: Bool) {}
}

private let one = SomeClass(foo: "a")
private let two = SomeClass(bar: true)



/***************************/
//class A {
//    var dataArray = [1, 2]
//    
//    public typealias PanCellToDeleteBlock = (_ indexPath:NSIndexPath) -> Void
//    
//    func test() {
//        let panCellToDeleteBlock: PanCellToDeleteBlock = { [weak self] indexPath in
//            self?.dataArray.remove(at: indexPath.row)
//        }
//    }
//}


/***************************/
//// Remove subrange
//var myArray = ["rahul","rahib","suhail","alex","siya"]
//let selectedIndex = 3
//myArray.removeSubrange(selectedIndex..<myArray.count)
//print(myArray)
//
//let tempName = "Hello"
//print(tempName.characters.last)

/***************************/
// Line control statement
//extension Int {
//    var isOdd: Bool {
////        #sourceLocation(file: "Foo.swift", line: 1)
//        return self & 1 == 1
//    }
//}
//print(2.isOdd)


/***************************/
//// Hex to UTF-8
//let bytes: [UInt8] = [0xE2, 0x80, 0x94]
//let value = String(bytes: bytes, encoding: String.Encoding.utf8)

/***************************/
//// Json
//func requestPost() {
//    
//    var request = URLRequest(url: URL(string: "https://oakkohost.000webhostapp.com/test.php")!)
//    request.httpMethod = "POST"
//    let postString = "numQue"
//    
//    request.httpBody = postString.data(using: .utf8)
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data, error == nil else {
////            print("error=\(error)")
//            return
//        }
//        var json: [Any]?
//        do {
//            // Get json from data
//            json = try JSONSerialization.jsonObject(with: data) as? [Any]
//        } catch {
//            print(error)
//        }
//        // Get item from json object
//        guard let item = json?.first as? [String: Any],
//            let _ = item["id"] as? [String: Any] else {
//                return
//        }
//    }
//    task.resume()
//}

/***************************/
//// Date converter
//func configure(){
//    let birthdayString = "10.30.96"
//    
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM.dd.yy"
//    
//    let today = Date()
//    let birthday = dateFormatter.date(from: birthdayString)
//    let calendar = Calendar(identifier: .gregorian)
//    
//    let ageComponent = calendar.dateComponents([.year], from: birthday!, to: today)
//    let age = ageComponent.year!
//    
//    print(birthday)
//    print("\(age)")
//    
//}

/***************************/
//// KVO
//let options : [NSObject : Bool] = [
//    kCVPixelBufferCGImageCompatibilityKey: true,
//    kCVPixelBufferCGBitmapContextCompatibilityKey: true]

