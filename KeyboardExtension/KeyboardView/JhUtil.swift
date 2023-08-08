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
//let k123String    = "123"
//let kSymbolString = "#+="
//let kAbcString    = "ABC"
//let kReturnString = "Return"
//let kSpaceString  = "Space"
//let kStopSpace    = ". "
//let kDoubleSpace  = "  "

//Constant Button Identifier
let kNL     = "\n"
let kSHIFT  = "SHIFT"
let kDELETE = "DELETE"
let kALTER  = "ALTER"
let kGLOBE  = "GLOBE"
let kVOICE  = "VOICE"
let kSPACE  = "SPACE"
let kRETURN = "RETURN"
let kAT_BUTTON = "@"

let kSPECIAL = "\(kDELETE)৹ \(kNL)৹ \(kALTER)৹ \(kGLOBE)৹ \(kVOICE)৹ \(kSPACE)৹ \(kRETURN)"
let kSPECIAL2 = "\(kDELETE) \(kNL) \(kALTER) \(kGLOBE) \(kVOICE) \(kSPACE) \(kAT_BUTTON) \(kRETURN)"
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

let NORMAL_REPLACE  = "NormalReplace"
let SHIFT_REPLACE   = "ShiftReplace"
let NUMERIC_REPLACE = "NumericReplace"
let SYMBOL_REPLACE  = "SymbolReplace"

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

enum LETTER_KEY_TYPE:Int {
    case ORIGINAL
    case REPLACE
}

var keyMode : String = NORMAL
var writingMode : WRITING_MODE  = .INSERTING
var hintBarType : HINT_BAR_TYPE = .SETTING

var languageGroup : LANGUAGE_GROUP   = .ENGLISH
var keySettingType: KEY_SETTING_TYPE = .LANGUAGE
var letterKeyType : LETTER_KEY_TYPE  = .ORIGINAL

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

//app setting:: 2
var langName = getString(kSelectedLanguageName) ?? Spanish
var fontName = getString(kSelectedFontName)     ?? NORMAL


//set total keys in each row
//let kRowKeys = [10,9,9,5] //copy the same array in JHKey class //MARK:- todo refctor this

let hintBarHeight:CGFloat = 44 //36;

//app setting:: 113
//Note: this is complex because this is ordered list,
//so this order you will see the language setting
let kAllLanguageDicArray = [
    [English   : kFontEnDic],
    [Bangla    : kFontBnDic],
    [BanglaGoti: kFontBnGotiDic],
    [BanglaDruti: kFontBnDrutiDic],
    [Indonesian: kFontIdDic],
    [Russian   : kFontRuDic],
    
    [Spanish   : kFontEsDic],
    [French    : kFontFrDic],
    [German    : kFontGeDic],
    [Italian   : kFontItDic],
    [Korean    : kFontKoDic],
    [Turkish   : kFontTrDic],
    [Portuguese: kFontPtDic],
    
    [Gujarati : kFontGuDic],
    [Hindi    : kFontHiDic],
    [Kannada  : kFontKnDic],
    [Malayalam: kFontMlDic],
    [Marathi  : kFontMrDic],
    [Nepali   : kFontNeDic],
    [Oriya    : kFontOrDic],
    [Punjabi  : kFontPaDic],
    [Sanskrit : kFontSaDic],
    [Tamil    : kFontTaDic],
    [Telugu   : kFontTeDic],
    [Urdu     : kFontUrDic],
    [Thai     : kFontThDic],
    [Burmese  : kFontBrDic],
    [JpHiragana  : kFontJpHiraDic],
    [JpKatakana  : kFontJpKataDic],
    
]

//this is all languages list of [String]
let supportedLanguages:[String] = kAllLanguageDicArray.map({$0.keys.first!})

//this not ordered list of type [String:Bool]
//var activeLanguages = [English:true,Indonesian:true,Bangla:true]
let langNameArray = supportedLanguages.filter({ activeLanguages.filter({$0.1}).map({$0.0})
                                                .contains($0)})

var currentFontLetters:[String] =  []

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

