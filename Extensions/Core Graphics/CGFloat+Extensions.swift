import UIKit

extension CGFloat {
    
    // random: 0.0 ~ 1.0
    public static var random: CGFloat {
        return CGFloat( Float(arc4random()) / Float(UInt32.max) )
        
    }
    
}// end: extension CGFloat
