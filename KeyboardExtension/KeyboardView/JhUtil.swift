//
//  KeyboardUtils.swift
//  KeyboardSwift
//
//  Created by Jamil on 24/2/21.
//

import UIKit

func log(_ msg: Any?) {
    #if DEBUG
    if let _msg = msg {
        print(String(describing: _msg))
    }
    #endif
}

//padding constant
let kPADDING_LEFT   = "PADDING_LEFT"
let kPADDING_RIGHT  = "PADDING_RIGHT"
let kPADDING_TOP    = "PADDING_TOP"
let kPADDING_BOTTOM = "PADDING_BOTTOM"
//
let k123String    = "123"
let kSymbolString = "#+="
let kAbcString    = "ABC"
let kReturnString = "Return"
let kSpaceString  = "Space"
let kStopSpace    = ". "
let kDoubleSpace  = "  "

//Constant Button Identifier
let kNL     = "\n"
let kSHIFT  = "SHIFT"
let kDELETE = "DELETE"
let kALTER  = "ALTER"
let kGLOBE  = "GLOBE"
let kVOICE  = "VOICE"
let kSPACE  = "SPACE"
let kRETURN = "RETURN"
let kSPECIAL = "\(kDELETE)৹ \(kNL)৹ \(kALTER)৹ \(kGLOBE)৹ \(kVOICE)৹ \(kSPACE)৹ \(kRETURN)"
let kSPECIALArray = [kDELETE,kNL, kALTER, kGLOBE, kVOICE, kSPACE, kRETURN]
let kSEPERATOR = "৹ "


//let kKeyBgColor   = "kKeyBgColor"
let kKeyBgImageName  = "kKeyBgImageName"
let kKeyTextColor    = "kKeyTextColor"
let kKeyAlphabetFont = "kKeyAlphabetFont"
let kSelectedFontName = "kSelectedFontName"
let kSelectedLanguageName = "kSelectedLanguageName"
let kSelectedHintString = "kSelectedHintString"

//letter mode
let NORMAL  = "Normal"
let SHIFT   = "Shift"
let NUMERIC = "Numeric"
let SYMBOL  = "Symbol"
let DOUBLE_TAP = "DoubleTap"

////supported language name
//let English = "English"
//let Bangla  = "Bangla"
//let Indonesian  = "Indonesian"

//let SUITE_KEY = "group.com.vaticsoft.SmartKeyboard"

enum HINT_BAR_TYPE:Int {
    case SETTING
    case HINT_WORD
}

enum KEY_SETTING_TYPE:Int {
    case FONT
    case BG_COLOR
    case TEXT_COLOR
    case LANGUAGE
}

enum WRITING_MODE:Int {
    case INSERTING
    case DELETING
}

enum WRITING_HAND:Int {
    case LEFT
    case RIGHT
}

enum LANGUAGE_GROUP:Int {
    case ENGLISH
    case ARABIC
    case INDIAN
    case CHINESE
}

var keyMode : String = SHIFT
var writingMode : WRITING_MODE  = .INSERTING
var hintBarType : HINT_BAR_TYPE = .SETTING

var languageGroup : LANGUAGE_GROUP   = .ENGLISH
var keySettingType: KEY_SETTING_TYPE = .LANGUAGE

var kKeyButtonColor  = UIColor.white
var kHighlightColor  = UIColor.white
var kKeyboardTextColor = UIColor.black
var kTextShadowColor   = UIColor.black
var dataSource:[String] = []

var kAltButtonColor  = UIColor.init(red: 172/255, green: 176/255, blue: 188/255, alpha: 1)
var kKeyboardBGColor = UIColor.init(red: 209/255, green: 212/255, blue: 219/255, alpha: 1)
var kHintButtonColor = UIColor.init(red: 174/255, green: 179/255, blue: 189/255, alpha: 1)
var kOffWhiteColor   = UIColor.init(red: 248/255, green: 240/255, blue: 227/255, alpha: 1)
var kBlueColor       = UIColor.init(red: 000/255, green: 122/255, blue: 255/255, alpha: 1)

//let kAlphabet = "q w e r t y u i o p a s d f g h j k l z x c v b n m"
//let kAlphabetEN = "Q W E R T Y U I O P A S D F G H J K L : Z X C V B N M"
//let kLetters    = kAlphabetEN.components(separatedBy: " ")

//var languageName = getString(kSelectedLanguageName) ?? English
//var fontsName    = getString(kSelectedFontName)     ?? NORMAL

var langName = getString(kSelectedLanguageName) ?? Spanish
var fontName = getString(kSelectedFontName)     ?? NORMAL


//set total keys in each row
//let kRowKeys = [10,9,9,5] //copy the same array in JHKey class //MARK:- todo refctor this

let hintBarHeight:CGFloat = 44 //36;

//Note: this is complex because this is ordered list,
//so this order you will see the language setting
let kAllLanguageDicArray = [
    [English   : kFontEnDic],
    [Bangla    : kFontBnDic],
    [Indonesian: kFontIdDic],
    [Russian   : kFontRuDic],
    
    [Spanish   : kFontEsDic],
    [French    : kFontFrDic],
    [German    : kFontGeDic],
    [Italian   : kFontItDic],
    [Korean    : kFontKoDic],
    [Turkish   : kFontTrDic],
    [Portuguese: kFontPtDic],
    
]

