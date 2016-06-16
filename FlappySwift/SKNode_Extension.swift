//
//  SKNode_Extension.swift
//  FlappySwift
//
//  Created by Vasilica Costescu on 06/06/2016.
//  Copyright © 2016 VMC Software LTD. All rights reserved.
//
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file: NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks") {
            
            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            
            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }        
    }
}

