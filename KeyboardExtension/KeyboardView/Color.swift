//
//  Colors.swift
//  KeyboardExtension
//
//  Created by Jamil on 6/6/21.
//

import UIKit

enum ColorType:Int {
    case RBG
    case PATTERN
}

class Color: NSObject {
    static let shared = Color()
    var color:UIColor = .black
    var colorSmall:UIColor = .black
    var colorType = ColorType.RBG
    var imageName = ""
    //var colorImage:UIImage?
    
    func colorList() -> [Color] {
        var colorPatternArray:[Color] = []
        for i in 0...8 {
            let color = Color()
            color.imageName = "photo\(i)"
            color.colorType = ColorType.PATTERN
            color.color = color.imageName.color()
            color.colorSmall = color.imageName.colorSmall()
            colorPatternArray.append(color)
        }
        
        for _color in colorArray() {
            let color = Color()
            color.colorType = ColorType.RBG
            color.color = _color
            color.colorSmall = _color
            colorPatternArray.append(color)
        }
        
        return colorPatternArray
    }
    
    func colorArray() -> [UIColor] {
        let colorArray:[UIColor] = [
            color(0),color(152,1,0),color(230,184,175),color(221,126,107),color(204,65,38),color(166,28,0), color(133,32,12),color(91,15,0),
            color(67), color(255,2,1), color(244,204,204), color(234,153,153), color(224,102,102), color(204,1,0), color(153,1,0), color(102,0,0),
            
            color(102), color(255,153,0), color(252,229,205), color(249,203,156),color(246,178,107), color(230,145,55), color(180,95,6), color(120,63,4),
            
            
            color(153), color(255,252,0), color(255,242,204), color(255,229,153), color(255,217,102), color(241,194,50), color(191,144,0), color(127,96,0),
            
            color(183), color(3,252,8), color(217,234,211), color(182,215,168), color(147,196,125), color(106,168,79), color(56,118,29), color(38,78,19),
            
            color(204), color(1,255,255), color(208,224,227), color(162,196,201), color(118,165,175), color(69,129,142), color(19,79,92), color(11,52,61),
            
            color(217), color(73,134,232), color(201,218,248), color(163,194,244), color(109,158,235), color(61,120,216), color(18,85,204), color(28,69,135),
            color(239), color(0,45,255), color(207,226,243), color(159,197,232), color(111,168,220), color(60,133,198), color(12,83,148), color(8,55,99),
            color(243), color(153,45,255), color(218,210,233), color(180,167,214), color(142,124,195), color(103,78,167), color(53,28,117), color(32,18,77),
            color(255), color(255,46,255), color(234,209,220), color(212,166,189), color(194,123,160), color(166,77,121), color(116,27,71), color(76,17,48),
            
        ]
        return colorArray
    }
    
    func color(_ red:Int, _ green:Int,_ blue:Int) -> UIColor {
        let color = UIColor.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1)
        return color
    }
    
    func color(_ rgb:Int) -> UIColor {
        let _color = UIColor.init(red: CGFloat(rgb)/255.0, green: CGFloat(rgb)/255.0, blue: CGFloat(rgb)/255.0, alpha: 1)
        return _color
    }
}
