//
//  SharedClass.swift
//  KeyboardSwift
//
//  Created by Jamil on 1/11/21.
//


import Foundation

//app setting::4
var isProduction = false
//app setting::301
var isProVersion = false
let AD_MIN_TIME:TimeInterval = 10*60 //10 min
let AD_APPODEAL_MIN_TIME:TimeInterval = 10*60 //60 min
let kPrevAdShownTime = "kPrevAdShownTime"

var appSchemeName: String {
    get {
        let langName = getString(SelectedLanguage)
        
        switch langName {
        case Bangla:
            return ""
        case BanglaGoti:
            return "KeyboardGoti"
        case BanglaDruti:
            return "DrutiKeyboard"
        case Thai:
            return "VaticSoftThaiKeyboard"
        case Gujarati:
            return ""
        case Hindi:
            return ""
        case Kannada:
            return ""
        case Malayalam:
            return ""
        case Marathi:
            return ""
        case Nepali:
            return ""
        case Oriya:
            return ""
        case Punjabi:
            return ""
        case Sanskrit:
            return ""
        case Tamil:
            return ""
        case Telugu:
            return ""
        case Urdu:
            return ""
        case Indonesian:
            return ""
        case Russian:
            return "RussianKeyboard"
        case Spanish:
            return "SpanishKeyboard"
        case French:
            return ""
        case German:
            return ""
        case Italian:
            return ""
        case Korean:
            return ""
        case Turkish:
            return ""
        case Portuguese:
            return ""
        case Burmese:
            return "BurmeseKeyboard"
        case JpHiragana:
            return "VaticSoftJapaneseKeyboardOld"
        case JpKatakana:
            return ""
        case SmartFonts:
            return "SmartFonts"
        default://English
            //app setting::5
            return "KeyboardGoti"
        }
    }
}
//app setting::9
var SUITE_KEY: String {
    get {
        let langName = getString(SelectedLanguage)
        
        switch langName {
        case Bangla:
            return "group."
        case BanglaGoti:
            return "group.com.jamil.BanglaKeyboard"
        case BanglaDruti:
            return "group."
        case Thai:
            return "group.com.vaticsoft.ThaiKeyboard"
        case Gujarati:
            return ""
        case Hindi:
            return ""
        case Kannada:
            return ""
        case Malayalam:
            return ""
        case Marathi:
            return ""
        case Nepali:
            return ""
        case Oriya:
            return ""
        case Punjabi:
            return ""
        case Sanskrit:
            return ""
        case Tamil:
            return ""
        case Telugu:
            return ""
        case Urdu:
            return ""
        case Indonesian:
            return ""
        case Russian:
            return "group.com.vaticsoft.russian.keyboard"
        case Spanish:
            return "group."
        case French:
            return "group."
        case German:
            return "group."
        case Italian:
            return ""
        case Korean:
            return ""
        case Turkish:
            return ""
        case Portuguese:
            return ""
        case Burmese:
            return "group."
        case JpHiragana:
            return "group."
        case JpKatakana:
            return "group."
        case SmartFonts:
            return "group."
        default://English
            return "group.com.vaticsoft.ThaiKeyboard"
        }
    }
}

enum AD_LOADING_STATUS:Int {
    case NOT_REQUESTED
    case REQUESTED
    case LOADING
    case LOADED
    case SHOWING
}

var adLoadingStatus:AD_LOADING_STATUS = .NOT_REQUESTED
//let kAdLoadingStatus = "kAdLoadingStatus"
var isAppActive = false

let kIsPurchaed = "kIsPurchaed"
let kIsAppUsed = "kIsAppUsed"

let USER_INFO_KEY = "UserSelectedInfo"
let kActiveLanguages  = "kActiveLanguages"

let SelectedLanguage = "SelectedLanguage"
let CountryCode  = "CountryCode"
let LanguageCode = "LanguageCode"


//supported language name
let English    = "English"
let Bangla     = "Bangla"
let BanglaGoti = "বাংলা"
let BanglaDruti = "দ্রুতি"
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
let Thai       = "Thai"
let JpHiragana = "ひらがな" //MARK: - Todo
let JpKatakana = "Katakana"
let Burmese    = "မြန်မာ"
let SmartFonts  = "SmartFonts"

//app setting::1
var activeLanguages = [
    English :true,  Indonesian:false, Bangla    :false, Russian  :false,
    Spanish :false, French    :false, German    :false, Italian  :false,
    Korean  :false, Turkish   :false, Portuguese:false,
    //indian group
    Gujarati:false, Hindi    :false,  Kannada  :false,  Malayalam:false,
    Marathi :false, Nepali   :false,  Oriya    :false,  Punjabi  :false,
    Sanskrit:false, Tamil    :false,  Telugu   :false,  Urdu     :false,
    BanglaGoti:true, BanglaDruti:false, Thai  :false,  JpHiragana:false,
    JpKatakana:false, Burmese:false,
]

var countryCodes  = [
    English :"us", Indonesian:"id", Bangla    :"bd", Russian  :"ru",
    Spanish :"es", French    :"fr", German    :"gr", Italian  :"it",
    Korean  :"ko", Turkish   :"tr", Portuguese:"pt",
    Gujarati:"",   Hindi     :"In", Kannada   :"",   Malayalam:"",
    Marathi :"",   Nepali    :"",   Oriya     :"",   Punjabi  :"",
    Sanskrit:"",   Tamil     :"",   Telugu    :"",   Urdu     :"",
    BanglaGoti:"bdG", BanglaDruti:"bd", Thai :"th",  JpHiragana :"jp", //Goti need change 'bd'
    JpKatakana :"jpk", Burmese:"mm"
]

var languageCodes = [
    English :"en", Indonesian:"id", Bangla    :"bn", Russian  :"ru",
    Spanish :"es", French    :"fr", German    :"gr", Italian  :"it",
    Korean  :"ko", Turkish   :"tr", Portuguese:"pt",
    Gujarati:"gu", Hindi     :"hi", Kannada   :"kn", Malayalam:"ml",
    Marathi :"mr", Nepali    :"",   Oriya     :"or", Punjabi  :"pa",
    Sanskrit:"",   Tamil     :"ta", Telugu    :"te", Urdu     :"",
    BanglaGoti:"bn", BanglaDruti:"bn", Thai :"th", JpHiragana :"ja",
    JpKatakana :"jak", Burmese:"my"
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

//MARK: - Ad Shown Time
func getCurrentTime() ->TimeInterval{
    let timeStamp = TimeInterval(1000 * Date().timeIntervalSince1970)
    return timeStamp
}

func savePreAdShownTime(sec:TimeInterval? = 0){
    let currentTime = getCurrentTime() + sec!
    print("prev ad shwon Time::\(currentTime)")
    setObject(currentTime, key: kPrevAdShownTime)
}

func getPreAdShownTime() -> TimeInterval{
    let tm = getObject(kPrevAdShownTime) as? TimeInterval ?? getCurrentTime()
    return tm
}
