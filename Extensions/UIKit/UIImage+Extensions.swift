//
//  UIImage+Extensions.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

extension UIImage {
    
    // usage: image.crop(rect)
    public func crop(_ rect:CGRect) -> UIImage {
        
        // calculate the valid rect to crop
        let crop = rect.intersection(CGRect(origin: .zero, size: self.size))
        
        // return an empty image if crop region is out of the image's size
        guard !crop.isNull else { return UIImage() }
        
        // draw the cropped image
        let a = crop.minX
        let b = crop.minY
        let renderer = UIGraphicsImageRenderer(size:crop.size)
        
        let im = renderer.image { _ in
            self.draw(at: [-a, -b])
        }
        
        return im
    }// end: crop()
    
}// end: UIImage extension
