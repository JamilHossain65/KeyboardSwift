//
//  Event.swift
//  Event
//
//  Created by Jamil on 2/3/21.
//

import UIKit
import MBProgressHUD

func log(_ msg: Any?) {
    #if DEBUG
    if let _msg = msg { print(String(describing: _msg)) }
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

//class Utils:NSObject{
//
//}

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



