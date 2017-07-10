//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class Bezier {
    
    public static func withArrowFromPoint(startPoint:CGPoint,
                                          endPoint:CGPoint,
                                          tailWidth:CGFloat,
                                          headWidth:CGFloat,
                                          headLength:CGFloat) -> UIBezierPath {
        let kArrowPointCount = 7
        let length = CGFloat(hypotf(Float(endPoint.x) - Float(startPoint.x), Float(endPoint.y) - Float(startPoint.y)))
        
        
        var points = [CGPoint]()
        
        axisAlignedArrowPoints(points: &points, length: length, tailWidth: tailWidth, headWidth: headWidth, headLength: headLength)
        var transform = transformFor(startPoint: startPoint, endPoint: endPoint, length: length)
        
        let cgPath = CGMutablePath()
        
        //        cgPath.addLines(&transform, between: points, count: kArrowPointCount)
        
        cgPath.addLines(between: points, transform: transform)
        cgPath.closeSubpath()
        let uiPath = UIBezierPath(cgPath: cgPath)
        return uiPath
        
    }
    
    // ===================================================================================================
    
    private static func axisAlignedArrowPoints(points:inout [CGPoint],
                                               length:CGFloat,
                                               tailWidth:CGFloat,
                                               headWidth:CGFloat,
                                               headLength:CGFloat) {
        let tailLength = length - headLength
        
        points.append(CGPoint(x: 0, y: tailWidth/2))
        points.append(CGPoint(x: tailLength, y: tailWidth/2))
        points.append(CGPoint(x: tailLength, y: headLength/2))
        points.append(CGPoint(x: length, y: 0))
        points.append(CGPoint(x: tailLength, y: -headWidth/2))
        points.append(CGPoint(x: tailLength, y: -tailWidth/2))
        points.append(CGPoint(x: 0, y: -tailWidth/2))
        
    }
    
    // -----------------------------------------------------------------------------------------------------
    
    private static func transformFor(startPoint:CGPoint, endPoint:CGPoint, length:CGFloat) -> CGAffineTransform {
        let cosine = (endPoint.x - startPoint.x)/length
        let sine = (endPoint.y - startPoint.y)/length
        
        var myAffineTransform = CGAffineTransform()
        myAffineTransform.a = cosine
        myAffineTransform.b = sine
        myAffineTransform.c = -sine
        myAffineTransform.d = cosine
        myAffineTransform.tx = startPoint.x
        myAffineTransform.ty = startPoint.y
        
        return myAffineTransform
    }
    
    
    static func arrow(from start: CGPoint, to end: CGPoint, tailWidth: CGFloat, headWidth: CGFloat, headLength: CGFloat) -> UIBezierPath {
        let length = hypot(end.x - start.x, end.y - start.y)
        let tailLength = length - headLength
        
        func p(_ x: CGFloat, _ y: CGFloat) -> CGPoint { return CGPoint(x: x, y: y) }
        let points: [CGPoint] = [
            p(0, tailWidth / 2),
            p(tailLength, tailWidth / 2),
            p(tailLength, headWidth / 2),
            p(length, 0),
            p(tailLength, -headWidth / 2),
            p(tailLength, -tailWidth / 2),
            p(0, -tailWidth / 2)
        ]
        
        let cosine = (end.x - start.x) / length
        let sine = (end.y - start.y) / length
        let transform = CGAffineTransform(a: cosine, b: sine, c: -sine, d: cosine, tx: start.x, ty: start.y)
        
        let path = CGMutablePath()
        path.addLines(between: points, transform: transform )
        path.closeSubpath()
        return UIBezierPath(cgPath: path)
    }
}

class View: UIView {
    override func draw(_ rect: CGRect) {
        print("here")
        //        let arrow = Bezier.withArrowFromPoint(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 20), tailWidth: 10, headWidth: 25, headLength: 40)
        
        let arrow = Bezier.arrow(from: CGPoint(x: 100, y: 100), to: CGPoint(x: 200, y: 10), tailWidth: 10, headWidth: 25, headLength: 40)
        print(arrow)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = arrow.cgPath
        self.layer.addSublayer(shapeLayer)
    }
}

let view = View()
print("a")
view.backgroundColor = UIColor.white
view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
print("b")
//let shapeLayer = CAShapeLayer()
//shapeLayer.path = a.cgPath
//view.layer.addSublayer(shapeLayer)



PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true



