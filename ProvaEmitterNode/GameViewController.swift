//
//  GameViewController.swift
//  ProvaEmitterNode
//
//  Created by Sebastiano Santarpia on 28/05/17.
//  Copyright © 2017 Sebastiano Santarpia. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let view = self.view as! SKView? {
            
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {

                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                //Important for compatibility on every device
                scene.size = view.frame.size
                
                // Present the scene
                view.presentScene(scene)
                view.showsNodeCount = true
                view.showsFPS = true
                view.backgroundColor = SKColor.orange
}
}
}
}
