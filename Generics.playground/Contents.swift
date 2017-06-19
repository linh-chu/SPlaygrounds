//: Playground - noun: a place where people can play

import UIKit
import Foundation

public protocol OneDimensionalDataPoint {
    /// the y value
    var y: Double { get }
}

public protocol TwoDimensionalDataPoint: OneDimensionalDataPoint {
    /// the x value
    var x: Double { get }
}

public struct DataSet<Element: OneDimensionalDataPoint> {
    /// the entries that this dataset represents
    private var _values: [Element]
    //...implementation
}

extension DataSet: MutableCollection {
    public typealias Element = OneDimensionalDataPoint
    public typealias Index = Int
    
    public var startIndex: Index {
        return _values.startIndex
    }
    
    public var endIndex: Index {
        return _values.endIndex
    }
    
    public func index(after: Index) -> Index {
        return _values.index(after: after)
    }
    
    public subscript(position: Index) -> Element {
        get{ return _values[position] }
        set{ self._values[position] = newValue }
    }
}

extension DataSet where Element: TwoDimensionalDataPoint {
    public mutating func calcMinMaxX(entry e: Element) {
        if e.x < _xMin {
            _xMin = e.x
        }
        if e.x > _xMax {
            _xMax = e.x
        }
    }
}