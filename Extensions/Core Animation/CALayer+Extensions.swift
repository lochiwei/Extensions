/*
 */

import UIKit

// MARK: - CALayer Extensions
// --------------------------

// Requires: Animation.randomBackgroundColor
extension CALayer {
    
    // Layer Tree
    // ----------
    
    // usage: layer.add(sublayer)
    public func add(_ sublayer:CALayer) { addSublayer(sublayer) }
    
    // Transform
    // ---------
    
    // usage: layer.scale(2, 3)
    public func scale(_ x:CGFloat, _ y:CGFloat, _ z:CGFloat = 1) {
        transform = CATransform3DMakeScale(x, y, z)
    }
    
    // usage:
    //   get: layer.affineMatrix
    //   set: layer.affineMatrix = <CGAffineTransform>
    public var affineMatrix: CGAffineTransform {
        get { return affineTransform() }
        set { setAffineTransform(newValue) }
    }
    
    // Hit Test
    // -----------------
    
    public func deepestSublayer(at point: CGPoint) -> CALayer? {
        return hitTest(point)
    }
    
    // Layer Animations
    // ----------------
    
    // apply animation with a 'toValue' (use with caution)
    // usage: layer.applyBasicAnimation(<CABasicAnimation>)
    func applyBasicAnimation(_ ani:CABasicAnimation) {
        
        // set the 'fromValue' (using presentation layer if available)
        // store current (presentation or self) value first
        ani.fromValue = (presentation() ?? self).value(forKeyPath: ani.keyPath!)
        
        // update the property (in the model layer) in advance
        // note: this approach will only work if toValue != nil
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        setValue(ani.toValue, forKey: ani.keyPath!)
        
        CATransaction.commit()
        
        //apply animation to layer
        add(ani, forKey: nil)
    }
    
    // Requires: Animation
    // usage: layer.changeRandomBackgroundColor()
    public func animateRandomBackgroundColor() {
        applyBasicAnimation(Animation.randomBackgroundColor)
    }
    
}// end: extension CALayer
