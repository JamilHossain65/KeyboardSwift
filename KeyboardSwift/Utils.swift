//
//  Event.swift
//  Event
//
//  Created by Jamil on 2/3/21.
//

import UIKit
import Foundation
import MBProgressHUD

func log(_ msg: Any?) {
    #if DEBUG
    if let _msg = msg {
        print(String(describing: _msg))
    }
    #endif
}

func showAlertOkay(title: String? = "", message:String? = "", completion: @escaping (Bool) -> () = {_ in}) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    //alert.view.tintColor = UIColor.hex_17181a()
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
        completion(true)
    }))
    
    let window = UIApplication.shared.keyWindow
    window?.rootViewController?.present(alert, animated: true, completion: nil)
}

func flag(from country:String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.uppercased().unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return s
}

//MARK:- SHARED DATA
//https://learnappmaking.com/notification-center-how-to-swift/
//notification
func setNotify(_ controller:UIViewController) {
    // Register to receive notification in your class
    //NotificationCenter.defaultCenter.addObserver(controller, selector: #selector(controller.loadRecordingUI), name: "notificationName", object: nil)
}

// handle notification
func showSpinningWheel(notification: NSNotification) {
    
    
    if let image = notification.userInfo?["image"] as? UIImage {
        // do something with your image
    }
}

//MARK:- SHARED DATA
//read and write userdefault data
//func setObject(_ value:Any, key:String) {
//    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
//    defaultSuite?.setValue(value, forKey: SUITE_KEY)
//    defaultSuite?.synchronize()
//}
//
//func getObject(_ forKey:String) -> Any {
//    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
//    return defaultSuite?.value(forKey: SUITE_KEY) as Any
//}

class Utils:NSObject{
    //MARK: - FROM OLD CODE BR KEBOARD
    class func showAlertOkay(title: String? = "", message:String? = "", completion: @escaping (Bool) -> () = {_ in}) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //alert.view.tintColor = UIColor.hex_17181a()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            completion(false)
        }))
        
        alert.addAction(UIAlertAction(title: "Buy", style: .default, handler: { (_) in
            completion(true)
        }))

//        let adsManager:AdsManager =  AdsManager.sharedInstance() as! AdsManager
//        let window = adsManager.application.keyWindow
//        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    class func showAlert(title: String? = "", message:String? = "", completion: @escaping (Bool) -> () = {_ in}) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            completion(true)
        }))

//        let adsManager:AdsManager =  AdsManager.sharedInstance() as! AdsManager
//        let window = adsManager.application.keyWindow
//        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }

    class func getIpLocation(completion: @escaping(NSDictionary?, Error?) -> Void)
    {
        let url     = URL(string: "http://ip-api.com/json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let content = data {
                    do {
                        if let object = try JSONSerialization.jsonObject(with: content, options: .allowFragments) as? NSDictionary {
                            completion(object, error)
                        }
                        else {
                            // TODO: Create custom error.
                            completion(nil, nil)
                        }
                    }
                    catch {
                        // TODO: Create custom error.
                        completion(nil, nil)
                    }
                } else {
                    completion(nil, error)
                }
            }
        }).resume()
    }
}

extension String {
    func toDate(formatter: String? = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current // set locale to reliable US_POSIX
        if let date = dateFormatter.date(from:self) {
            return date
        }
        return nil
    }
}

extension UIView{
    func showProgressHUD(){
        //MBProgressHUD.showAdded(to: self, animated: true)
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.label.text = ""
        hud.isUserInteractionEnabled = false
    }
    
    func hideProgressHUD(){
        MBProgressHUD.hide(for: self, animated: true)
    }
    
}

func loading(view:UIView, stop:Bool){
    let frame = CGRect(x: 10, y: 10, width: 100, height: 100)
    guard let confettiImageView = UIImageView.fromGif(frame: view.frame, resourceName: "busy") else { return }
    confettiImageView.frame = frame
    
    //DispatchQueue.main.async {
    view.addSubview(confettiImageView)
    
    
    if confettiImageView.isAnimating{
        confettiImageView.stopAnimating()
    }
    
    if stop {
        confettiImageView.stopAnimating()
    }else{
        confettiImageView.startAnimating()
    }
    //}
}

extension UIImageView {
    static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
              let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
}

//extension String {
//    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//    
//        return ceil(boundingBox.height)
//    }
//
//    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//
//        return ceil(boundingBox.width)
//    }
//}


extension UITextView {
    var caret: CGRect? {
        guard let selectedTextRange = self.selectedTextRange else { return nil }
        return self.caretRect(for: selectedTextRange.end)
    }
}

extension Locale {
//    func countryCode(by countryName: String) -> String? {
//        return Locale.isoRegionCodes.first(where: { code -> Bool in
//            guard let localizedCountryName = localizedString(forRegionCode: code) else {
//                return false
//            }
//            return localizedCountryName.lowercased() == countryName.lowercased()
//        })
//    }
    
    func languageCode(by languageName: String) -> String? {
        return Locale.isoLanguageCodes.first(where: { code -> Bool in
            guard let localizedLangName = localizedString(forLanguageCode: code) else {
                return false
            }
            return localizedLangName.lowercased() == languageName.lowercased()
        })
    }
    
    func languageCodes(by languageNames: [String]) -> [String]? {
        var langCodes:[String] = []
        
        for langName in languageNames{
            let locale = Locale(identifier: "en_US")
            let languageCode = locale.languageCode(by: langName) ?? ""
            langCodes.append(languageCode)
        }
        
        langCodes = langCodes.filter({$0.count > 0})
        return langCodes
    }
    
//    func countryCode(by languageName: String) -> String? {
//        return Locale.isoRegionCodes.first(where: { code -> Bool in
//            guard let localizedLangName = localizedString(forRegionCode: code) else {
//                return false
//            }
//            return localizedLangName.lowercased() == languageName.lowercased()
//        })
//    }
    
    func countryCode(by languageName: String) -> String? {
        let _languageName = languageName + "_"
        let _countryCode = Locale.availableIdentifiers.filter({$0.contains(_languageName)}).last?.replacingOccurrences(of: _languageName, with: "")
        return _countryCode
    }
    
    func countryCodes(by languageNames: [String]) -> [String]? {
        var cntryCodes:[String] = []
        
        for langName in languageNames{
            let locale = Locale(identifier: "en_US")
            if let languageCode = locale.languageCode(by: langName){
                if let countryCode  = locale.countryCode(by: languageCode){
                    cntryCodes.append(countryCode)
                }
            }
        }
        return cntryCodes //cntryCodes.filter({$0.count > 0})
    }
}

extension String {
    func read() -> String {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(self)
            print("fileURL::\(fileURL)")
            
            //reading
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                print("text::\(text)")
                return text
            }
            catch {/* error handling here */}
        }
        return ""
    }
    
    func write(_ text:String) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(self)

            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
    
    func readFile() -> String{
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(self)

            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                return text2
            }
            catch {/* error handling here */}
        }
        return ""
    }
}

class BaseViewController: UIViewController {

    var hideStatusBar: Bool = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var prefersStatusBarHidden: Bool {
           return hideStatusBar
    }
    
    //implement like this way
    //hideStatusBar = true
}

extension UINavigationController {
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
}




