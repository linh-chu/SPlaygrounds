/*
 Getting to Know Enums, Structs and Classes 
 Source: https://www.raywenderlich.com/119881/enums-structs-and-classes-in-swift
 */

import UIKit
import Foundation
import WebKit
import PlaygroundSupport

URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)

/********************************/
/* Enum */
/********************************/

enum CSSColor {
    case named(ColorName)
    case rgb(UInt8, UInt8, UInt8)
}

// Enums, just like the other named types, can adopt protocols. We tell Swift how to convert CSSColor to String by implementing the description computed property. The extension style is nice because it makes what we define in order to conform to a given protocol fully explicit.
extension CSSColor: CustomStringConvertible {
    var description: String {
        switch self {
        case .named(let colorName):
            return colorName.rawValue
        case .rgb(let red, let green, let blue):
            return String(format: "#%02X%02X%02X", red, green, blue)
        }
    }
}

// Initializers with an Enum
extension CSSColor {
    init(gray: UInt8) {
        self = .rgb(gray, gray, gray)
    }
}

// Namespaces with Enum
extension CSSColor {
    // As ColorName is only ever used in the context of a CSSColor, move ColorName into an extension on CSSColor. Now ColorName is tucked away, and the inner type is defined on CSSColor.
    enum ColorName: String {
        case red, green, blue, aqua, yellow, black, white, teal
    }
}

let color1 = CSSColor.named(.aqua)
let color3 = CSSColor(gray: 0xaa)
print(color1)

// Encapsulate related operations. Since the Math enum contains no cases, and it’s illegal to add new cases in an extension, it can never be instantiated. You’ll never be able to accidentally misuse Math as a variable or parameter
enum Math {
    static let phi = 1.6180339887498948482 // golden mean
}

/********************************/
/* Struct */
/********************************/

protocol Drawable {
    func draw(with context: DrawingContext)
}

protocol DrawingContext {
    func draw(_ circle: Circle)
    func draw(_ rectangle: Rectangle)
    // more primitives will go here ...
}

struct Circle : Drawable {
    var strokeWidth = 5 // The width of the line
    var strokeColor = CSSColor.named(.red)
    var fillColor = CSSColor.named(.yellow)
    var center = (x: 80.0, y: 160.0)
    var radius = 60.0
    
    // Adopting the Drawable protocol
    func draw(with context: DrawingContext) {
        context.draw(self)
    }
}

struct Rectangle : Drawable {
    var strokeWidth = 5
    var strokeColor = CSSColor.named(.teal)
    var fillColor = CSSColor.named(.aqua)
    var origin = (x: 110.0, y: 10.0)
    var size = (width: 100.0, height: 130.0)
    
    func draw(with context: DrawingContext) {
        context.draw(self)
    }
}

// A class that wraps a private array of command strings
final class SVGContext : DrawingContext {
    
    private var commands: [String] = []
    
    var width = 250
    var height = 250
    
    func draw(_ circle: Circle) {
        commands.append("<circle cx='\(circle.center.x)' cy='\(circle.center.y)\' r='\(circle.radius)' stroke='\(circle.strokeColor)' fill='\(circle.fillColor)' stroke-width='\(circle.strokeWidth)'  />")
    }
    
    func draw(_ rectangle: Rectangle) {
        commands.append("<rect x='\(rectangle.origin.x)' y='\(rectangle.origin.y)' width='\(rectangle.size.width)' height='\(rectangle.size.height)' stroke='\(rectangle.strokeColor)' fill='\(rectangle.fillColor)' stroke-width='\(rectangle.strokeWidth)' />")
    }
    
    var svgString: String {
        var output = "<svg width='\(width)' height='\(height)'>"
        for command in commands {
            output += command
        }
        output += "</svg>"
        return output
    }
    
    var htmlString: String {
        return "<!DOCTYPE html><html><body>" + svgString + "</body></html>"
    }
}

struct SVGDocument {
    var drawables: [Drawable] = []
    
    var htmlString: String {
        let context = SVGContext()
        for drawable in drawables {
            drawable.draw(with: context)
        }
        return context.htmlString
    }
    
    mutating func append(_ drawable: Drawable) {
        drawables.append(drawable)
    }
}


var document = SVGDocument()

let rectangle = Rectangle()
document.append(rectangle)

let circle = Circle()
document.append(circle)

let htmlString = document.htmlString
print(htmlString)

let view = WKWebView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
view.loadHTMLString(htmlString, baseURL: nil)
PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

// Retroactive modeling
extension Circle {
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    
    // Example of getter-only computed properties
    var area: Double {
        return radius * radius * Double.pi
    }
    var perimeter: Double {
        return 2 * radius * Double.pi
    }
}

extension Rectangle {
    var area: Double {
        return size.width * size.height
    }
    var perimeter: Double {
        return 2 * (size.width + size.height)
    }
}

protocol ClosedShape {
    var area: Double { get }
    var perimeter: Double { get }
}

extension Circle: ClosedShape {}
extension Rectangle: ClosedShape {}

// Computes the total perimeter of an array of models (any mix of structs, enums, classes) that adopt the ClosedShape protocol
func totalPerimeter(_ shapes: [ClosedShape]) -> Double {
    return shapes.reduce(0, { $0 + $1.perimeter })
}
totalPerimeter([circle, rectangle])

/********************************/
/* UIGraphicsImageRenderer to render an image */
/********************************/
//func drawImage(with string: String) -> UIImage {
//    // Create a renderer at the correct size
//    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 350, height: 350))
//    
//    let image = renderer.image { context in
//        // Define a paragraph style that aligns text to the center
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .center
//        
//        // Create an attributes dictionary containing that paragraph style, and also a font
//        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 35)!, NSParagraphStyleAttributeName: paragraphStyle]
//        
//        // Draw a string to the screen using the attributes dictionary
//        string.draw(with: CGRect(x: 32, y: 32, width: 100, height: 50), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
//        
//        // Rotate the context
//        //            context.cgContext.rotate(by: 30)
//        
//        // Load an image from the project and draw it to the context
////        let myImage = UIImage(named: "my_logo")
////        myImage?.draw(at: CGPoint(x: 10, y: 10))
//    }
//    
//    return image
//}
