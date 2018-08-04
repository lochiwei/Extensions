//
//  CGRect+RealVector.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

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
