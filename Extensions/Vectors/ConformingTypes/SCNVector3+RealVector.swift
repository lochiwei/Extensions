//
//  SCNVector3+RealVector.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import SceneKit

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

