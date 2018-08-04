import UIKit

// CGSize
extension CGSize {
    
    // usage: CGSize(w, h)
    public init(_ width: RealNumber, _ height: RealNumber) {
        self.init(
            width: CGFloat(width.realValue),
            height: CGFloat(height.realValue)
        )
    }
    
}// end: extension CGSize

