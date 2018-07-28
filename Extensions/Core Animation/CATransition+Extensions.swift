import UIKit

public enum Transition {
    
    // push directions
    public enum Direction { case left, right, top, bottom }
    
    // usage: Transition.push(from: .top)
    public static func push(from direction:Direction) -> CATransition {
        
        let transition = CATransition()
        transition.type = kCATransitionPush
        
        switch direction {
        case .left: transition.subtype = kCATransitionFromLeft
        case .right: transition.subtype = kCATransitionFromRight
        case .top: transition.subtype = kCATransitionFromBottom  // bug?
        case .bottom: transition.subtype = kCATransitionFromTop  // top, bottom 反了？
        }
        
        return transition
        
    }// end: push(from:)
    
}// end: enum Transition
