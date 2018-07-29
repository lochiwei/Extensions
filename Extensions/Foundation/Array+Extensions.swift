
import Foundation

// extensions
extension Array {
    
    // if any one in the array satisfies the condition, return true.
    // usage: array.any { $0.isGood }
    public func any(_ condition:(Element) -> Bool) -> Bool {
        return contains {condition($0)}
    }
    
    // if all satisfy the condition, return true.
    // usage: array.all { $0.isGood }
    public func all(_ condition:(Element) -> Bool) -> Bool {
        return !contains { !condition($0) }
    }
    
}// end: Array extension
