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
let English    = "English"
let Bangla     = "Bangla"
let Indonesian = "Indonesian"
let Russian    = "Russian"
let Spanish    = "Spanish"
let French     = "French"
let German     = "German"
let Italian    = "Italian"
let Korean     = "Korean"
let Turkish    = "Turkish"
let Portuguese = "Portuguese"

var activeLanguages = [
    English:true,  Indonesian:false,  Bangla    :false,  Russian:false,
    Spanish:false,  French   :false,   German   :true,  Italian:false,
    Korean :false, Turkish   :false,  Portuguese:false,
]
var countryCodes  = [
    English:"us", Indonesian:"id", Bangla    :"bd", Russian:"ru",
    Spanish:"es", French    :"fr", German    :"gr", Italian:"it",
    Korean :"ko", Turkish   :"tr", Portuguese:"pt",
]
var languageCodes = [
    English:"en", Indonesian:"id", Bangla    :"bn", Russian:"ru",
    Spanish:"es", French    :"fr", German    :"gr", Italian:"it",
    Korean :"ko", Turkish   :"tr", Portuguese:"pt",
]

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
