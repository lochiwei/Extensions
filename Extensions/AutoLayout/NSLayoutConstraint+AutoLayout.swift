
import UIKit

// MARK: - NSLayoutConstraint

// usage: autolayout(v1, .leading, .equal, v2, .leading, m, c)
// means: v1.leading = v2.leading * m + c
public func autolayout(
    _ item1: Any,
    _ attr1: NSLayoutAttribute,
    _ relation: NSLayoutRelation,
    _ item2: Any?,
    _ attr2: NSLayoutAttribute,
    _ multiplier: CGFloat = 1,
    _ constant: CGFloat = 0
    ) {
    
    // auto layout
    if let v = item1 as? UIView { v.usesAutolayout = true }
    
    NSLayoutConstraint(
        item: item1,
        attribute: attr1,
        relatedBy: relation,
        toItem: item2,
        attribute: attr2,
        multiplier: multiplier,
        constant: constant
        ).isActive = true  // activate contraint
    
}//end: autolayout()


// usage: autolayout(v, .height, .equal, c)
// means: v.height = c
public func autolayout(
    _ item: Any, _ attr: NSLayoutAttribute,
    _ relation: NSLayoutRelation,
    _ constant: CGFloat
    ) {
    autolayout(item, attr, relation, nil, .notAnAttribute, 0, constant)
}

// MARK: - Visual Format Language

/// 注意：如果有使用 'options' 時，"H:", "V:" 不要同時混用 !!
/// usage:
///   autolayout(_:views:metrics:options:)
///   autolayout(["[b2(==b1)]", "V:[v]-10-[b1]-10-|"], views:["b1": b2,"b2": b1,"v": v])
public func autolayout(
    _ formats: [String],
    views: [String: UIView],
    metrics: [String:Any]? = nil,
    options: NSLayoutFormatOptions = []
    ) {
    
    // use autolayout for all views
    for (_, v) in views {
        // ⭐️ 非常重要，沒這行 Auto Layout 就會失效！
        v.usesAutolayout = true
    }
    
    // generate constaints
    var constraints = [NSLayoutConstraint]()
    
    formats.forEach { (format) in
        constraints += NSLayoutConstraint.constraints(
            withVisualFormat: format,
            options: options,
            metrics: metrics,
            views: views
        )
    }
    
    // activate constraints
    NSLayoutConstraint.activate(constraints)
}
