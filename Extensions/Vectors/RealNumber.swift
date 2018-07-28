//
//  RealNumber.swift
//  Vectors
//
//  Created by pegasus on 2018/07/21.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

// MARK: - RealNumber (protocol)

public protocol RealNumber {
    var realValue: Float { get }
}

// MARK: - RealNumber (operations)

// -a (additive inverse)
public prefix func - (a:RealNumber) -> Float {
    return -a.realValue
}
// a + b (addition)
public func + <U:RealNumber, V:RealNumber>(a:U, b:V) -> Float {
    return a.realValue + b.realValue
}
// a - b (substraction)
public func - <U:RealNumber, V:RealNumber>(a:U, b:V) -> Float {
    return a.realValue - b.realValue
}
// a * b (multiplication)
public func * <U:RealNumber, V:RealNumber>(a:U, b:V) -> Float {
    return a.realValue * b.realValue
}
// a / b (division)
public func / <U:RealNumber, V:RealNumber>(a:U, b:V) -> Float {
    return a.realValue / b.realValue
}

// MARK: - RealNumber (conforming types)

extension Float: RealNumber { public var realValue: Float { return self } }
extension CGFloat: RealNumber { public var realValue: Float { return Float(self) } }
extension Double: RealNumber { public var realValue: Float { return Float(self) } }
extension Int: RealNumber { public var realValue: Float { return Float(self) } }
