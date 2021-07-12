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



