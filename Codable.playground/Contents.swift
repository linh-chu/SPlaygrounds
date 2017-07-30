//: Codable - encoding and decoding object with nested dictionary

import UIKit

protocol OrderItem: Codable {
    var amount:Int{get set}
    var isPaid:Bool{get set}
}

struct ProductItem:OrderItem {
    var amount = 0
    var isPaid = false
    var price = 0.0
}

struct Order: Codable {
    var id:String = ""
    var sn:String = ""
    var items:[OrderItem] = []
    var createdAt:Int64 = 0
    var updatedAt:Int64 = 0
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.items = try container.decodeIfPresent([OrderItem].self, forKey: .items) ?? []
//    }
}

/*********************************/

//struct Person: Codable {
//    var name: String
//    var history: [Int: String]
//
//    init() {
//        self.name = "Name"
//        history = [0: "Test"]
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "Failed to decode name"
//        self.history = try container.decodeIfPresent([Int: String].self, forKey: .history) ?? [-1: "Failed to decode history"]
//    }
//}
//
//let person = Person()
//do {
//    let jsonData = try JSONEncoder().encode(person)
//
//    if let result = try? JSONDecoder().decode(Person.self, from: jsonData) {
//        print("\(result)\n")
//    }
//
//    let sampleDictionary: [String: Any] = ["history":[0: "Test"], "name": "Test"]
//    print(sampleDictionary)
//} catch {
//    print(error.localizedDescription)
//}
//
//extension KeyedDecodingContainer {
//    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
//        where T : Decodable {
//            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
//    }
//}

/*********************************/

//struct Foo: Codable {
//    var a: Int
//    var b: Int
//
//    init(a: Int, b: Int) {
//        self.a = a
//        self.b = b
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        a = try container.decodeIfPresent(Int.self, forKey: .a) ?? 0
//        b = try container.decodeIfPresent(Int.self, forKey: .a) ?? 0
//    }
//}
//
//let foo = Foo(a: 1, b: 2)
//let dict = foo


//let dict = try Decoder().container
    //JSONDecoder().decode([String: Int].self, from: foo)
//print(dict)




