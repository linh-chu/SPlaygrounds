//: Playground - noun: a place where people can play

import SpriteKit
import PlaygroundSupport
import GameplayKit

//// Create the SpriteKit View
//let view = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//
//// Create the scene and add it to the view
//let scene = SKScene(size: CGSize(width: 500, height: 500))
//scene.scaleMode = SKSceneScaleMode.aspectFit
//scene.backgroundColor = .white
//view.presentScene(scene)
//
//// Add a red box to the scene
//let redBox = SKSpriteNode(color: SKColor.red, size: CGSize(width: 200, height: 200))
//redBox.position = CGPoint(x: 250, y: 250)
//redBox.run(SKAction.repeatForever(SKAction.rotate(byAngle: -5, duration: 5)))
//scene.addChild(redBox)
//
//// Show in assistant editor
//PlaygroundPage.current.liveView = view
//PlaygroundPage.current.needsIndefiniteExecution = true

/*******************************************/

class GameScene: SKScene {
    let minDist: CGFloat = 60 //The minimum distance between one point and the next
    
    var points: [CGPoint] = []
    var circleNodes: [SKShapeNode] = []
    
    override func didMove(to view: SKView) {
        
        
    }
    
    func getDistance (fromPoint: CGPoint, toPoint: CGPoint) -> CGFloat {
        
        let deltaX = fromPoint.x - toPoint.x
        let deltaY = fromPoint.y - toPoint.y
        
        let deltaXSquared = deltaX*deltaX
        let deltaYSquared = deltaY*deltaY
        
        return sqrt(deltaXSquared + deltaYSquared) //Return the distance
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
        self.removeAllChildren()
        
        //The first time the user touches, we need to place a point and mark that as the firstCircleNode
        print(pos)
        points.append(pos)
        //allPoints.append(pos)
        
        let firstCircleNode = SKShapeNode(circleOfRadius: 5.0)
        
        firstCircleNode.fillColor = UIColor.blue
        
        firstCircleNode.strokeColor = UIColor.blue
        
        firstCircleNode.position = pos
        
        circleNodes.append(firstCircleNode)
        
        self.addChild(firstCircleNode)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
        let lastIndex = points.count - 1 //The index of the last recorded point
        
        let distance = getDistance(fromPoint: points[lastIndex], toPoint: pos)
        //vector_distance(vector_double2(Double(points[lastIndex].x), Double(points[lastIndex].y)), vector_double2(Double(pos.x), Double(pos.y))) //The distance between the user's finger and the last placed circleNode
        
        print(distance)
        if distance >= minDist {
            points.append(pos)
            
            //Add a box to that point
            let newCircleNode = SKShapeNode(circleOfRadius: 5.0)
            
            newCircleNode.fillColor = UIColor.red
            
            newCircleNode.strokeColor = UIColor.red
            
            newCircleNode.position = pos
            
            circleNodes.append(newCircleNode)
            
            self.addChild(newCircleNode)
            
        }
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        //When the user has finished drawing a circle:
        
        circleNodes[circleNodes.count-1].fillColor = UIColor.purple //Make the last node purple
        
        circleNodes[circleNodes.count-1].strokeColor = UIColor.purple
        
        //Calculate the distance between the first placed node and the last placed node:
        let distance = getDistance(fromPoint: points[0], toPoint: points[points.count-1])
        //vector_distance(vector_double2(Double(points[0].x), Double(points[0].y)), vector_double2(Double(points[points.count - 1].x), Double(points[points.count - 1].y)))
        
        if distance <= minDist { //If the distance is closer than the minimum distance
            
            print("Successful circle")
            
        } else { //If the distance is too far
            
            print("Failed circle")
            
        }
        
        points = []
        circleNodes = []
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.touchMoved(toPoint: touches.first!.location(in: self))
        
//        for t in touches {
//            self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}


// Create the SpriteKit View
let view = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

// Create the scene and add it to the view
let scene = GameScene(size: CGSize(width: 500, height: 500))
scene.scaleMode = SKSceneScaleMode.aspectFit
scene.backgroundColor = .white
view.presentScene(scene)

// Show in assistant editor
PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true
