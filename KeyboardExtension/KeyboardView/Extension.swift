//
//  Extension.swift
//  KeyboardExtension
//
//  Created by Jamil on 3/6/21.
//

import UIKit

//class Extension: NSObject {
//
//}

extension UIImage {
    func resize(_ toSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = toSize.width  / size.width
        let heightRatio = toSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
}

extension String {
    func color(size:CGSize? = CGSize(width: 70, height: 70)) -> UIColor {
        guard let image = UIImage(named: self) else { return .black }
        return UIColor.init(patternImage: image)
    }
    
    func colorSmall(_ wh:Int? = 70) -> UIColor {
        guard let image = UIImage(named: self) else { return .black }
        let size = CGSize(width: wh!, height: wh!)
        let resizeImage = image.resize(size)
        return UIColor.init(patternImage: resizeImage)
    }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
