//
//  MenuViewController.swift
//  FlappySwift
//
//  Created by Vasilica Costescu on 06/06/2016.
//  Copyright © 2016 VMC Software LTD. All rights reserved.
//

import UIKit
import HTPressableButton
import Cartography

class MenuViewController : UIViewController {
    private let playButton = HTPressableButton(frame: CGRectMake(0, 0, 260, 50), buttonStyle: .Rect)
    private let gameCenterButton = HTPressableButton(frame: CGRectMake(0, 0, 260, 50), buttonStyle: .Rect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layoutView()
        style()
        render()
    }
}

//MARK: Setup
private extension MenuViewController {
    func setup() {
        playButton.addTarget(self, action: #selector(MenuViewController.onPlayPressed(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(playButton)
        
        gameCenterButton.addTarget(self, action: #selector(MenuViewController.onGameCenterPressed(_:)), forControlEvents: .TouchUpInside)
        view.addSubview(gameCenterButton)
    }
    
    @objc func onPlayPressed(sender: UIButton) {
        let vc = GameViewController()
        vc.modalTransitionStyle = .CrossDissolve
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @objc func onGameCenterPressed(sender: UIButton) {
        print("onGameCenterPressed")
    }
}

//MARK: Layout
extension MenuViewController {
    func layoutView() {
        constrain(playButton) { view in
            view.bottom == view.superview!.centerY - 60
            view.centerX == view.superview!.centerX
            view.height == 80
            view.width == view.superview!.width - 40
        }
        constrain(gameCenterButton) { view in
            view.bottom == view.superview!.centerY + 60
            view.centerX == view.superview!.centerX
            view.height == 80
            view.width == view.superview!.width - 40
        }
    }
}

//MARK: Style
extension MenuViewController {
    func style() {
        playButton.buttonColor = UIColor.ht_grapeFruitColor()
        playButton.shadowColor = UIColor.ht_grapeFruitDarkColor()
        
        gameCenterButton.buttonColor = UIColor.ht_aquaColor()
        gameCenterButton.shadowColor = UIColor.ht_aquaDarkColor()
    }
}

//MARK: Render
private extension MenuViewController {
    func render() {
        playButton.setTitle("Play", forState: .Normal)
        gameCenterButton.setTitle("Game Center", forState: .Normal)
    }
}
