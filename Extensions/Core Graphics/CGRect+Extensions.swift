import UIKit

// CGRect
extension CGRect {
    
    // usage: CGRect(x, y, w, h)
    public init(_ x: RealNumber, _ y: RealNumber, _ width: RealNumber, _ height: RealNumber) {
        self.init(
            x: CGFloat(x.realValue),
            y: CGFloat(y.realValue),
            width: CGFloat(width.realValue),
            height: CGFloat(height.realValue)
        )
    }
    
    // - usage: rect.from(layerA, to: layerB)
    // -  note: if layerB = nil, returns the coordinates in superlayer
    public func from(_ layerA:CALayer, to layerB:CALayer?) -> CGRect {
        return layerA.convert(self, to: layerB)
    }
    
}// end: extension CGRect
