//
//  SCNVector4+RealVector.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import SceneKit

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
