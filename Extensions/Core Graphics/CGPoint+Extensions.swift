import UIKit

// MARK: - CGPoint Extensions
// --------------------------

// CGPoint
extension CGPoint {
    
    // init
    // ----
    
    // usage: CGPoint(2, 3)
    // - requires: RealNumber
    public init(_ x:RealNumber, _ y:RealNumber) {
        self.init(x: CGFloat(x.realValue), y: CGFloat(y.realValue))
    }
    
    // Coordinates Conversion
    // -----------
    
    // - usage: point.from(layerA, to: layerB)
    // -  note: if layerB = nil, returns the coordinates in superlayer
    public func from(_ layerA:CALayer, to layerB:CALayer?) -> CGPoint {
        return layerA.convert(self, to: layerB)
    }
    
    // String Format
    // -------------
    // - requires: String+Extensions
    public func string(decimalPlaces d:Int = 2) -> String {
        let spec = "%.\(d)f"
        return "(\(x.format(spec)), \(y.format(spec)))"
    }
    
}// end: CGPoint
