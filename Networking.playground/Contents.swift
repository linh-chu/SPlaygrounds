//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let url = URL(string: "http://localhost:8000/episodes.json")!

//let url = URL(string: "https://api.projectoxford.ai/luis/v1/application?id=0aef8e3e-157f-4c07-abd5-dceca3b30815&subscription-key=66307cc5f4b34f68be8ae4db2e8d6593&q=booking")!

struct Resource<A> {
    let url: URL
    // The function tries to convert some data into the result
    let parse: (Data) -> A? // return type is optional because the parsing might fail
}

let episodesResource = Resource<Data>(url: url) { (data) in
    return data
}

final class Webservice {
    func load<A>(resource: Resource<A>, completion: @escaping (A?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
            if data != nil {
                let result = resource.parse(data!)
                completion(result)
            } else {
                print(resource.url)
                completion(nil)
            }
        }.resume()
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

Webservice().load(resource: episodesResource) { (result) in
    print(result)
}




