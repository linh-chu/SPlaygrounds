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

enum UnladenSwallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
        case .african:
            return "African"
        case .european:
            return "European"
        case .unknown:
            return "What do you mean? African or European?"
        }
    }
    
    var airspeedVelocity: Double {
        switch self {
        case .african:
            return 10.0
        case .european:
            return 9.9
        case .unknown:
            fatalError("You are thrown from the bridge of death!")
        }
    }
}

// Override the default behavior to make unkown swallow's canFly to return false
extension UnladenSwallow {
    var canFly: Bool { return self != .unknown }
}

// Extend CustomStringConvertible protocol to have a default behavior where Bird type is used
extension CustomStringConvertible where Self: Bird {
    var discription: String {
        return canFly ? "I can fly" : "Guess I’ll just sit here :["
    }
}


/* Off to the Races - retroactive modeling */

class Motorcycle {
    init(name: String) {
        self.name = name
        speed = 200
    }
    var name: String
    var speed: Double
}

protocol Racer {
    var speed: Double { get }  // speed is the only thing racers care about
}

extension FlappyBird: Racer {
    var speed: Double {
        return airspeedVelocity
    }
}

extension SwiftBird: Racer {
    var speed: Double {
        return airspeedVelocity
    }
}

extension Penguin: Racer {
    var speed: Double {
        return 42  // full waddle speed
    }
}

extension UnladenSwallow: Racer {
    var speed: Double {
        return canFly ? airspeedVelocity : 0
    }
}

extension Motorcycle: Racer {}

let racers: [Racer] =
    [UnladenSwallow.african,
     UnladenSwallow.european,
     UnladenSwallow.unknown,
     Penguin(name: "King Penguin"),
     SwiftBird(version: 3.0),
     FlappyBird(name: "Felipe", flappyAmplitude: 3.0, flappyFrequency: 20.0),
     Motorcycle(name: "Giacomo")
]

// Top speed
func topSpeed(of racers: [Racer]) -> Double {
    return racers.max(by: { $0.speed < $1.speed })?.speed ?? 0
}
topSpeed(of: racers) // 3000

// More generic - This method works for any Sequence type including array slices
func topSpeed<RacerType: Sequence>(of racers: RacerType) -> Double where RacerType.Iterator.Element == Racer {
    return racers.max(by: { $0.speed < $1.speed })?.speed ?? 0.0
}
topSpeed(of: racers[1...3]) // 42

// Making it More Swifty
extension Sequence where Self.Iterator.Element == Racer {
    func topSpeed() -> Double {
        return self.max(by: { $0.speed < $1.speed })?.speed ?? 0.0
    }
}
racers.topSpeed()        // 3000
racers[1...3].topSpeed() // 42


/* Protocol Comparators */

protocol Score: Equatable, Comparable {
    var value: Int { get }
}

struct RacingScore: Score {
    let value: Int
    
    static func ==(lhs: RacingScore, rhs: RacingScore) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func <(lhs: RacingScore, rhs: RacingScore) -> Bool {
        return lhs.value < rhs.value
    }
}
RacingScore(value: 150) >= RacingScore(value: 130)  // true