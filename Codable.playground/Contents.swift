//: Codable - encoding and decoding object with nested dictionary

import UIKit

struct Person: Codable {
    var name: String
    var history: [Int: String]
    
    init() {
        self.name = "Name"
        history = [0: "Test"]
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "Failed to decode name"
        self.history = try container.decodeIfPresent([Int: String].self, forKey: .history) ?? [-1: "Failed to decode history"]
    }
}

let person = Person()
do {
    let jsonData = try JSONEncoder().encode(person)
    
    if let result = try? JSONDecoder().decode(Person.self, from: jsonData) {
        print("\(result)\n")
    }
    
    let sampleDictionary: [String: Any] = ["history":[0: "Test"], "name": "Test"]
    print(sampleDictionary)
} catch {
    print(error.localizedDescription)
}

extension KeyedDecodingContainer {
    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
        where T : Decodable {
            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}



