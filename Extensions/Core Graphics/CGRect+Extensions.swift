import UIKit

// CGRect
extension CGRect {
    
    // coordinates conversion
    // - usage: rect.from(layerA, to: layerB)
    // -  note: if layerB = nil, returns the coordinates in superlayer
    public func from(_ layerA:CALayer, to layerB:CALayer?) -> CGRect {
        return layerA.convert(self, to: layerB)
    }
    
}// end: extension CGRect
