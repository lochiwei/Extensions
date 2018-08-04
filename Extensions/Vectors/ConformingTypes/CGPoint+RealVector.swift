//
//  CGPoint+RealVector.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

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
