//: Playground - noun: a place where people can play

import UIKit

enum ColorName: String {
    case red, green, blue, aqua
}

enum CSSColor {
    case named(ColorName)
    case rgb(UInt8, UInt8, UInt8)
}

