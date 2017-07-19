/*
 //: Playground - SwiftProtocols: Protocol Oriented Programming
 https://www.raywenderlich.com/148448/introducing-protocol-oriented-programming
 
 Protocol extensions and default implementations may seem similar to using a base class or even abstract classes in other languages, but they offer a few key advantages in Swift:
    - Because types can conform to more than one protocol, they can be decorated with default behaviors from multiple protocols. Unlike multiple inheritance of classes which some programming languages support, protocol extensions do not introduce any additional state.
    - Protocols can be adopted by classes, structs and enums. Base classes and inheritance are restricted to class types.
 */


protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airspeedVelocity: Double {
        return 3 * flappyFrequency * flappyAmplitude
    }
}

struct Penguin: Bird {
    let name: String
}

struct SwiftBird: Bird, Flyable {
    var name: String { return "Swift \(version)" }
    let version: Double
    
    // Swift is FASTER every version!
    var airspeedVelocity: Double { return version * 1000.0 }
}

// Defines an extension on Bird that sets the default behavior for canFly to return true whenever the type is also Flyable
extension Bird {
    // Flyable birds can fly!
    var canFly: Bool { return self is Flyable }
}