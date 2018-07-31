import SceneKit

extension SCNNode {
    
    // usage: node.add(subnode)
    public func add(_ subnode:SCNNode) { addChildNode(subnode) }
    
    // usage: node.add(particleSystem)
    public func add(_ particalSystem: SCNParticleSystem) { addParticleSystem(particalSystem) }
    
    // Animations
    // ----------
    
    // usage: node.run(action)
    public func run(_ action:SCNAction) { runAction(action) }
    
    
    // Geometry & Coordinate System
    // ----------------------------
    
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
    }
    
}// end: extension SCNNode
