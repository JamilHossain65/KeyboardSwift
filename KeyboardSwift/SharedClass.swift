//
//  SharedClass.swift
//  KeyboardSwift
//
//  Created by Jamil on 1/11/21.
//


import Foundation

let SUITE_KEY = "group.com.vaticsoft.SmartKeyboard"
let USER_INFO_KEY = "UserSelectedInfo"
let kActiveLanguages  = "kActiveLanguages"

let CountryCode  = "CountryCode"
let LanguageCode = "LanguageCode"


//supported language name
let English = "English"
let Bangla  = "Bangla"
let Indonesian  = "Indonesian"

var activeLanguages = [English:true, Indonesian:true, Bangla:false]
var countryCodes  = [English:"us",Indonesian:"id",Bangla:"bd"]
var languageCodes = [English:"en",Indonesian:"id",Bangla:"bn"]

//MARK:- SHARED DATA
//read and write userdefault data
func setObject(_ value:Any, key:String) {
    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
    defaultSuite?.setValue(value, forKey: key)
    defaultSuite?.synchronize()
}

func getObject(_ forKey:String) -> Any {
    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
    return defaultSuite?.value(forKey: forKey) as Any
}

//read and write userdefault string
func setString(_ value:String, key:String) {
    let defaults = UserDefaults()
    defaults.setValue(value, forKey: key)
    defaults.synchronize()
}

func getString(_ forKey:String) -> String? {
    let defaults = UserDefaults()
    return defaults.string(forKey: forKey)
}


//read and write userdefault data
func setData(_ data:Any, key:String) {
    let defaultSuite = UserDefaults()
    defaultSuite.setValue(data, forKey: key)
    defaultSuite.synchronize()
}

func getData(_ forKey:String) -> Any {
    let defaultSuite = UserDefaults()
    return defaultSuite.value(forKey: forKey) as Any
}


extension NSObject {
    var thisClassName: String {
        return NSStringFromClass(type(of: self))
    }
}


//extension Range{
//    func range(_ start:Int, _ length:Int) -> Range<String.Index> {
//        let i = self.index(start >= 0 ? self.startIndex : self.endIndex,
//            offsetBy: start)
//        let j = self.index(i, offsetBy: length)
//        return i..<j
//    }
//}

//extension UITextDocumentProxy {
//    func text() {
//        let textLeft  = documentContextBeforeInput ?? ""
//        let textRight = documentContextAfterInput ?? ""
//        let fullText  = textLeft + textRight
//        
//    }
//}
