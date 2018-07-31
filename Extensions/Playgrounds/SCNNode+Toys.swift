
import SceneKit

// SCNNode (playground extensions)
extension SCNNode {
    
    // New Subnodes
    // ------------
    
    // put a geometry node at position
    // - usage: node.newShape(geometry, at: [x, y, z], diffuse: Any?)
    public func newShape(_ geo:SCNGeometry, at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        let node = SCNNode(geometry: geo)
        if let p = position { node.position = p }
        if let c = contents { node.geometry?.firstMaterial?.diffuse.contents = c }
        add(node)
        return node
    }
    
}// end: extension SCNNode
