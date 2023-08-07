//
//  UnicodeJpKatakana.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeJpKatakana: NSObject {
//}

let kFontJpKataDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersJpKataNormal,
     SHIFT  :kUnicodeLettersJpKataNormalShift,
     NUMERIC:kUnicodeLettersJpKataNumList,
     SYMBOL :kUnicodeLettersJpKataPuncuation],
]

let kUnicodeLettersJpKataPuncuation   = kUnicodeJpKatakanaPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersJpKataNumList      = kUnicodeJpKatakanaNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersJpKataNormal       = kUnicodeJpKatakanaNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersJpKataNormalShift  = kUnicodeJpKatakanaNormalShift .components(separatedBy: kSEPERATOR)
/*
ก ข ฃ ค ฅ ฆ ง จ ฉ ช ซ
ฌ ญ ฎ ฏ ฐ ฑ ฒ ณ ด ต ถ
เ แ โ ใ ไ ๅ ๆ ฿

ฬ ข ฃ ค ฅ ฆ ง จ ฉ ช ซ ฌ
ฌ ญ ฎ ฏ ฐ ฑ ฒ ณ ด ต ถ
เ แ โ ใ ไ ๅ ๆ ฿

 ะ ั า ำ
 ท ธ น บ ป ผ ฝ พ ฟ ภ ม
 ย ร ล ว ศ ษ ส ห


ฬ อ ฮ ฤ ฦ ๆ ฯ ๚ ๛ ? ;
๐ ๑ ๒ ๓ ๔ ๕  ๖ ๗ ๘ ๙ .
็ ่ ้ ๊ ๋ ์ ํ ๏
*/
//Default font
let kUnicodeJpKatakanaNormal = "ก৹ ข৹ ฃ৹ ค৹ ฅ৹ ฆ৹ ง৹ จ৹ ฉ৹ ช৹ ซ৹ \(kNL)৹ ฌ৹ ญ৹ ฎ৹ ฏ৹ ฐ৹ ฑ৹ ฒ৹ ณ৹ ด৹ ต৹ ถ৹ \(kNL)৹ \(kSHIFT)৹ เ৹ แ৹ โ৹ ใ৹ ไ৹ ๅ৹ ๆ৹ ฿৹ \(kSPECIAL)"
let kUnicodeJpKatakanaNormalShift = "ฬ৹ ข৹ ฃ৹ ค৹ ฅ৹ ฆ৹ ง৹ จ৹ ฉ৹ ช৹ ซ৹ ฌ৹ \(kNL)৹ ฌ৹ ญ৹ ฎ৹ ฏ৹ ฐ৹ ฑ৹ ฒ৹ ณ৹ ด৹ ต৹ ถ৹ \(kNL)৹ \(kSHIFT)৹ เ৹ แ৹ โ৹ ใ৹ ไ৹ ๅ৹ ๆ৹ ฿৹ \(kSPECIAL)"
let kUnicodeJpKatakanaNumbers = "ะ৹  ั৹ า৹  ำ৹  ิ৹  ี৹  ึ৹  ื৹ ุ৹  ู৹  ฺ৹ \(kNL)৹ ท৹ ธ৹ น৹ บ৹ ป৹ ผ৹ ฝ৹ พ৹ ฟ৹ ภ৹ ม৹ \(kNL)৹ \(kSHIFT)৹ ย৹ ร৹ ล৹ ว৹ ศ৹ ษ৹ ส৹ ห৹ \(kSPECIAL)"
let kUnicodeJpKatakanaPuncuation = "ฬ৹ อ৹ ฮ৹ ฤ৹ ฦ৹ ๆ৹ ฯ৹ ๚৹ ๛৹ ?৹ ;৹ \(kNL)৹ ๐৹ ๑৹ ๒৹ ๓৹ ๔৹ ๕৹ ๖৹ ๗৹ ๘৹ ๙৹ .৹ \(kNL)৹ \(kSHIFT)৹  ็৹  ่৹  ้৹  ๊৹  ๋৹  ์৹  ํ৹ ๏৹ \(kSPECIAL)" //todo need to implement comma


//MARK:- Hint words
let hintWordsJpKata = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ"
