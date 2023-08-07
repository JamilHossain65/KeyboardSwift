//
//  Extension.swift
//  KeyboardExtension
//
//  Created by Jamil on 3/6/21.
//

import UIKit
import Foundation

//class Extension: NSObject {
//
//}

//extension String{
    // Localized string
//    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
//        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "**\(self)**", comment: "")
    //}
    
//    func localized() -> String{
//       return NSLocalizedString(self, comment: "")
        
//        if let path = Bundle.main.path(forResource: "Settings", ofType: "bundle") {
//             let settingBundle = Bundle.init(path: path)
//             print(settingBundle)
//             let lString = NSLocalizedString("Color Name", tableName: "Root", bundle: settingBundle!, value: "Not found", comment: "")
//             print(lString)
//            return lString
//        }
        
//        let path = Bundle.main.path(forResource: "Settings", ofType: "bundle")
//        print("path:\(path)")
//
//        let path2 = Bundle.main.path(forResource: "Root", ofType: "strings", inDirectory: "Settings.bundle/en.lproj")
//
//        if let serverStringsUrl = Bundle.main.url(forResource: "Root", withExtension: "strings", subdirectory: "Settings.bundle/en.lproj"){
//
//            print("serverStringsDict:\(serverStringsUrl.path)")
//            return serverStringsUrl.path
//          }
        
       
    //}
//}



//https://stackoverflow.com/questions/29985614/how-can-i-change-locale-programmatically-with-swift
extension Bundle {
    private static var bundle: Bundle!

    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "en"
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            bundle = Bundle(path: path!)
        }
        return bundle
    }

    public static func setLanguage(lang: String) {
        UserDefaults.standard.set(lang, forKey: "app_lang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        bundle = Bundle(path: path!)
    }
}

extension String {
//    func localized(_ lang:String) ->String {
//        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.localizedBundle(), value: "", comment: "")
    }
    
    func localizeWithFormat(arguments: CVarArg...) -> String{
        return String(format: self.localized(), arguments: arguments)
    }
}

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
    
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
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
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func rect(withConstrainedWidth width: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox
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

extension UITextView {
    var caret: CGRect? {
        guard let selectedTextRange = self.selectedTextRange else { return nil }
        return self.caretRect(for: selectedTextRange.end)
    }
}
