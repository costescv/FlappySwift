//
//  Background.swift
//  FlappySwift
//
//  Created by Vasilica Costescu on 06/06/2016.
//  Copyright © 2016 VMC Software LTD. All rights reserved.
//

import SpriteKit

class Background {
    private let parallaxNode: ParallaxNode
    private let duration: Double
    
    init(textureNamed textureName:String, duration: Double) {
        parallaxNode = ParallaxNode(textureNamed: textureName)
        self.duration = duration
    }
    
    func addTo(parentNode: SKSpriteNode, zPosition: CGFloat) -> Self {
        parallaxNode.addTo(parentNode, zPosition: zPosition)
        return self
    }
}

//MARK: Startable
extension Background : Startable {
    func start() {
        parallaxNode.start(duration: duration)
    }
    
    func stop() {
        parallaxNode.stop()
    }
}