//
//  CGContext+Extensions.swift
//  Extensions
//
//  Created by pegasus on 2018/08/04.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import UIKit

// extensions
extension CGContext {
    
    // usage: ctx.segment(pointA, pointB)
    public func segment(
        
        _ pointA:CGPoint,
        _ pointB:CGPoint,
        
        // optional parameters
        width:RealNumber? = nil,
        color:UIColor? = nil
        ) {
        
        // 1. save state
        saveGState()
        
        // 2. configure palette
        setLineWidth(CGFloat(width?.realValue ?? 1))  // stroke width: default = 1
        setStrokeColor( (color ?? .black).cgColor )   // stroke color: default = black
        
        // 3. design path
        beginPath()
        move(to:pointA)
        addLine(to:pointB)
        
        // 4. draw path
        strokePath()   // side effect: path is cleared ‼️
        
        // 5. restore state
        restoreGState()
    }
    
    // usage: ctx.polygon(points)
    public func polygon(
        
        _ points:[CGPoint],
        
        // optional parameters
        stroke:Bool? = nil,
        fill:Bool? = nil,
        blend mode:CGBlendMode? = nil,
        strokeWidth: RealNumber? = nil,
        strokeColor: UIColor? = nil,
        fillColor:UIColor? = nil
        ) {
        
        let n = points.count
        guard n > 2 else { return }
        
        // 1. save graphics state
        saveGState()
        
        // 2. configure graphics state
        let stroke = stroke ?? true
        let fill = fill ?? true
        setBlendMode(mode ?? .normal)                        //   blend mode: .normal
        setLineWidth(CGFloat(strokeWidth?.realValue ?? 1))   // stroke width: 1
        setStrokeColor((strokeColor ?? .black).cgColor)      // stroke color: black
        setFillColor((fillColor ?? .red).cgColor)            //   fill color: red
        
        // 3. construct path
        beginPath()
        move(to: points[0])
        for i in 1...(n-1) { addLine(to: points[i]) }
        closePath()
        
        // 4. draw
        if stroke && fill { drawPath(using: .fillStroke) }
        else if stroke { strokePath() }
        else if fill { fillPath() }
        //❓: is it necessary to clear the path if it's NOT drawn ?
        
        // 5. restore graphics state
        restoreGState()
        
    }// end: polygon()
    
    // usage: ctx.erase(polygon: points)
    public func erase(polygon points:[CGPoint]) {
        //❓: is the fill color important in this case ?
        polygon(points, stroke: false, blend: .clear)
    }
    
}// end: CGContext

