
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
    
    // MARK: - Primitive Nodes
    
    // floor
    public func newFloorNode(at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        
        // geometry
        let geo = SCNFloor()
        
        // node
        let node = newShape(geo, at: position, diffuse: contents)
        node.name = "floor"
        
        return node
    }
    
    // box
    public func newBoxNode(_ width:CGFloat, _ height:CGFloat, _ length:CGFloat, at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        
        // geometry
        let geo = SCNBox(width: width, height: height, length: length, chamferRadius: 0)
        
        // node
        let node = newShape(geo, at: position, diffuse: contents)
        node.name = "box"
        
        return node
    }
    
    // pyramid
    public func newPyramidNode(_ width:CGFloat, _ height:CGFloat, _ length:CGFloat, at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        
        // geometry
        let geo = SCNPyramid(width: width, height: height, length: length)
        
        // node
        let node = newShape(geo, at: position, diffuse: contents)
        node.name = "pyramid"
        
        return node
    }
    
    // sphere
    public func newSphereNode(_ radius:CGFloat, at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        
        // geometry
        let geo = SCNSphere(radius: radius)
        
        // node
        let node = newShape(geo, at: position, diffuse: contents)
        node.name = "sphere"
        
        return node
    }
    
    // cylinder
    public func newCylinderNode(r:CGFloat, h:CGFloat, at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        
        // geometry
        let geo = SCNCylinder(radius: r, height: h)
        
        // node
        let node = newShape(geo, at: position, diffuse: contents)
        node.name = "cylinder"
        
        return node
    }
    
    // tube
    public func newTubeNode(r:CGFloat, R:CGFloat, h:CGFloat, at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        
        // geometry
        let geo = SCNTube(innerRadius: r, outerRadius: R, height: h)
        
        // node
        let node = newShape(geo, at: position, diffuse: contents)
        node.name = "tube"
        
        return node
    }
    
    // torus
    public func newTorusNode(R:CGFloat, r:CGFloat, at position:SCNVector3? = nil, diffuse contents:Any? = nil) -> SCNNode {
        
        // geometry
        let geo = SCNTorus(ringRadius: R, pipeRadius: r)
        
        // node
        let node = newShape(geo, at: position, diffuse: contents)
        node.name = "torus"
        
        return node
    }
    
}// end: extension SCNNode
