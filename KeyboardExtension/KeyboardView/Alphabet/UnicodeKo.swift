//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}

enum KOREAN_BLOCK_TYPE:Int {
    case INITIAL
    case MEDIAL
    case FINAL
}

var kOREAN_BLOCK_TYPE:KOREAN_BLOCK_TYPE = .INITIAL


let kFontKoDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersKoNormal,
     SHIFT  :kUnicodeLettersKoNormalShift,
     NUMERIC:kUnicodeLettersKoNumList,
     SYMBOL :kUnicodeLettersKoPuncuation],
]

let kUnicodeLettersKoPuncuation   = kUnicodeKoPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersKoNumList      = kUnicodeKoNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersKoNormal       = kUnicodeKoNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersKoNormalShift  = kUnicodeKoNormalShift .components(separatedBy: kSEPERATOR)

//let kUnicodeLettersKoNormal       = ["ㅂ","ㅈ","ㄷ","ㄱ","ㅅ","ㅛ","ㅕ","ㅑ","ㅐ","ㅔ",kNL,
//                                     "ㅁ","ㄴ","ㅇ","ㄹ","ㅎ","ㅗ","ㅓ","a","\u{3163}",kNL,
//                                     kSHIFT,"ㅋ","ㅌ","ㅊ","ㅍ","ㅠ","ㅜ","ㅡ"] + kSPECIALArray
//\u{2019} 먀 묘 미
//Default font


let initialBlock = ["ᄀ","ㄲ","ㄴ","ㄷ","ㄸ",
                    "ㄹ","ㅁ","ㅂ","ㅃ","ㅅ",
                    "ㅆ","ㅇ","ㅈ","ㅉ","ㅋ",
                    "ㅌ","ㅍ","ㅎ"
]
/*
       ᄀ    4.    ㄸ    8.    ㅃ    12.    ㅈ    16.    ㅌ
 1.    ㄲ    5.    ㄹ    9.    ㅅ    13.    ㅉ    17.    ㅍ
 2.    ㄴ    6.    ㅁ    10.    ㅆ    14.    ㅊ    18.    ㅎ
 3.    ㄷ    7.    ㅂ    11.    ㅇ    15.    ㅋ
 */

let medialBlock = ["ㅏ","ㅐ","ㅑ",
                   "ㅒ","ㅓ","ㅔ",
                   "ㅕ","ㅖ","ㅗ",
                   "ㅘ","ㅙ","ㅚ",
                   "ㅛ","ㅜ","ㅝ",
                   "ㅞ","ㅟ","ㅠ",
                   "ㅡ","ㅢ","ㅣ",
                   
]

/*
 0.    ㅏ    7.    ㅖ    14.    ㅝ
 1.    ㅐ    8.    ㅗ    15.    ㅞ
 2.    ㅑ    9.    ㅘ    16.    ㅟ
 3.    ㅒ    10.    ㅙ    17.    ㅠ
 4.    ㅓ    11.    ㅚ    18.    ㅡ
 5.    ㅔ    12.    ㅛ    19.    ㅢ
 6.    ㅕ    13.    ㅜ    20.    ㅣ
 */

let finalBlock = ["","ㄱ","ㄲ","ㄳ",
                    "ㄴ","ㄵ","ㄶ","ㄷ",
                    "ㄹ","ㄺ","ㄻ","ㄼ",
                    "ㄽ","ㄾ","ㄿ","ㅀ",
                    "ㅁ","ㅂ","ㅄ","ㅅ",
                    "ㅆ","ㅇ","ㅈ","ㅊ",
                    "ㅋ","ㅌ","ㅍ","ㅎ",
]

