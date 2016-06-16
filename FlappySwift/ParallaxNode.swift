//
//  ParallaxNode.swift
//  FlappySwift
//
//  Created by Vasilica Costescu on 06/06/2016.
//  Copyright © 2016 VMC Software LTD. All rights reserved.
//

import SpriteKit

class ParallaxNode {
    private let node: SKSpriteNode!
    
    init(textureNamed: String) {
        let leftHalf = createHalfNodeTexture(textureNamed, offsetX: 0)
        let rightHalf = createHalfNodeTexture(textureNamed, offsetX: leftHalf.size.width)
        
        let size = CGSizeMake(leftHalf.size.width + rightHalf.size.width, leftHalf.size.height)
        
        node = SKSpriteNode(color: .clearColor(), size: size)
        node.anchorPoint = CGPointZero
        node.position = CGPointZero
        node.addChild(leftHalf)
        node.addChild(rightHalf)
    }
    
    func zPosition(zPosition: CGFloat) -> ParallaxNode {
        node.zPosition = zPosition
        return self
    }
    
    func addTo(parentNode: SKSpriteNode, zPosition: CGFloat) -> ParallaxNode {
        parentNode.addChild(node)
        node.zPosition = zPosition
        return self
    }
}

//MARK: Startable 
extension ParallaxNode {
    func start(duration duration: NSTimeInterval) {
        node.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.moveToX(-node.size.width/2.0, duration: duration),
            SKAction.moveToX(0, duration: 0)
            ]
            ))
        )
    }
    
    func stop() {
        node.removeAllActions()
    }
}

//MARK: Private
private func createHalfNodeTexture(textureNamed: String, offsetX: CGFloat) -> SKSpriteNode {
    let node = SKSpriteNode(imageNamed: textureNamed, normalMapped: true)
    node.anchorPoint = CGPointZero
    node.position = CGPoint(x: offsetX, y: 0)
    return node
}

