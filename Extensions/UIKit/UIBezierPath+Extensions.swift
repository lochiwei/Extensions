import UIKit

// extensions
extension UIBezierPath {
    
    // MARK: - Palette
    
    public struct Palette {
        
        // inner structures
        public struct Stroke {
            var isDrawn:Bool  = true
            var width:CGFloat = 1
            var color:UIColor = .black
        }
        
        public struct Fill {
            var isDrawn:Bool  = true
            var color:UIColor = .red
        }
        
        // palette properties
        var stroke:Stroke      = Stroke()
        var   fill:Fill        = Fill()
        var  blend:CGBlendMode = .normal
        var  alpha:CGFloat     = 1
        
        // initializers
        init(
            stroke:Bool? = nil,
            fill:Bool? = nil,
            strokeWidth: RealNumber? = nil,
            strokeColor: UIColor? = nil,
            fillColor:UIColor? = nil,
            blend:CGBlendMode? = nil,
            alpha: RealNumber? = nil
            ) {
            
            // prepare Palette.Stroke
            let strokeDrawn = stroke ?? true
            let strokeWidth = CGFloat(strokeWidth?.realValue ?? 1)
            let strokeColor = strokeColor ?? .black
            
            // prepare palette fill
            let fillDrawn = fill ?? true
            let fillColor = fillColor ?? .red
            
            // init self
            self.stroke = Stroke(isDrawn: strokeDrawn, width: strokeWidth, color: strokeColor)
            self.fill = Fill(isDrawn: fillDrawn, color: fillColor)
            self.blend = blend ?? .normal
            self.alpha = CGFloat(alpha?.realValue ?? 1)
        }//end: init()
        
    }//end: Palette
    
    
    
    
    // MARK: - Instance Methods
    // ------------------------
    
    // usage: path.draw(with: palette)
    public func draw(with palette:Palette? = nil) {
        
        // provide default palette if none is passed in
        let p = palette ?? Palette()
        
        // fill
        if p.fill.isDrawn {
            p.fill.color.setFill()
            self.fill(with: p.blend, alpha: p.alpha)
        }
        
        // stroke
        if p.stroke.isDrawn {
            p.stroke.color.setStroke()
            self.lineWidth = p.stroke.width
            self.stroke(with: p.blend, alpha: p.alpha)
        }
        
    }//end: draw()
    
    public func strokeOnly(
        // stroke parameters (optional)
        // ----------------------------
        width:RealNumber? = nil,
        color:UIColor? = nil,
        blend: CGBlendMode? = nil,
        alpha: RealNumber? = nil
        ) {
        
        // 1. configure palette
        //    stroke only => fill = false
        let palette = Palette(fill: false, strokeWidth: width, strokeColor: color, blend: blend, alpha: alpha)
        
        // 2. draw path
        self.draw(with: palette)
    }
    
    public func strokeOrFill(
        // stroke & fill parameters (optional)
        // -----------------------------------
        
        stroke:Bool? = nil,
        fill:Bool? = nil,
        
        strokeWidth: RealNumber? = nil,
        strokeColor: UIColor? = nil,
        fillColor:UIColor? = nil,
        
        blend:CGBlendMode? = nil,
        alpha: RealNumber? = nil
        ) {
        
        // 1. configure palette
        let palette = Palette(stroke: stroke, fill: fill, strokeWidth: strokeWidth, strokeColor: strokeColor, fillColor: fillColor, blend: blend, alpha: alpha)
        
        // 2. draw path
        self.draw(with: palette)
    }
    
    
    // MARK: - Class Methods
    // ---------------------
    
    /// segment
    /// usage: UIBezierPath.segment(pointA, pointB)
    public static func segment(
        
        _ pointA:CGPoint,
        _ pointB:CGPoint,
        
        // stroke parameters (optional)
        // ----------------------------
        width:RealNumber? = nil,
        color:UIColor? = nil,
        blend: CGBlendMode? = nil,
        alpha: RealNumber? = nil
        ) {
        
        // 1. construct path
        let path = UIBezierPath()
        path.move(to:pointA)
        path.addLine(to:pointB)
        
        // 2. draw path
        path.strokeOnly(width: width, color: color, blend: blend, alpha: alpha)
    }
    
    // usage: UIBezierPath.polygon(points)
    public static func polygon(
        
        _ points:[CGPoint],
        
        // optional parameters
        // -------------------
        
        stroke:Bool? = nil,
        fill:Bool? = nil,
        
        strokeWidth: RealNumber? = nil,
        strokeColor: UIColor? = nil,
        fillColor:UIColor? = nil,
        
        blend:CGBlendMode? = nil,
        alpha: RealNumber? = nil
        ) {
        
        // 0. check if it is a polygon
        let n = points.count
        guard n > 2 else {
            print("UIBezierPath.polygon(): number of vertices < 3.")
            return
        }
        
        // 1. construct path
        let path = UIBezierPath()
        path.move(to: points[0])
        for i in 1...(n-1) { path.addLine(to: points[i]) }
        path.close()
        
        // 2. draw path
        path.strokeOrFill(stroke: stroke, fill: fill, strokeWidth: strokeWidth, strokeColor: strokeColor, fillColor: fillColor, blend: blend, alpha: alpha)
        
    }// end: polygon()
    
    // MARK: - Curve
    
    /// arc
    /// usage: UIBezierPath.arc(O, ...)
    public static func arc(
        
        center c:CGPoint,
        radius r:CGFloat,
        start angle1:CGFloat,
        end angle2:CGFloat,
        
        clockwise:Bool? = nil,
        
        // stroke parameters (optional)
        // ----------------------------
        width:RealNumber? = nil,
        color:UIColor? = nil,
        blend: CGBlendMode? = nil,
        alpha: RealNumber? = nil
        ) {
        
        // 1. construct path (arc)
        let path = UIBezierPath(arcCenter: c, radius: r, startAngle: angle1, endAngle: angle2, clockwise: clockwise ?? true)
        
        // 2. draw path
        path.strokeOnly(width: width, color: color, blend: blend, alpha: alpha)
    }
    
    /// circle
    /// usage: UIBezierPath.circle(O, r)
    public static func circle(
        
        _ center:CGPoint,
        _ radius:RealNumber,
        
        // stroke & fill parameters (optional)
        // -----------------------------------
        
        stroke:Bool? = nil,
        fill:Bool? = nil,
        
        strokeWidth: RealNumber? = nil,
        strokeColor: UIColor? = nil,
        fillColor:UIColor? = nil,
        
        blend:CGBlendMode? = nil,
        alpha: RealNumber? = nil
        ) {
        
        // 0. path dimensions
        let r = radius
        let A = center - [r, r]
        let B = center + [r, r]
        let rect = CGRect(A, B)
        
        // 1. construct path
        let path = UIBezierPath(ovalIn: rect)
        
        // 2. draw path
        path.strokeOrFill(stroke: stroke, fill: fill, strokeWidth: strokeWidth, strokeColor: strokeColor, fillColor: fillColor, blend: blend, alpha: alpha)
    }
    
    // usage: UIBezierPath.erase(polygon: points)
    public static func erase(polygon points:[CGPoint]) {
        //❓: is the fill color important in this case ?
        polygon(points, stroke: false, blend: .clear)
    }
    
}// end: UIBezierPath extension
