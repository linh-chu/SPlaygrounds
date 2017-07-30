//: Playground - noun: a place where people can play

import UIKit

/**************************************/
/* Cachable class from https://medium.com/compileswift/swift-world-type-erasure-5b720bc0318a */
/**************************************/

// The actual type to use for that associated type isn’t specified until the protocol is adopted
protocol Cachable {
    associatedtype CacheType
    
    func decode(_ data: Data) -> CacheType?
    func encode() -> Data?
}

extension String: Cachable {
    typealias CacheType = String
    func decode(_ data: Data) -> CacheType? {
        guard let string = String(data: data, encoding: String.Encoding.utf8) else {
            return nil
        }
        return string
    }
    func encode() -> Data? {
        return data(using: String.Encoding.utf8)
    }
}

class AnyCachable<T>: Cachable {
    private let _decode: (_ data: Data) -> T?
    private let _encode: () -> Data?
    
    init<U: Cachable>(_ cachable: U) where U.CacheType == T {
        _decode = cachable.decode
        _encode = cachable.encode
    }
    
    func decode(_ data: Data) -> T? {
        return _decode(data)
    }
    
    func encode() -> Data? {
        return _encode()
    }
}

struct CacheItem {
    let item: AnyCachable<Any>
    let expiryDate: Date
}

let cache: [AnyCachable<String>] = [AnyCachable("Hello"), AnyCachable("World")]

/**************************************/
/* View Controller */
/**************************************/

//typealias MyTuple<T> = (key: T, value: String)
//
//protocol BaseControllerDelegate {
//    associatedtype T
//    func didSelectData(_ myTuple: MyTuple<T>)
//}
//
//struct AnyBaseControllerDelegate<T>: BaseControllerDelegate {
//    private let _didSelectData: (_ myTuple: MyTuple<T>) -> Void
//    
//    init<Delegate: BaseControllerDelegate>(_ delegate: Delegate) where Delegate.T == T {
//        _didSelectData = delegate.didSelectData
//    }
//    
//    func didSelectData(_ myTuple: MyTuple<T>) {
//        return _didSelectData(myTuple)
//    }
//}
//
//class BaseController<T> {
//    var delegate: AnyBaseControllerDelegate<T>?
//    lazy var dataList = [MyTuple<T>]()
//}


