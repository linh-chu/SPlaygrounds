import UIKit

class Character {
    var name: String
    var owner: String
    
    init() {
        name = "Frodo"
        owner = "Ben"
    }
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
    
    func random() -> Character {
        return Character(name: "Gollum", owner: "Hans")
    }
}

var characterArray: [Character] = []

let testchar = Character()
characterArray.append(testchar)
let random = testchar.random()
characterArray.append(random)

for character in characterArray {
    print(character.name)
}


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

