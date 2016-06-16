//
//  GameScene.swift
//  FlappySwift
//
//  Created by Vasilica Costescu on 06/06/2016.
//  Copyright (c) 2016 VMC Software LTD. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var bird: Bird!
    private var screenNode: SKSpriteNode!
    private var actors: [Startable]!
    
    override func didMoveToView(view: SKView) {
        screenNode = SKSpriteNode(color: .clearColor(), size: self.size)
        screenNode.anchorPoint = CGPoint(x:0, y:0)
        addChild(screenNode)
        
        let sky = Background(textureNamed:"sky", duration:60.0).addTo(screenNode, zPosition: 0)
        let city = Background(textureNamed:"city", duration:20.0).addTo(screenNode, zPosition: 1)
        let ground = Background(textureNamed:"ground", duration:5.0).addTo(screenNode, zPosition: 2)
        bird = Bird(textureNames: ["bird1.jpg", "bird2.jpg"]).addTo(screenNode)
        bird.position = CGPointMake(30.0, 400.0)
        actors = [sky, city, ground, bird]
        
        for actor in actors {
            actor.start()
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        bird.update()
    }
}
