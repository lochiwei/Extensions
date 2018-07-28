/*
 TODO: - Todo List
 - ( ) a protocol unifying all matrices (CGAffineTransform, CATransform3D, ...)
 */

import UIKit

// MARK: - Matrix Operations

// matrix multiplication
// ---------------------

// usage: A * B
public func * (A:CGAffineTransform, B:CGAffineTransform) -> CGAffineTransform {
    return A.concatenating(B)
}

// usage: A *= B => A = A * B
public func *= (A:inout CGAffineTransform, B:CGAffineTransform) {
    A = A.concatenating(B)
}

// usage: A =* B => A = B * A
infix operator =*
public func =* (A:inout CGAffineTransform, B:CGAffineTransform) {
    A = B.concatenating(A)
}

// MARK: - AffineTransform

// usage: AffineTransform.rotate(angle)
public enum AffineTransform {
    // rotation
    public static func rotate(_ angle:CGFloat) -> CGAffineTransform {
        return CGAffineTransform(rotationAngle: angle)
    }
}

