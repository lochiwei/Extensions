//
//  UIView+Toys.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

extension UIView {
    
    // draw an image and put it in a UIImageView, then add to self
    // usage: view.drawImageView(size: imageSize, configure: {(imgv) in ... }, actions: {(_) in ... })
    public func drawImageView(
        
        // parameters:
        // -----------
        
        // size of the image (inherited by image view)
        size s:CGSize,
        // set the image view's origin (optional)
        origin:CGPoint? = nil,
        // configure the image view if necessary (optional)
        configure: ((UIImageView) -> Void)? = nil,
        // actions to draw the image
        actions:UIGraphicsImageDrawingActions
        ) {
        
        // drawing actions:
        // ----------------
        
        // draw image
        let render = UIGraphicsImageRenderer(size:s)
        let im = render.image(actions: actions)
        
        // put image in image view, add to self
        let imv = UIImageView(image: im)
        if let o = origin { imv.frame.origin = o }
        if let config = configure { config(imv) }
        self.add(imv)
        
    }// end: drawImageView()
    
}// end: UIView extension
