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
    static let shared  = Color()
    var color:UIColor  = .black
    var colorSmall:UIColor = .black
    var colorType      = ColorType.RBG
    var imageName      = ""
    var colorImage:UIImage?
    
    func colorList() -> [Color] {
        let colorArray:[UIColor] = [.red,.green,.blue,.yellow,.cyan,.magenta,.cyan,.purple,.brown,.gray]
        
        var colorPatternArray:[Color] = []
        
        for _color in colorArray {
            let color = Color()
            color.colorType = ColorType.RBG
            color.color = _color
            color.colorSmall = _color
            colorPatternArray.append(color)
        }
        
        for i in 0...8 {
            let color = Color()
            color.imageName = "photo\(i)"
            color.colorType = ColorType.PATTERN
            color.color = color.imageName.color()
            color.colorSmall = color.imageName.colorSmall()
            colorPatternArray.append(color)
        }
        return colorPatternArray
    }
}
