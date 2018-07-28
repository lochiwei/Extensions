// protocol Vector

/*
 TODO: Todo List
 (v) merge Vector2D, Vector3D, Vector4D into a universal Vector protocol?
 (v) vector subscript?
 (v) allow vector addition with different dimensions?
 (v) merge CGFloat, Float -> RealNumber (protocol)?
 (v) RealVector expressible by [RealNumber]
 
 History:
 - 2018.03.23: version 1.0
 - 2018.07.07: add Vector4D
 - 2018.07.20: 嘗試改成以 RealNumber 與 RealVector 為主
 */

import UIKit
import SceneKit

// MARK: - RealVector (protocol)

public protocol RealVector: ExpressibleByArrayLiteral {
    
    // must have dimension (of the vector space)
    static var dimension: Int { get }
    // can get/set coords of the vector
    var coordinates: [Float] { get set }
    
    // must have default init
    init()
    // can init with [RealNumber]
    init(arrayLiteral: RealNumber...)
    
    // must have vector addition, additive inverse, and scalar multiplication
    static func + (u:Self, v:Self) -> Self       // vector addition
    static prefix func - (u:Self) -> Self        // additive inverse
    static func * (a:RealNumber, v:Self) -> Self // scalar multiplication
    
    // can get/set coordinate by subscript index
    subscript(i:Int) -> Float { get set }
}

// MARK: - RealVector (default behaviors)

extension RealVector {
    
    // no default get/set coordinates
    // you have to implement them yourself ‼️
    
    // default subscript implementation
    public subscript(i:Int) -> Float {
        get { return coordinates[i] }
        set {
            var coords = self.coordinates
            coords[i] = newValue
            self.coordinates = coords
        }
    }
    
    // default u + v (vector addition)
    public static func + (u:Self, v:Self) -> Self {
        let coords = (0...(Self.dimension - 1)).map { u[$0] + v[$0] }
        var vec = Self.init()
        vec.coordinates = coords
        return vec
    }
    
    // default u + a (convenient vector addition)
    public static func + (u:Self, a:RealNumber) -> Self {
        let coords = (0...(Self.dimension - 1)).map { u[$0] + a.realValue }
        var vec = Self.init()
        vec.coordinates = coords
        return vec
    }
    
    // default -v (additive inverse)
    static public prefix func - (u:Self) -> Self {
        let coords = (0...(Self.dimension - 1)).map { -u[$0] }
        var vec = Self.init()
        vec.coordinates = coords
        return vec
    }
    
    // default * (scalar multiplication)
    public static func * (a:RealNumber, v:Self) -> Self {
        let coords = (0...(Self.dimension - 1)).map { a.realValue * v[$0] }
        var vec = Self.init()
        vec.coordinates = coords
        return vec
    }
    
    // default / (scalar division)
    public static func / (v:Self, a:RealNumber) -> Self {
        return (1/a.realValue) * v
    }
    
    // other default operations ( u-v, v*a, u+=v, u-=v, u*=a, ... )
    public static func - (u:Self, v:Self) -> Self { return u + (-v) }
    public static func - (u:Self, a:RealNumber) -> Self { return u + (-a) }
    public static func * (v:Self, a:RealNumber) -> Self { return a * v }
    
    public static func += (u:inout Self, v:Self) { u = u + v }
    public static func -= (u:inout Self, v:Self) { u = u - v }
    
    public static func += (u:inout Self, a:RealNumber) { u = u + a }
    public static func -= (u:inout Self, a:RealNumber) { u = u - a }
    public static func *= (u:inout Self, a:RealNumber) { u = u * a }
    public static func /= (u:inout Self, a:RealNumber) { u = u / a }
    
    // default init with [RealNumber]
    public init(arrayLiteral elements: RealNumber...) {
        let coords = elements.map { $0.realValue } + [Float](repeating: 0, count: Self.dimension)
        self.init()
        self.coordinates = coords
    }
    
    // default init with another RealVector
    public init<V:RealVector>(_ v:V) {
        self.init()
        self.coordinates = v.coordinates
    }
}


// vector operations of two (different types of) RealVector
// U + V -> U
public func + <U:RealVector, V:RealVector>(u:U, v:V) -> U {
    return u + U.init(v)
}

// U - V -> U
public func - <U:RealVector, V:RealVector>(u:U, v:V) -> U {
    return u - U.init(v)
}

// MARK: - RealVector (conforming types)

// SCNVector3
extension SCNVector3: RealVector {
    // 3-dimensional
    public static var dimension: Int { return 3 }
    // custom get/set coordinates
    public var coordinates: [Float] {
        get { return [x, y, z] }
        set {
            var coords = newValue + [0,0,0]
            x = coords[0]
            y = coords[1]
            z = coords[2]
        }
    }
}// end: SCNVector3: RealVector

// CGPoint
extension CGPoint: RealVector {
    // 2-dimensional
    public static var dimension: Int { return 2 }
    // custom get/set coordinates
    public var coordinates: [Float] {
        get { return [x, y].map { $0.realValue } }
        set {
            var coords = newValue + [0,0]
            x = CGFloat(coords[0])
            y = CGFloat(coords[1])
        }
    }
}// end: CGPoint

// CGVector
extension CGVector: RealVector {
    // 2-dimensional
    public static var dimension: Int { return 2 }
    // custom get/set coordinates
    public var coordinates: [Float] {
        get { return [dx, dy].map { $0.realValue } }
        set {
            var coords = newValue + [0,0]
            dx = CGFloat(coords[0])
            dy = CGFloat(coords[1])
        }
    }
}// end: CGVector

// CGSize
extension CGSize: RealVector {
    // 2-dimensional
    public static var dimension: Int { return 2 }
    // custiom get/set coordinates
    public var coordinates: [Float] {
        get { return [width, height].map { $0.realValue } }
        set {
            var coords = newValue + [0,0]
            width = CGFloat(coords[0])
            height = CGFloat(coords[1])
        }
    }
}

// SCNVector4
extension SCNVector4: RealVector {
    // 4-dimensional
    public static var dimension: Int { return 4 }
    // custom get/set coordinates
    public var coordinates: [Float] {
        get { return [x, y, z, w] }
        set {
            var coords = newValue + [0,0,0,0]
            x = coords[0]
            y = coords[1]
            z = coords[2]
            w = coords[3]
        }
        
    }
}// end: SCNVector4

// CGRect
extension CGRect: RealVector {
    // 4-dimensional
    public static var dimension: Int { return 4}
    // custom get/set coordinates
    public var coordinates: [Float] {
        get {
            return [origin.x, origin.y, width, height].map { $0.realValue }
        }
        set {
            var v = newValue + [0,0,0,0]
            origin = [v[0], v[1]]
            size = [v[2], v[3]]
        }
    }
}// end: CGRect
