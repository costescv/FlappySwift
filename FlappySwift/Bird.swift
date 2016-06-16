//
//  Bird.swift
//  FlappySwift
//
//  Created by Vasilica Costescu on 07/06/2016.
//  Copyright © 2016 VMC Software LTD. All rights reserved.
//

import SpriteKit

class Bird {
    private var node: SKSpriteNode!
    private let textureNames: [String]
    
    var position: CGPoint {
        set { node.position = newValue }
        get { return node.position }
    }
    
    init(textureNames: [String]) {
        self.textureNames = textureNames
        node = createNode()
    }
    
    func addTo(scene: SKSpriteNode) -> Bird {
        scene.addChild(node)
        return self
    }
}

//MARK: Creators
private extension Bird {
    func createNode() -> SKSpriteNode {
        let birdNode = SKSpriteNode(imageNamed: textureNames.first!, normalMapped: true)
        birdNode.zPosition = 2.0
        return birdNode
    }
}

//MARK: Startable 
extension Bird: Startable {
    func start() {
        animate()
    }
    
    func stop() {
        node.physicsBody!.dynamic = false
        node.removeAllActions()
    }
}

//MARK: Private
extension Bird {
    private func animate() {
        let animationFrames = textureNames.map { texName in
            SKTexture(imageNamed: texName)
        }
        
        node.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(animationFrames, timePerFrame: 0.5)))
    }
}

//MARK: Actions
extension Bird {
    func update() {
        switch node.physicsBody!.velocity.dy {
        case let dy where dy > 30.0:
            node.zRotation = (3.14 / 6.0)
        case let dy where dy < -100.0:
            node.zPosition = -1 * (3.14 / 4.0)
        default:
            node.zRotation = 0.0
        }
    }
}