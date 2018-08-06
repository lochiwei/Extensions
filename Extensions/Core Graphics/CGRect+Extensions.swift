import UIKit

// CGRect
extension CGRect {
    
    // MARK: - Init
    // ------------
    
    // usage: CGRect(x, y, w, h)
    public init(_ x: RealNumber, _ y: RealNumber, _ width: RealNumber, _ height: RealNumber) {
        self.init(
            x: CGFloat(x.realValue),
            y: CGFloat(y.realValue),
            width: CGFloat(width.realValue),
            height: CGFloat(height.realValue)
        )
    }
    
    // CGRect from two points
    // usage: CGRect(A, B)
    public init(_ A:CGPoint, _ B:CGPoint) {
        let x1 = min(A.x, B.x)
        let x2 = max(A.x, B.x)
        let y1 = min(A.y, B.y)
        let y2 = max(A.y, B.y)
        self.init(x: x1, y: y1, width: x2 - x1, height: y2 - y1)
    }
    
    // MARK: - Geometry
    
    public var center: CGPoint { return CGPoint(midX, midY) }
    
    // MARK: - Coordinates Conversion
    // ------------------------------
    
    // - usage: rect.from(layerA, to: layerB)
    // -  note: if layerB = nil, returns the coordinates in superlayer
    public func from(_ layerA:CALayer, to layerB:CALayer?) -> CGRect {
        return layerA.convert(self, to: layerB)
    }
    
}// end: extension CGRect