func getReplacedAlphabetOf(_ language:String? = English,_ fontname:String? = NORMAL,_ keyMode:String) -> [String] {
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
        
    case BanglaGoti:
        switch fontName {
        case NORMAL:
            return hintWordsBnGoti
        default:
            return hintWordsBnGoti
        }
    case BanglaDruti:
        switch fontName {
        case NORMAL:
            return hintWordsBnDruti
        default:
            return hintWordsBnDruti
        }
        
    case Gujarati:
        switch fontName {
        default:
            return hintWordsGu
        }
        
    case Hindi:
        switch fontName {
        default:
            return hintWordsHi
        }
        
    case Kannada:
        switch fontName {
        default:
            return hintWordsKn
        }
    case Malayalam:
        switch fontName {
        default:
            return hintWordsMl
        }
    case Marathi:
        switch fontName {
        default:
            return hintWordsMr
        }
    case Nepali:
        switch fontName {
        default:
            return hintWordsNe
        }
    case Oriya:
        switch fontName {
        default:
            return hintWordsOr
        }
    case Punjabi:
        switch fontName {
        default:
            return hintWordsPa
        }
    case Sanskrit:
        switch fontName {
        default:
            return hintWordsSa
        }
    case Tamil:
        switch fontName {
        default:
            return hintWordsTa
        }
    case Telugu:
        switch fontName {
        default:
            return hintWordsTe
        }
        
    case Urdu:
        switch fontName {
        default:
            return hintWordsUr
        }
        
        //indian end
        
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
        
    case Portuguese:
        switch fontName {
        default:
            return hintWordsPt
        }
    case JpHiragana:
        switch fontName {
        default:
            return hintWordsJpHiragana
        }
    case JpKatakana:
        switch fontName {
        default:
            return hintWordsJpKata
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
    case Gujarati:
        return "gujrati.txt"
    case Hindi:
        return "hindi.txt"
    case Kannada:
        return "kannada.txt"
    case Malayalam:
        return "malayalam.txt"
    case Marathi:
        return "marathi.txt"
    case Nepali:
        return "nepali.txt"
    case Oriya:
        return "oriya.txt"
    case Punjabi:
        return "punjabi.txt"
    case Sanskrit:
        return "sanskrit.txt"
    case Tamil:
        return "tamil.txt"
    case Telugu:
        return "telugu.txt"
    case Urdu:
        return "urdu.txt"
        //
    case Bangla:
        return "bangla.txt"
    case BanglaGoti:
        return "bangla.txt"
    case BanglaDruti:
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
    case Thai:
        return "thai.txt"
    case Burmese:
        return "burmese.txt"
    case JpHiragana:
        return "japanese.txt"
    case JpKatakana:
        return "japanese.txt"
        
    default:
        return "words.txt"
    }
}

//get modified space before a button
func getModifiedSpace(_ row:Int) -> [Int:Int]{
    let array = getLettersInRows()
    //print("array[row]:::\(array[row])")
    
    switch row {
    case array.count - 1 ://Last row
        break
    case array.count - 2 ://shift and delete row
        if array[row] <= 9{
            return [1:7, abs(array[row]-1):7]
        }
        break
    default:
        if array[row] == 9 { //Handle case for 2nd row of english language
            return [0:15, 9:15]
        }
        break
    }
    
    return [:]
}

//get modified button width
func getModifiedWidth(_ row:Int)-> [Int:Int]{
    let array = getLettersInRows()
    //print("array:::\(array[row])")
    
    switch row {
    case abs(array.count - 1) ://Last row
        switch langName {
        case Korean: //an extra '@' button
            return [0:40, 1:30,2:30,4:30,5:50]
        default:
            return [0:40, 1:30,2:30,4:80]
        }
    case abs(array.count - 2) ://shift and delete row
        switch langName {
        case Russian:
            if keyMode == NORMAL || keyMode == SHIFT{
                return [0:30, abs(array[row]-1):30]
            }
        default:
            return [0:40, abs(array[row]-1):40]
        }
        
    default:
        break
    }
    
    return [:]
}
