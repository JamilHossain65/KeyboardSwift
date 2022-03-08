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


var activeLanguages = [
    English :true, Indonesian:false, Bangla    :true,  Russian  :false,
    Spanish :false,French    :false, German    :false, Italian  :false,
    Korean  :false,Turkish   :false, Portuguese:false,
    Gujarati:true, Hindi     :true,  Kannada   :true,  Malayalam:true,
    Marathi :true, Nepali    :false, Oriya     :true,  Punjabi  :true,
    Sanskrit:false,Tamil     :true,  Telugu    :true,  Urdu     :false,
]

var countryCodes  = [
    English:"us", Indonesian:"id", Bangla    :"bd", Russian:"ru",
    Spanish:"es", French    :"fr", German    :"gr", Italian:"it",
    Korean :"ko", Turkish   :"tr", Portuguese:"pt",
    Gujarati:"", Hindi :"In", Kannada :"",  Malayalam:"",
    Marathi :"", Nepali:"", Oriya   :"",  Punjabi:"",
    Sanskrit:"", Tamil :"", Telugu  :"",  Urdu:"",
]

var languageCodes = [
    English:"en", Indonesian:"id", Bangla    :"bn", Russian:"ru",
    Spanish:"es", French    :"fr", German    :"gr", Italian:"it",
    Korean :"ko", Turkish   :"tr", Portuguese:"pt",
    Gujarati:"", Hindi :"Hi", Kannada :"",  Malayalam:"",
    Marathi :"", Nepali:"", Oriya   :"",  Punjabi:"",
    Sanskrit:"", Tamil :"", Telugu  :"",  Urdu:"",
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
