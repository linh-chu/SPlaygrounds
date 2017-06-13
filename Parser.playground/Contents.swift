//: Playground - noun: a place where people can play

// String Unicode to UTF8
//let hearts = "💘 ♥︎ Hearts"
//if let i = hearts.characters.index(of: " ") {
//    print(hearts.distance(from: hearts.startIndex, to: i))
//    let j = i.samePosition(in: hearts.utf8)
//    print(Array(hearts.utf8.prefix(upTo: j)))
//}


// Parser
struct Parser<A> { // A is a generic parameter
    typealias Stream = String.CharacterView
    // Declare a function: parse
    let parse: (Stream) -> (A, Stream)?
}






