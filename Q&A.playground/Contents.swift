//: Playground - noun: a place where people can play

import UIKit
import Foundation


infix operator ???: NilCoalescingPrecedence

public func ???<T>(optional: T?, defaultValue: @autoclosure () -> String) -> String {
    switch optional {
    case let value?: return String(describing: value)
    case nil: return defaultValue()
    }
}

var someValue: Int? = 5
print("The value is \(someValue ??? "unknown")")

/***********/

infix operator ?> : NilCoalescingPrecedence
// @autoclosure will wrap the `rhs` closure into a closure -> `{ print("executing") }`
func ?> (lhs: Any?, rhs: () -> Any) {
    if lhs == nil {
        print("lhs is nil")
        rhs()
    }
}

var some: Int? = nil
some ?> { print("executed") }


//class Animal {
//    var id = 6 // Will be generated
//    let hasFourLegs = true
//    let numberOfEyes = 2
//    // ... //
//
//    init(id: Int) {
//        self.id = id
//    }
//    
////    static var squirrel: Animal { return .init() }
////    static var dolphin: Animal  { return .init() }
////    static var puma: Animal { return .init() }
////    static var deer: Animal { return .init() }
//}
//
//extension Animal: Equatable {
//    public static func ==(lhs: Animal, rhs: Animal) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
//
//enum AnimalKind {
//    case squirrel
//    case dolphin
//    case puma
//    case deer
//}
//
//extension AnimalKind: RawRepresentable {
//    typealias RawValue = Animal
//    
//    init?(rawValue: RawValue) {
//        switch rawValue.id {
//        case 1: self = .squirrel
//        case 2: self = .dolphin
//        case 3: self = .puma
//        case 4: self = .deer
//        default: return nil
//        }
//    }
//    
//    var rawValue: RawValue {
//        switch self {
//        case .squirrel: return Animal(id: 1)
//        case .dolphin: return Animal(id: 2)
//        case .puma: return Animal(id: 3)
//        case .deer: return Animal(id: 4)
//        }
//    }
//    
//}
//
//class AnimalHelper {
//    func loadAnimal(_ animal: AnimalKind) {
//        
//        // Direct comparison works
//        if animal == .squirrel || animal == .deer {
//            loadGrass()
//        } else if animal == .dolphin {
//            return // not implemented
//        } else {
//            loadMeat()
//        }
//        
//        let b = Animal(id: 1)
//        if animal.rawValue == b {
//            print("y")
//        } else {
//            print("n")
//        }
//        
//        // Specifying the type explicitly also works
////        switch animal {
////        case Animal.squirrel, Animal.deer: loadGrass()
////        case Animal.dolphin: return // not implemented
////        default: loadMeat()
////        }
//        
//        // Doesn't compile
////        switch animal {
////        case .squirrel, .deer: loadGrass()
////        case .dolphin: return // not implemented
////        default: loadMeat()
////        }
//    }
//    
//    func loadGrass() {}
//    func loadMeat() {}
//}
//
//let animalHelper = AnimalHelper()
//animalHelper.loadAnimal(.squirrel)






//public protocol PriorityQueuable: Hashable {
//    associatedtype KeyType: Comparable
//    associatedtype ValueType: Comparable
//    
//    var key: KeyType { get set }
//    var value: ValueType { get set }
//}
//
//protocol Heap {
//    associatedtype T: Comparable
//    
//    var data: [T] { get set }
//    
//    mutating func heapify(parentIndex: Int)
//}

//protocol PriorityQueue<T> {
//    associatedtype Item: Heap
//    
//    //FIXME: doesn't allow me to do that. Why?
//    var heap<T: Head> where T = Head.T  { get set }
//    
//    // doesn't compile as well
//    // var heap: Heap { get set }
//}

//
//struct MyClass: Heap {
//    typealias T = Int
//    
//    var data: [T] = []
//    mutating func heapify(parentIndex: Int) {
//        data.append(parentIndex)
//        print(data)
//    }
//}
//
//var a = MyClass()
//a.heapify(parentIndex: 12)




//struct UserInputConfig {
//}
//
//struct UserInput {
//    enum State {
//        case unrestricted
//        case restricted(because: WarningType)
//        
//        enum WarningType {
//            case offline
//            case forbidden
//        }
//    }
//    
//    var config: UserInputConfig?
//    var state: State = .unrestricted
//    
//    func isConfigured() -> Bool {
//        // Arbitrary checks about the config...
//        return true
//    }
//}



//if case .restricted = userInput.state {
//    return 1
//} else if userInput.isConfigured() {
//    return 1
//} else {
//    return 0
//}

//func enumValues<S: Sequence>(from sequence: S) -> [S.Iterator.Element.RawValue]
//    where S.Iterator.Element: RawRepresentable {
//        
//        return sequence.map { $0.rawValue }
//}



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

