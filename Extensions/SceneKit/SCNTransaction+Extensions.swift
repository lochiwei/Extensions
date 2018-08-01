//
//  SCNTransaction+Extensions.swift
//  Extensions
//
//  Created by pegasus on 2018/08/01.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import SceneKit

// MARK: - Animation
// -----------------

// Animation Transaction
// usage: run({...}, completion: {...}, duration: 0.5)
public func run( _ animation: (() -> Void), completion: (() -> Void)? = nil, duration: CFTimeInterval? = nil) {
    
    // begin transcation
    SCNTransaction.begin()
    SCNTransaction.animationDuration = duration ?? 0.25
    
    // setup completion block if necessary
    if let c = completion {
        SCNTransaction.completionBlock = c
    }
    
    // animate something
    animation()
    
    // commit transaction
    SCNTransaction.commit()
}
