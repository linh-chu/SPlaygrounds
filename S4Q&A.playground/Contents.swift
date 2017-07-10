//: A UIKit based Playground to present user interface
  
import UIKit
import PlaygroundSupport
import CoreData

class myViewController : UIViewController {

    override func loadView() {
        let view = UIView()

        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .white
        
        view.addSubview(label)
        self.view = view
    }
   
}


//public extension NSFetchedResultsController
//{
//    public func sectionCount() -> Int
//    {
//        guard let `sections` = NSFetchedResultsController.section(self) else { return 0 }
//        
////        if sections == nil
////        {
////            return 0
////        }
//        
//        return sections.count
//    }
//}
//
//PlaygroundPage.current.liveView = myViewController()

