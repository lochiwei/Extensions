import UIKit


// Requires: CGFloat.random
extension UIColor {
    
    // random color
    public static var random: UIColor {
        let r = CGFloat.random
        let g = CGFloat.random
        let b = CGFloat.random
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}// end: UIColor extension
