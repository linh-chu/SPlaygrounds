//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
//import XCPlayground

//let url = URL(string: "http://localhost:8000/episodes.json")!
//
////let url = URL(string: "https://api.projectoxford.ai/luis/v1/application?id=0aef8e3e-157f-4c07-abd5-dceca3b30815&subscription-key=66307cc5f4b34f68be8ae4db2e8d6593&q=booking")!
//
//struct Resource<A> {
//    let url: URL
//    // The function tries to convert some data into the result
//    let parse: (Data) -> A? // return type is optional because the parsing might fail
//}
//
//let episodesResource = Resource<Data>(url: url) { (data) in
//    return data
//}
//
//final class Webservice {
//    func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
//        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
//            if data != nil {
//                let result = resource.parse(data!)
//                completion(result)
//            } else {
//                print(resource.url)
//                completion(nil)
//            }
//        }.resume()
//    }
//}
//
//PlaygroundPage.current.needsIndefiniteExecution = true
//
//Webservice().load(resource: episodesResource) { (result) in
//    print(result)
//}

/*****************************************/
/* Completion closure */
/*****************************************/


func load(completion: @escaping (NSDictionary) -> ()) {
    let url = URL(string: "http://www.cbr-xml-daily.ru/daily_json.js")
    var dict = NSDictionary()
    
    PlaygroundPage.current.needsIndefiniteExecution = true
    URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
    
    let task = URLSession.shared.dataTask(with: url!) { data, response, error in
        guard error == nil else {
            print(error!)
            return
        }
        guard let data = data else {
            print("Data is empty")
            return
        }
        
        dict = try! JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
//        print("first print\(dict)")
        
        // Here is when you finish loading data
        completion(dict)
    }
    
    task.resume()
//    print("second \(dict)")
}

load(completion: {
    print("My data: \($0)" )
})





