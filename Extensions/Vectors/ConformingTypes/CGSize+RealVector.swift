//
//  CGSize+RealVector.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

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
