//
//  SharedClass.swift
//  KeyboardSwift
//
//  Created by Jamil on 1/11/21.
//


import Foundation

let SUITE_KEY = "group.com.vaticsoft.SmartKeyboard"


//MARK:- SHARED DATA
//read and write userdefault data
func setObject(_ value:Any, key:String) {
    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
    defaultSuite?.setValue(value, forKey: SUITE_KEY)
    defaultSuite?.synchronize()
}

func getObject(_ forKey:String) -> Any {
    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
    return defaultSuite?.value(forKey: SUITE_KEY) as Any
}

//extension UITextDocumentProxy {
//    func text() {
//        let textLeft  = documentContextBeforeInput ?? ""
//        let textRight = documentContextAfterInput ?? ""
//        let fullText  = textLeft + textRight
//        
//    }
//}
