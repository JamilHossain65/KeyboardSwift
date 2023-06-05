//
//  SharedClass.swift
//  KeyboardSwift
//
//  Created by Jamil on 1/11/21.
//


import Foundation

//app setting::9
//change app icon and bundle id in both app target and extension target
//app setting::8
var isProduction = false
let AD_MIN_TIME:TimeInterval = 10*60 //10 min

let SUITE_KEY = "group.com.vaticsoft.SmartKeyboard"
let USER_INFO_KEY = "UserSelectedInfo"
let kActiveLanguages  = "kActiveLanguages"

let SelectedLanguage = "SelectedLanguage"
let CountryCode  = "CountryCode"
let LanguageCode = "LanguageCode"


//supported language name
let English    = "English"
let Bangla     = "Bangla"
let BanglaGoti = "বাংলা"
let Indonesian = "Indonesian"
let Russian    = "Russian"
let Spanish    = "Spanish"
let French     = "French"
let German     = "German"
let Italian    = "Italian"
let Korean     = "Korean"
let Turkish    = "Turkish"
let Portuguese = "Portuguese"

let Gujarati   = "Gujarati"
let Hindi      = "Hindi"
let Kannada    = "Kannada"
let Malayalam  = "Malayalam"
let Marathi    = "Marathi"
let Nepali     = "Nepali"
let Oriya      = "Odia"
let Punjabi    = "Punjabi"
let Sanskrit   = "Sanskrit"
let Tamil      = "Tamil"
let Telugu     = "Telugu"
let Urdu       = "Urdu"

//app setting::2
var activeLanguages = [
    English :true,  Indonesian:false, Bangla    :false, Russian  :false,
    Spanish :false, French    :false,  German    :false,  Italian  :false,
    Korean  :false, Turkish   :false, Portuguese:false,
    //indian group
    Gujarati:false, Hindi    :false,  Kannada  :false,  Malayalam:false,
    Marathi :false, Nepali   :false,  Oriya    :false,  Punjabi  :false,
    Sanskrit:false, Tamil    :false,  Telugu   :false,  Urdu     :false,
    BanglaGoti :true,
]

var countryCodes  = [
    English :"us", Indonesian:"id", Bangla    :"bd", Russian  :"ru",
    Spanish :"es", French    :"fr", German    :"gr", Italian  :"it",
    Korean  :"ko", Turkish   :"tr", Portuguese:"pt",
    Gujarati:"",   Hindi     :"In", Kannada   :"",   Malayalam:"",
    Marathi :"",   Nepali    :"",   Oriya     :"",   Punjabi  :"",
    Sanskrit:"",   Tamil     :"",   Telugu    :"",   Urdu     :"",
    BanglaGoti    :"bd",
]

var languageCodes = [
    English :"en", Indonesian:"id", Bangla    :"bn", Russian  :"ru",
    Spanish :"es", French    :"fr", German    :"gr", Italian  :"it",
    Korean  :"ko", Turkish   :"tr", Portuguese:"pt",
    Gujarati:"gu", Hindi     :"hi", Kannada   :"kn", Malayalam:"ml",
    Marathi :"mr", Nepali    :"",   Oriya     :"or", Punjabi  :"pa",
    Sanskrit:"",   Tamil     :"ta", Telugu    :"te", Urdu     :"",
    BanglaGoti:"bn",
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