var currentFontLetters:[String] =  []

//this is all languages list of [String]
let supportedLanguages:[String] = kAllLanguageDicArray.map({$0.keys.first!})

//this not ordered list of type [String:Bool]
//var activeLanguages = [English:true,Indonesian:true,Bangla:true]
let langNameArray = supportedLanguages.filter({ activeLanguages.filter({$0.1}).map({$0.0})
                                                .contains($0)})

func getKeys(_ row:Int,_ fontString:String? = kUnicodeEnNormal) -> Int {
    log("fontString::\(fontString ?? "")")

    guard let rows = fontString?.components(separatedBy: kNL) else { return 0}
    
    var keys:[Int] = []
    for var str in rows {
        
        if str.prefix(1) == kSEPERATOR {
            str = String(str.dropFirst())
        }
        
        
        let _str = str.trimmingCharacters(in: .init(charactersIn: kSEPERATOR))
        let letters = _str.components(separatedBy: kSEPERATOR)
        log("Row[\(row)]<>::\(letters)")
        keys.append(letters.count)
    }
    
    log("keys==::\(keys)")
    
    if row >= keys.count{
        //MARK:- TODO: remove this crash
        keySettingType = .LANGUAGE
        setString(English, key: kSelectedLanguageName)
        setString(NORMAL, key: kSelectedFontName)
        
        return 0
    }
    return keys[row]
}

func getLettersInRows() -> [Int] {
    let keyArray = currentFontLetters.split(whereSeparator: {$0.contains(kNL)})
    var rows:[Int] = []
    for letters in keyArray{
        rows.append(letters.count)
    }
    return rows
}

func getIndex(_ title:String,_ fontString:[String]? = [])-> Int{
    let _fontString = fontString?.map({$0.trimmingCharacters(in: .whitespacesAndNewlines)})
    let index = _fontString?.firstIndex(of: title) ?? 0
    //log("index::<\(title)>\(index)")
    return index
}

func getAlphabetOf(_ language:String? = English,_ fontname:String? = NORMAL,_ keyMode:String) -> [String] {
    for dic in kAllLanguageDicArray {
        let key = dic.keys.first
        if key == language {
            for _dic in dic{
                for test in _dic.value {
                    if let _fontname = test.keys.filter({$0 == fontname}).first{
                        log("_fontname::\(_fontname) letterMode::\(keyMode)")
                        //log("test1::\(test)")
                        var _key = keyMode
                        if keyMode == NORMAL  {
                            _key = fontname!
                        }else if keyMode == DOUBLE_TAP {
                            _key = SHIFT
                        }
                        //log("_key::\(_key)")
                        let alphabetList = test[_key]
                        //log("alphabetList::\(alphabetList)")
                        return alphabetList ?? []
                    }
                }
            }
        }
    }
    return []
}


func getFontNamesOf(_ language:String) -> [String]{
    for dic in kAllLanguageDicArray {
        let key = dic.keys.first
        if key == language {
            for _dic in dic{
                //log("_dic::\(_dic)")
                let fontNameArray = _dic.value.compactMap({$0.keys.filter({$0 != SHIFT && $0 != NUMERIC && $0 != SYMBOL}).first})
                log("fontNameArray[\(fontNameArray)]::\(fontNameArray)")
                return fontNameArray
            }
        }
    }
    return [NORMAL]
}


//MARK:- Hint Letters
func getHintString() -> String {
    let langName = getString(kSelectedLanguageName)
    let fontName = getString(kSelectedFontName)
    
    switch langName {
    case Bangla:
        switch fontName {
        case NORMAL:
            return hintWordsBn
        default:
            return hintWordsBn
        }
        
    case Indonesian:
        switch fontName {
        default:
            return hintWordsId
        }
        
    case Russian:
        switch fontName {
        default:
            return hintWordsRu
        }
        
        
    case Spanish:
        switch fontName {
        default:
            return hintWordsEs
        }
    case French:
        switch fontName {
        default:
            return hintWordsFr
        }
    case German:
        switch fontName {
        default:
            return hintWordsGe
        }
    case Italian:
        switch fontName {
        default:
            return hintWordsIt
        }
    case Korean:
        switch fontName {
        default:
            return hintWordsKo
        }
    case Turkish:
        switch fontName {
        default:
            return hintWordsTr
        }
    case Portuguese:
        switch fontName {
        default:
            return hintWordsPt
        }
        
    default://English
        switch fontName {
        case NORMAL:
            return hintWordsEn
        case "Comic":
            return hintWordsEn
        default:
            return hintWordsEn
        }
    }
}

//MARK:- Read File Names of Selected Lanuage
func getFileName() -> String {
    let langName = getString(kSelectedLanguageName)
    
    switch langName {
    case Bangla:
        return "bangla.txt"
    case Indonesian:
        return "bahasa.txt"
    case Russian:
        return "russian.txt"
        
    case French:
        return "french.txt"
    case German:
        return "german.txt"
    case Italian:
        return "italian.txt"
    case Korean:
        return "korean.txt"
    case Spanish:
        return "spanish.txt"
    case Turkish:
        return "turkish.txt"
    case Portuguese:
        return "portuguese.txt"
        
    default:
        return "words.txt"
    }
}
