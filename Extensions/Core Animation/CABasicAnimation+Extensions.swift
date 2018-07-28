import UIKit

// Requires: UIColor.random
public enum Animation {
    
    // change background color to random color
    public static var randomBackgroundColor: CABasicAnimation {
        let ani = CABasicAnimation(keyPath: "backgroundColor")
        ani.toValue = UIColor.random.cgColor
        return ani
    }
    
}// end: enum Animaiton
