import UIKit

let array1: Set = Set(1...99).filter({$0 % 2 == 1})
let array2: Array = Set(1...99).filter({$0 % 2 == 1})
print(array1)
print(array2)

//class Character {
//    var name: String
//    var owner: String
//
//    init() {
//        name = "Frodo"
//        owner = "Ben"
//    }
//
//    init(name: String, owner: String) {
//        self.name = name
//        self.owner = owner
//    }
//
//    func random() -> Character {
//        return Character(name: "Gollum", owner: "Hans")
//    }
//}
//
//var characterArray: [Character] = []
//
//let testchar = Character()
//characterArray.append(testchar)
//let random = testchar.random()
//characterArray.append(random)
//
//for character in characterArray {
//    print(character.name)
//}


//struct MyCharacter {
//    var name: String
//    var owner: String
//
//    init() {
//        name = "Frodo"
//        owner = "Ben"
//    }
//
//    mutating func random() {
//        name = "Gollum"
//        owner = "Hans"
//    }
//}
//
//var myArray: [MyCharacter] = []
//
//var csVal = MyCharacter()
//myArray.append(csVal)
//csVal.random()
//myArray.append(csVal)
//
//for character in myArray {
//    print(character.name)
//}

