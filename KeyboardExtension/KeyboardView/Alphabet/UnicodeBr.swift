//
//  UnicodeBr.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeBr: NSObject {
//}

let kFontBrDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersBrNormal,
     SHIFT  :kUnicodeLettersBrNormalShift,
     NUMERIC:kUnicodeLettersBrNumList,
     SYMBOL :kUnicodeLettersBrPuncuation],
]

let kUnicodeLettersBrPuncuation   = kUnicodeBrPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersBrNumList      = kUnicodeBrNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersBrNormal       = kUnicodeBrNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersBrNormalShift  = kUnicodeBrNormalShift .components(separatedBy: kSEPERATOR)
/*
 က ခ ဂ ဃ င စ ဆ ဇ ဈ ည ဋ
 ဌ ဍ ဎ ဏ တ ထ ဒ ဓ န ပ ဖ
 ဗ ဘ မ ယ ရ လ ဝ သ

 ဟ ဠ အ ဣ ဤ ဥ ဦ ဧ ဩ ဪ
 င်္
 ံ ၖ ၗ ါ ေါ်  

 ၀ ၁ ၂ ၃ ၄ ၅ ၆ ၇ ၈ ၉ 11
 12 13 14 15 16 17 18 19 20 21 「
 」 ￥ $ @ % ? ! .
*/
//Default font
let kUnicodeBrNormal = "က৹ ခ৹ ဂ৹ ဃ৹ င৹ စ৹ ဆ৹ ဇ৹ ဈ৹ ည৹ ဋ৹ \(kNL)৹ ဌ৹ ဍ৹ ဎ৹ ဏ৹ တ৹ ထ৹ ဒ৹ ဓ৹ န৹ ပ৹ ဖ৹ \(kNL)৹ \(kSHIFT)৹ ဗ৹ ဘ৹ မ৹ ယ৹ ရ৹ လ৹ ဝ৹ သ৹ \(kSPECIAL)"
let kUnicodeBrNormalShift = "ဟ৹ ဠ৹ အ৹ ဣ৹ ဤ৹ ဥ৹ ဦ৹ ဧ৹ ဩ৹ ဪ৹ \(kNL)৹  ်৹ င်္৹  ့৹  ာ৹  း৹  ေ৹  ဲ৹  ု৹  ူ৹ \(kNL)৹ \(kSHIFT)৹  ိ৹  ီ৹  ွဲ৹  ံ৹  ၖ৹  ၗ৹  ါ৹  ေါ်৹ \(kSPECIAL)"
let kUnicodeBrNumbers = "၀৹ ၁৹ ၂৹ ၃৹ ၄৹ ၅৹ ၆৹ ၇৹ ၈৹ ၉৹ \(kNL)৹ 1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ \(kSHIFT)৹ 」৹ ￥৹ $৹ @৹ %৹ ?৹ !৹ .৹ \(kSPECIAL)"
let kUnicodeBrPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹  \\৹  |৹  ~৹ <৹  >৹  $৹ ๏৹ \(kNL)৹ \(kSHIFT)৹ .৹ ,৹ ?৹ !৹ '৹ \"৹ \(kSPECIAL)" //todo need to implement comma


//MARK:- Hint words
let hintWordsBr = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ"
