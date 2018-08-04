//
//  CGVector+RealVector.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

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
