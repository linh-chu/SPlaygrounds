//: Playground - noun: a place where people can play

import UIKit

enum ColorName: String {
    case red, green, blue, aqua
}

enum CSSColor {
    case named(ColorName)
    case rgb(UInt8, UInt8, UInt8)
}




/********************************/
/* UIGraphicsImageRenderer to render an image */
/********************************/
func drawImage(with string: String) -> UIImage {
    // Create a renderer at the correct size
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 350, height: 350))
    
    let image = renderer.image { context in
        // Define a paragraph style that aligns text to the center
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // Create an attributes dictionary containing that paragraph style, and also a font
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 35)!, NSParagraphStyleAttributeName: paragraphStyle]
        
        // Draw a string to the screen using the attributes dictionary
        string.draw(with: CGRect(x: 32, y: 32, width: 100, height: 50), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        // Rotate the context
        //            context.cgContext.rotate(by: 30)
        
        // Load an image from the project and draw it to the context
//        let myImage = UIImage(named: "my_logo")
//        myImage?.draw(at: CGPoint(x: 10, y: 10))
    }
    
    return image
}
