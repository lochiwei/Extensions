import SceneKit

extension SCNNode {
    
    // usage: node.add(subnode)
    public func add(_ subnode:SCNNode) { addChildNode(subnode) }
    
    // usage: node.add(particleSystem)
    public func add(_ particalSystem: SCNParticleSystem) { addParticleSystem(particalSystem) }
    
    // MARK: - Camera
    // --------------
    
    // note: there is another (official) look(at: SCNVector3) method.
    //       see what's the difference
    // usage: node.look(at: anotherNode)
    public func look(at node:SCNNode) {
        
        let lock = SCNLookAtConstraint(target: node)
        
        /*
         With gimbal lock enabled, camera remains parallel
         with horizon and viewport (device's screen).
         
         This is done by disabling rotation along the roll axis
         (the axis pointing from the camera to the constraint's target)
         */
        lock.isGimbalLockEnabled = true
        
        constraints = [lock]
    }// end: look(at:)
    
    // add camera to node
    // usage: let cameraNode = node.newCameraNode(at: position)
    public func newCameraNode(at position: SCNVector3? = nil, lookAt target: SCNNode? = nil) -> SCNNode {
        
        // camera
        let camera = SCNCamera()
        
        // camera node
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        if let p = position { cameraNode.position = p }
        if let t = target { cameraNode.look(at: t) }
        
        // graph tree
        add(cameraNode)
        
        return cameraNode
    }
    
    // MARK: - Lights
    // --------------
    
    // usage: let lightNode = node.newLightNode(.omni, at: position)
    public func newLightNode(_ type: SCNLight.LightType, color: Any? = nil, at position:SCNVector3? = nil) -> SCNNode {
        
        // light
        let light = SCNLight()
        light.type = type
        if let c = color { light.color = c }
        
        // light node
        let lightNode = SCNNode()
        lightNode.light = light
        if let p = position { lightNode.position = p }
        
        // graph tree
        add(lightNode)
        
        return lightNode
    }
    
    // MARK: - Animations
    // ----------
    
    // usage: node.run(action)
    public func run(_ action:SCNAction) { runAction(action) }
    
    
}// end: extension SCNNode