/*
 0.    None    7.    ㄷ    14.    ㄿ    21.    ㅇ
 1.    ㄱ    8.    ㄹ    15.    ㅀ    22.    ㅈ
 2.    ㄲ    9.    ㄺ    16.    ㅁ    23.    ㅊ
 3.    ㄳ    10.    ㄻ    17.    ㅂ    24.    ㅋ
 4.    ㄴ    11.    ㄼ    18.    ㅄ    25.    ㅌ
 5.    ㄵ    12.    ㄽ    19.    ㅅ    26.    ㅍ
 6.    ㄶ    13.    ㄾ    20.    ㅆ    27.    ㅎ
 */

//Equation
//((initial * 588) + (medial * 28) + final) + 44032
func hexToString(_ hex: String) -> String? {
    guard hex.count % 2 == 0 else {
        return nil
    }

    var bytes = [CChar]()

    var startIndex = hex.index(hex.startIndex, offsetBy: 4)
    print("startIndex::\(startIndex)")
    
    while startIndex < hex.endIndex {
        let endIndex = hex.index(startIndex, offsetBy: 4)
        let substr = hex[startIndex..<endIndex]

        print("endIndex::\(endIndex)")
        print("substr::\(substr)")
        
        if let byte = Int8(substr, radix: 16) {
            bytes.append(byte)
        } else {
            return nil
        }

        startIndex = endIndex
    }

    bytes.append(0)
    return String(cString: bytes)
}

func hexToStr(text: String) -> String {

    let regex = try! NSRegularExpression(pattern: "(0x)?([0-9A-Fa-f]{2})", options: .caseInsensitive)
    let textNS = text as NSString
    let matchesArray = regex.matches(in: textNS as String, options: [], range: NSMakeRange(0, textNS.length))
    
    
    let characters = matchesArray.map {
        Character(UnicodeScalar(UInt32(textNS.substring(with: $0.range(at: 2)), radix: 16)!)!)
    }

    return String(characters)
}

func shouldCombined(_ text:String)-> Bool {
    var isCombined = false
    let lastText = String(text.suffix(1))
    if initialBlock.contains(lastText){
        isCombined = true
    }else if medialBlock.contains(lastText){
        isCombined = true
    }else if finalBlock.contains(lastText){
        isCombined = true
    }else{
        kOREAN_BLOCK_TYPE = .INITIAL
        isCombined = false
    }
    return isCombined
}

func combinedUnicode(_ text:String)-> String {
    var counter  = 0
    switch kOREAN_BLOCK_TYPE {
    case .INITIAL:
        let letter1 = text.suffix(1)
        print("letter1:::\(letter1)")
        let initalValue = initialBlock.firstIndex(of: String(letter1)) ?? 0
        counter = initalValue*588
        kOREAN_BLOCK_TYPE = .MEDIAL
        return text
    case .MEDIAL:
        let letter1 = text.suffix(2).prefix(1)
        let letter2 = text.suffix(1)
        print("letter1:::\(letter1)")
        print("letter2:::\(letter2)")
        
        let initalValue = initialBlock.firstIndex(of: String(letter1)) ?? 0
        counter = initalValue*588
        
        let medialValue = medialBlock.firstIndex(of: String(letter2)) ?? 0
        counter += medialValue*28
        counter += 44032
        let hexString = String(format: "%02X", counter)
        print("hexString2:::\(hexString)")
        
        let data = hexString.data(using: .unicode)!
        let str = String.init(data:data , encoding: .unicode) ?? ""
        
        kOREAN_BLOCK_TYPE = .FINAL
        return "\u{B9AC}"
    case .FINAL:
        
        counter = 47532
        let letterFinal = text.suffix(1)
        let finalValue = initialBlock.firstIndex(of: String(letterFinal)) ?? 0
        counter += finalValue
        let hex = String(format: "%02X", counter)
        print("hex::\(hex)")
        kOREAN_BLOCK_TYPE = .INITIAL
        
        let data = hex.data(using: .unicode)!
        let str = String.init(data:data , encoding: .unicode) ?? ""
        
        return "\u{B9AE}"
        
        /*
        let letter1 = word.prefix(1)
        let letter2 = word.prefix(2).suffix(1)
        let letter3 = word.suffix(1)
        
        print("letter1:::\(letter1)")
        print("letter2:::\(letter2)")
        print("letter3:::\(letter3)")
        
        let initalValue = initialBlock.firstIndex(of: String(letter1)) ?? 0
        counter = initalValue*588
        
        let medialValue = medialBlock.firstIndex(of: String(letter2)) ?? 0
        counter += medialValue*28
        let finalValue = finalBlock.firstIndex(of: String(letter3)) ?? 0
        counter += finalValue
        counter += 44032
        print("unicodeValue::\(counter)")
        let hexString = String(format: "%02X", counter)
        print("hexString::\(hexString)")
        let emoji: String = hexString.hexToString()  //"\u{B9B0}"
        print("finalString::\(emoji)")
        //47536  B9B0 린
        //47536 B9B0 린
        kOREAN_BLOCK_TYPE = .INITIAL
        return word + "\\u" + "{B9B0}"
 */
    
//    default:
//        break
    }
    
    
    //let finalUnicode = initialBlock[0] * 588 + medialBlock[0]*28 + finalBlock[0] + 44032
    
    return text
}

