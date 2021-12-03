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
let kAbcString    = "ABC"
let kReturnString = "Return"
let kSpaceString  = "Space"

//let kKeyBgColor   = "kKeyBgColor"
let kKeyBgImageName  = "kKeyBgImageName"
let kKeyTextColor    = "kKeyTextColor"
let kKeyAlphabetFont = "kKeyAlphabetFont"

//let SUITE_KEY = "group.com.vaticsoft.SmartKeyboard"

enum KEYBOARD_TYPE:Int {
    case FONT
    case COLOR
    case TEXT_COLOR
}

var keyboard = KEYBOARD_TYPE.FONT

var kKeyButtonColor  = UIColor.white
var kHighlightColor  = UIColor.white
var kKeyboardTextColor = UIColor.black
var kTextShadowColor   = UIColor.black
var kTextFontAlphabet:[String] = []

var kAltButtonColor  = UIColor.init(red: 172/255, green: 176/255, blue: 188/255, alpha: 1)
var kKeyboardBGColor = UIColor.init(red: 209/255, green: 212/255, blue: 219/255, alpha: 1)
var kHintButtonColor = UIColor.init(red: 174/255, green: 179/255, blue: 189/255, alpha: 1)
var kOffWhiteColor   = UIColor.init(red: 248/255, green: 240/255, blue: 227/255, alpha: 1)
var kBlueColor       = UIColor.init(red: 000/255, green: 122/255, blue: 255/255, alpha: 1)

//let kAlphabet = "q w e r t y u i o p a s d f g h j k l z x c v b n m"
let kAlphabetEN = "Q W E R T Y U I O P A S D F G H J K L : Z X C V B N M"
let kLetters    = kAlphabetEN.components(separatedBy: " ")

//set total keys in each row
let kRowKeys = [10,9,9,5] //copy the same array in JHKey class //todo refctor this

let hintBarHeight:CGFloat = 44 //36;

////read and write userdefault data
//func setObject(_ value:Any, key:String) {
//    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
//    defaultSuite?.setValue(value, forKey: SUITE_KEY)
//    defaultSuite?.synchronize()
//}
//
//func getObject(_ forKey:String) -> Any {
//    let defaultSuite = UserDefaults(suiteName: SUITE_KEY)
//    return defaultSuite?.value(forKey: SUITE_KEY) as Any
//}
