//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}


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


//Default font
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

//MARK:- Hint words
let hintWordsKo = "w ŵ,e è é ê ë ē ė ę,y ŷ ÿ,u û ü ù ú ū,i î ï í ī į ì,o ô ö ò ó œ ø ō õ,a à á â ä æ ã å ā,s ß ś š,l ł,z ž ź ż,c ç ć č,n ñ ń,W Ŵ,E È É Ê Ë Ē Ė Ę,Y Ŷ Ÿ,U Û Ü Ù Ú Ū,I Î Ï Í Ī Į Ì,O Ô Ö Ò Ó Ó Œ Ø Ō Õ,A À Á Â Ä Æ Ã Å Ā,S Ś Š,L Ł,Z Ž Ź Ż,C Ç Ć Č,N Ñ Ń"
