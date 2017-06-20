
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var arraySprite : [SKSpriteNode] = []
    var distanceButtons : CGFloat = 90
    
    
    
    

    override func didMove(to view: SKView) {
        
                var backGround = SKSpriteNode()
        
        // Declaration Buttons
        for _ in 1...8{
           
            let button = SKSpriteNode(imageNamed: "buttonOff")
            button.zPosition = 2
            button.size = CGSize(width: 60, height: 38)
            button.position = CGPoint(x:  distanceButtons, y: 80)
            arraySprite.append(button)
            distanceButtons += 20 + button.frame.width
            addChild(button)
            turnOn(array: arraySprite, userOn: 4)

            
        }
       
        
        backGround = SKSpriteNode(imageNamed: "backGround.png")
        backGround.size = CGSize(width: ((self.scene?.frame.width)!), height: (self.scene?.frame.height)!)
        backGround.anchorPoint = CGPoint(x: 0, y: 0)
        backGround.position = CGPoint(x: 0.0, y: 0.0)
        backGround.zPosition = 1
        addChild(backGround)
        
//        var button = SKSpriteNode()
//        //button = SKSpriteNode(imageNamed: "button.png")
//        button.name = "buttonX"
//        button.size = CGSize(width: 20, height: 20)
//        button.anchorPoint = CGPoint(x: 0, y: 0)
//        button.position = CGPoint(x:350, y: 200)
//        button.zPosition = 1
//        addChild(button)
        
        var emitterTorchSx = SKEmitterNode()
        emitterTorchSx = SKEmitterNode(fileNamed: "Fire.sks")!
        emitterTorchSx.position = CGPoint(x: 650, y: 320)
        emitterTorchSx.zPosition = 2
        addChild(emitterTorchSx)
        
        var emitterTorchDx = SKEmitterNode()
        emitterTorchDx = SKEmitterNode(fileNamed: "Fire.sks")!
        emitterTorchDx.position = CGPoint(x: 550, y: 320)
        emitterTorchDx.zPosition = 2
        addChild(emitterTorchDx)

        var portaTorciaA = SKSpriteNode()
        portaTorciaA = SKSpriteNode(imageNamed: "portaTorcia.png")
        portaTorciaA.size = CGSize(width: 20, height: 20)
        portaTorciaA.anchorPoint = CGPoint(x: 0, y: 0)
        portaTorciaA.position = CGPoint(x:540, y: 300)
        portaTorciaA.zPosition = 2
        addChild(portaTorciaA)
        
        var portaTorciaB = SKSpriteNode()
        portaTorciaB = SKSpriteNode(imageNamed: "portaTorcia.png")
        portaTorciaB.size = CGSize(width: 20, height: 20)
        portaTorciaB.anchorPoint = CGPoint(x: 0, y: 0)
        portaTorciaB.position = CGPoint(x:640, y: 300)
        portaTorciaB.zPosition = 2
        addChild(portaTorciaB)
        
//        var candle = SKEmitterNode()
//        candle = SKEmitterNode(fileNamed: "candle.sks")!
//        candle.position = CGPoint(x: 260, y: 320)
//        candle.zPosition = 2
//        addChild(candle)

        var christalSphere = SKEmitterNode()
        christalSphere = SKEmitterNode(fileNamed: "crystalSphere.sks")!
        christalSphere.position = CGPoint(x: 480, y: 290)
        christalSphere.zPosition = 2
        addChild(christalSphere)
        
//        var topo = SKSpriteNode()
//        topo = SKSpriteNode(imageNamed: "topo.png")
//        topo.size = CGSize(width: 20, height: 20)
//        topo.anchorPoint = CGPoint(x: 0, y: 0)
//        topo.position = CGPoint(x:200, y: 300)
//        topo.zPosition = 2
       
        

        /*   giocatore.run(SKAction.repeatForever(SKAction.animate(with: [SKTexture(imageNamed : "Calderone1.png"),SKTexture(imageNamed : "Calderone2.png"),SKTexture(imageNamed : "Calderone3.png"),SKTexture(imageNamed : "Calderone4.png"),SKTexture(imageNamed : "Calderone5.png"),SKTexture(imageNamed : "Calderone6.png"),SKTexture(imageNamed : "Calderone7.png"),SKTexture(imageNamed : "Calderone8.png"),SKTexture(imageNamed : "Calderone7.png"),SKTexture(imageNamed : "Calderone6.png"),SKTexture(imageNamed : "Calderone5.png"),SKTexture(imageNamed : "Calderone4.png"),SKTexture(imageNamed : "Calderone3.png"),SKTexture(imageNamed : "Calderone2.png")], timePerFrame: 0.15))) */
        
        var ragnatela = SKSpriteNode()
        ragnatela = SKSpriteNode(imageNamed: "ragnatela.png")
        ragnatela.size = CGSize(width: 50, height: 25)
        ragnatela.anchorPoint = CGPoint(x: 0, y: 0)
        ragnatela.position = CGPoint(x:250, y: 390)
        ragnatela.zPosition = 2
        addChild(ragnatela)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        print("ciao")
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        let node = self.atPoint(touchLocation)
        
        //            let touch = touches as!  Set<UITouch>
        //            let location = touch.first!.location(in: self)
        //            let node = self.atPoint(location)
        
        if (node.name == "a"){
            print("invia segnale di ok al sistema che gestisce il multipeer connectivity")
        }
        else{
            print("non inviare il segnale al sistema che gestisce il multipeer connectivity")
        }
    }
    
    func turnOn(array: [SKSpriteNode], userOn : Int){
        let ac = array.count
   
        if ac >= 1 && userOn <= ac && userOn >= 1{
        for i in 0...(userOn - 1){
            //texture button on
            array[i].run(SKAction.setTexture(SKTexture(imageNamed: "buttonOn")))
            
            var emitter = SKEmitterNode()
            emitter = SKEmitterNode(fileNamed: "magicButton.sks")!
            emitter.position = array[i].position
            emitter.zPosition = 2
            addChild(emitter)
            print("sono qui")
        }
        }else{
            // check failed
        }
    }
}

/*
extension SKNode{
    public func addChildGroup(_ childs: [SKNode]){
        for i in childs{
            if i.parent == nil{
         self.addChild(i)
            }
        }
    }
}*/
