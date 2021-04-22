//
//  Triangle.swift
//  AlQuran
//
//  Created by Jamil Hossain on 10/6/16.
//  Copyright © 2016 Jamil Hossain. All rights reserved.
//

import UIKit

//may help this link
//https://stackoverflow.com/questions/44109200/swift-custom-keyboard-show-extra-letters-pop-up-on-keyboard-long-press
//https://stackoverflow.com/questions/36890779/how-to-show-an-extra-character-on-keyboard-long-press

class Triangle: UIView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        
        // Drawing code
        // Get Height and Width
        let layerHeight = self.layer.frame.height
        let layerWidth  = self.layer.frame.width
        
        // Create Path
        let bezierPath = UIBezierPath()
        
        // Draw Points
//        bezierPath.move(to: CGPoint(x: 0, y: layerHeight))
//        bezierPath.addLine(to: CGPoint(x: layerWidth, y: layerHeight))
//        bezierPath.addLine(to: CGPoint(x: layerWidth / 2, y: 0))
//        bezierPath.addLine(to: CGPoint(x: 0, y: layerHeight))
//        bezierPath.close()
        
//        bezierPath.move(to: CGPoint(x: layerWidth / 2, y: layerHeight))
//        bezierPath.addLine(to: CGPoint(x: layerWidth, y: 0))
//        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
//        bezierPath.addLine(to: CGPoint(x: layerWidth/2, y: layerHeight))
//        bezierPath.close()
        
//        bezierPath.move   (to: CGPoint(x: layerWidth / 2, y: layerHeight))
//        bezierPath.addLine(to: CGPoint(x: layerWidth, y: 0))
//        bezierPath.close()
        
        
        //self.showCurve()
        //self.showCurve2()
        self.showCurve3()
        
//        // Apply Color
//        let color:UIColor = UIColor.init(red: 0.0, green: 170.0/255, blue: 110.0/255, alpha: 1.0)
//
//        color.setFill()
//        bezierPath.fill()
//
//        // Mask to Path
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = bezierPath.cgPath
//        self.layer.mask = shapeLayer
        
    }
    
    func showCurve(){
        let bezierPath = UIBezierPath()
        let p1 = CGPoint(x:0,y:0)
        let p3 = CGPoint(x:0,y:-frame.height/2)

        bezierPath.move(to:p1)
        bezierPath.addQuadCurve(to: p3, controlPoint: CGPoint(x: frame.width/4, y: -frame.height/4))
        
        let line = CAShapeLayer()
        line.path = bezierPath.cgPath;
        line.strokeColor = UIColor.green.cgColor
        line.fillColor = UIColor.clear.cgColor
        layer.addSublayer(line)
    }
    
    func showCurve2(){
        let bezierPath = UIBezierPath()
        let p1 = CGPoint(x:frame.width, y:0)
        let p3 = CGPoint(x:frame.width, y:-frame.height/2)

        bezierPath.move(to:p1)
        bezierPath.addQuadCurve(to: p3, controlPoint: CGPoint(x: frame.width/4, y: -frame.height/4))
        
        let line = CAShapeLayer()
        line.path = bezierPath.cgPath;
        line.strokeColor = UIColor.green.cgColor
        line.fillColor = UIColor.clear.cgColor
        layer.addSublayer(line)
    }
    
    func showCurve3(){
        let bezierPath = UIBezierPath()
        let p1 = CGPoint(x:frame.width, y:0)
        let p3 = CGPoint(x:frame.width, y:-frame.height/2)
        
        bezierPath.move(to:p1)
        bezierPath.addQuadCurve(to: p3, controlPoint: CGPoint(x: frame.width/4, y: -frame.height/4))
        
        let line = CAShapeLayer()
        line.path = bezierPath.cgPath;
        line.strokeColor = UIColor.green.cgColor
        line.fillColor = UIColor.clear.cgColor
        layer.addSublayer(line)
    }

}
