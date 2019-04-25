//
//  ViewController.swift
//  edu.johnny.particle
//
//  Created by Johnny Peterson on 4/24/19.
//  Copyright © 2019 Johnny Peterson. All rights reserved.
//

import UIKit
import SpriteKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var teste: UIView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var graduationButton: UIButton!
    
    @IBAction func confetti(_ sender: Any) {
        
        let alert = UIAlertController(title: title, message: "You just completed a course!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "I'm Aweseome", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            self.view.layer.sublayers?.popLast()
        }
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        createParticles()
        
    }
    @IBAction func graduationAction(_ sender: Any) {
        let alert = UIAlertController(title: title, message: "Congrats on Graduating!!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Go update my resume", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            self.view.layer.sublayers?.popLast()
        }
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        createParticlesGraduation()
    }
    
    @IBAction func poopAction(_ sender: Any) {
        let alert = UIAlertController(title: title, message: "You Failed 🙁", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Study better", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            self.view.layer.sublayers?.popLast()
        }
        
        alert.addAction(cancelAction)
        
        let sk: SKView = SKView()
        sk.frame = teste.bounds
        sk.backgroundColor = .clear
        teste.addSubview(sk)
        
        let scene: SKScene = SKScene(size: teste.bounds.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear
        
        let en = SKEmitterNode(fileNamed: "MyParticle.sks")
        let cgPoint = CGPoint(x: view.center.x, y: -96)
        en?.position = teste.center
        
        scene.addChild(en!)
        sk.presentScene(scene)
        
        
        self.present(alert, animated: true, completion: nil)
       
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func createParticles() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let red = makeEmitterCell(color: UIColor.red)
        let green = makeEmitterCell(color: UIColor.green)
        let blue = makeEmitterCell(color: UIColor.blue)
        
        particleEmitter.emitterCells = [red, green, blue]
        
        view.tag = 100
        
        view.layer.addSublayer(particleEmitter)
        
    }
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.birthRate = 3
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 5
        cell.spinRange = 5
        cell.scaleRange = 0.2
        cell.scaleSpeed = -0.05
        cell.contents = UIImage(named: "confetti")?.cgImage
        
        return cell
    }
    
    func createParticlesGraduation() {
        let particleEmitter = CAEmitterLayer()
        
        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
        
        let red = makeEmitterCellGraduationCell(color: UIColor.red)
        let green = makeEmitterCellGraduationCell(color: UIColor.green)
        let blue = makeEmitterCellGraduationCell(color: UIColor.blue)
        
        particleEmitter.emitterCells = [red, green, blue]
        
        view.tag = 100
        
        view.layer.addSublayer(particleEmitter)
        
    }
    
    func makeEmitterCellGraduationCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.birthRate = 10
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 5
        cell.spinRange = 5
        cell.scaleRange = 2
        cell.scaleSpeed = -0.05
        cell.contents = UIImage(named: "Image")?.cgImage
        
        return cell
    }
    
    func createParticlesFailed() {
     
        
//        particleEmitter.emitterPosition = CGPoint(x: view.center.x, y: -96)
//        particleEmitter.emitterShape = .line
//        particleEmitter.emitterSize = CGSize(width: view.frame.size.width, height: 1)
//
//        let red = makeEmitterCellGFailed()
//        let green = makeEmitterCellGFailed()
//        let blue = makeEmitterCellGFailed()
//
//        particleEmitter.emitterCells = [red, green, blue]
//
//        view.tag = 100
//
//        view.layer.addSublayer(particleEmitter)
        
    }
    
    func makeEmitterCellGFailed() -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.birthRate = 10
        cell.lifetime = 7.0
        cell.lifetimeRange = 0
        
        cell.velocity = 200
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.emissionRange = CGFloat.pi / 4
        cell.spin = 5
        cell.spinRange = 5
        cell.scaleRange = 2
        cell.scaleSpeed = -0.05
        let image = "💩".image()
        cell.contents = image?.cgImage
        
        return cell
    }
    
}

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}








