import SceneKit

extension SCNNode {
    
    // usage: node.add(subnode)
    public func add(_ subnode:SCNNode) { addChildNode(subnode) }
    
    // put a geometry node at position
    // - usage: node.newShape(geometry, at: [x, y, z], color: color)
    public func newShape(_ geo:SCNGeometry, at position:SCNVector3? = nil, color:UIColor? = nil) -> SCNNode {
        let node = SCNNode(geometry: geo)
        if let p = position { node.position = p }
        if let c = color { node.geometry?.firstMaterial?.diffuse.contents = c }
        add(node)
        return node
    }
    
}// end: extension SCNNode
