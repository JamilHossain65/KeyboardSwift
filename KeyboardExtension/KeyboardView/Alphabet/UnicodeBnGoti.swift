//
//  UnicodeBnGoti.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeBnGoti: NSObject {
//}

let kFontBnGotiDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersBnGotiNormal,
     SHIFT  :kUnicodeLettersBnGotiNormalShift,
     NUMERIC:kUnicodeLettersBnGotiNumList,
     SYMBOL :kUnicodeLettersBnGotiPuncuation],
]

let kUnicodeLettersBnGotiPuncuation   = kUnicodeBnGotiPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnGotiNumList      = kUnicodeBnGotiNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnGotiNormal       = kUnicodeBnGotiNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnGotiNormalShift  = kUnicodeBnGotiNormalShift .components(separatedBy: kSEPERATOR)


//Default font
let kUnicodeBnGotiNormal = "্৹  া৹  ি৹  ী৹  ু৹  ূ৹  ৃ৹  ে৹  ৈ৹  ো৹  ৌ৹ \(kNL)৹ ক৹ খ৹ গ৹ ঘ৹ ঙ৹ চ৹ ছ৹ জ৹ ঝ৹ ঞ৹ ট৹ \(kNL)৹ \(kSHIFT)৹ ঠ৹ ড৹ ঢ৹ ণ৹ ত৹ থ৹ দ৹ ধ৹ \(kSPECIAL)"
let kUnicodeBnGotiNormalShift = "অ৹ আ৹ ই৹ ঈ৹ ঊ৹ উ৹ ঋ৹ এ৹ ঐ৹ ও৹ ঔ৹ \(kNL)৹ ন৹ প৹ ফ৹ ব৹ ভ৹ ম৹ য৹ র৹ ল৹ শ৹ ষ৹ \(kNL)৹ \(kSHIFT)৹ স৹ হ৹ ড়৹ ঢ়৹ য়৹ ৎ৹ ং৹ ঃ৹ \(kSPECIAL)"
let kUnicodeBnGotiNumbers = "১৹ ২৹ ৩৹ ৪৹ ৫৹ ৬৹ ৭৹ ৮৹ ৯৹ ০৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ৳৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeBnGotiPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ ₹৹ $৹ ৲৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॥৹ ়৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)" //todo need to implement comma


//MARK:- Hint words
let hintWordsBnGoti = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ"
