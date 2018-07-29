import UIKit

// MARK: - String Formats
// ----------------------

// String Format Specifiers
// https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html

extension CVarArg {
    // usage: (1.2345).format("%.2f") => 1.23
    public func format(_ formatString:String) -> String {
        return String(format: formatString, self)
    }
}

// MARK: - String Extensions
// -------------------------

extension String {
    
    // usage: "123456123456".replace("123", with: "_") =>  _456_456
    public func replace<A:StringProtocol, B:StringProtocol>(_ a:A, with b:B) -> String {
        return self.replacingOccurrences(of: a, with: b)
    }
    
    // usage: string.trim()
    public func trim() -> String {
        return components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }  // clear all white spaces
            .joined(separator: " ")  // join them with a single space
    }
    
    // usage: string[2..<5]
    public subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
    
    // usage: string[3]
    public subscript(_ i:Int) -> Character {
        let idx = index(startIndex, offsetBy: i)
        return self[idx]
    }
    
}// end: extension String


// MARK: - String Operators
// ------------------------

// usage: "@" * 6  => @@@@@@
public func * (string: String, n:Int) -> String{
    return String(repeating: string, count: n)
}

// usage: label.text += "abc"
public func += (a:inout String?, b:String) {
    a = (a ?? "") + b
}