let kUnicodeKoNormal      = "ㅂ৹ ㅈ৹ ㄷ৹ ㄱ৹ ㅅ৹ ㅛ৹ ㅕ৹ ㅑ৹ ㅐ৹ ㅔ৹ \(kNL)৹ " +
                            "ㅁ৹ ㄴ৹ ㅇ৹ ㄹ৹ ㅎ৹ ㅗ৹ ㅓ৹ ㅏ৹ ㅣ৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ ㅋ৹ ㅌ৹ ㅊ৹ ㅍ৹ ㅠ৹ ㅜ৹ ㅡ৹ \(kSPECIAL)"
let kUnicodeKoNormalShift = "ㅃ৹ ㅉ৹ ㄸ৹ ㄲ৹ ㅆ৹ ㅛ৹ ㅕ৹ ㅑ৹ ㅒ৹ ㅖ৹ \(kNL)৹ " +
                            "ㅁ৹ ㄴ৹ ㅇ৹ ㄹ৹ ㅎ৹ ㅗ৹ ㅓ৹ ㅏ৹ ㅣ৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ ㅋ৹ ㅌ৹ ㅊ৹ ㅍ৹ ㅠ৹ ㅜ৹ ㅡ৹ \(kSPECIAL)"
let kUnicodeKoNumbers     = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ " +
                            "-৹ /৹ :৹ ;৹ (৹ )৹ $৹ &৹ @৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ \"৹ .৹ ^৹ %৹ ?৹ !৹ *৹ \(kSPECIAL)"
let kUnicodeKoPuncuation  = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ " +
                            "-৹ _৹ /৹ |৹ ~৹ <৹ >৹ €৹ $৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ ¥৹ •৹ .৹ ?৹ !৹ \(kSPECIAL)"

/*
 ₩ $ € ¥ £ ₽
 */





//alphabet aombining rules
//https://stackoverflow.com/questions/19814497/combine-or-construct-korean-letters

//MARK:- Hint words
let hintWordsKo = "w ŵ,e è é ê ë ē ė ę,y ŷ ÿ,u û ü ù ú ū,i î ï í ī į ì,o ô ö ò ó œ ø ō õ,a à á â ä æ ã å ā,s ß ś š,l ł,z ž ź ż,c ç ć č,n ñ ń,W Ŵ,E È É Ê Ë Ē Ė Ę,Y Ŷ Ÿ,U Û Ü Ù Ú Ū,I Î Ï Í Ī Į Ì,O Ô Ö Ò Ó Ó Œ Ø Ō Õ,A À Á Â Ä Æ Ã Å Ā,S Ś Š,L Ł,Z Ž Ź Ż,C Ç Ć Č,N Ñ Ń"
