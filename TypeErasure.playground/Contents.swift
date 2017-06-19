//: Playground - noun: a place where people can play

import UIKit

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
