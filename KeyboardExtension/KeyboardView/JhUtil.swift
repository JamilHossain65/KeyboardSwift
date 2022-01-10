//
//  KeyboardUtils.swift
//  KeyboardSwift
//
//  Created by Jamil on 24/2/21.
//

import UIKit

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

//let kKeyBgColor   = "kKeyBgColor"
let kKeyBgImageName  = "kKeyBgImageName"
let kKeyTextColor    = "kKeyTextColor"
let kKeyAlphabetFont = "kKeyAlphabetFont"
let kSelectedFontName = "kSelectedFontName"
let kSelectedLanguageName = "kSelectedLanguageName"
let kSelectedHintString   = "kSelectedHintString"

//letter mode
let NORMAL  = "Normal"
let SHIFT   = "Shift"
let NUMERIC = "Numeric"
let SYMBOL  = "Symbol"
let DOUBLE_TAP = "DoubleTap"

//supported language name
let English = "English"
let Bangla  = "Bangla"

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

var keySettingType: KEY_SETTING_TYPE = .LANGUAGE
var hintBarType   : HINT_BAR_TYPE    = .SETTING
var keyMode : String  = SHIFT


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
let kAlphabetEN = "Q W E R T Y U I O P A S D F G H J K L : Z X C V B N M"
let kLetters    = kAlphabetEN.components(separatedBy: " ")

//set total keys in each row
let kRowKeys = [10,9,9,5] //copy the same array in JHKey class //MARK:- todo refctor this

let hintBarHeight:CGFloat = 44 //36;

let kAllLanguageDicArray = [
    [English  : kFontEnDic],
    [Bangla   : kFontBnDic],
]

let langNameArray = kAllLanguageDicArray.map({$0.keys.first!})

func getAlphabetOf(_ language:String? = English,_ fontname:String? = NORMAL,_ keyMode:String) -> [String] {
    for dic in kAllLanguageDicArray {
        let key = dic.keys.first
        if key == language {
            for _dic in dic{
                for test in _dic.value {
                    if let _fontname = test.keys.filter({$0 == fontname}).first{
                        print("_fontname::\(_fontname) letterMode::\(keyMode)")
                        //print("test1::\(test)")
                        var _key = keyMode
                        if keyMode == NORMAL  {
                            _key = fontname!
                        }else if keyMode == DOUBLE_TAP {
                            _key = SHIFT
                        }
                        //print("_key::\(_key)")
                        let alphabetList = test[_key]
                        //print("alphabetList::\(alphabetList)")
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
                //print("_dic::\(_dic)")
                let fontNameArray = _dic.value.compactMap({$0.keys.filter({$0 != SHIFT && $0 != NUMERIC && $0 != SYMBOL}).first})
                print("fontNameArray[\(fontNameArray)]::\(fontNameArray)")
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
        
    default:
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
