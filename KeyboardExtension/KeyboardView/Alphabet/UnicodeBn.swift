//
//  UnicodeBn.swift
//  KeyboardExtBnsion
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeBn: NSObject {
//}

let kFontBnDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersBnNormal,
        SHIFT  :kUnicodeLettersBnUnshiftArray,
        NUMERIC:kUnicodeLettersBnNumList,
        SYMBOL :kUnicodeLettersBnPuncuation
    ]
]

let kUnicodeLettersBnNormal       = kUnicodeBnNormal.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnUnshiftArray = kUnicodeBnLetterShift.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnNumList      = kUnicodeBnNumbers.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnPuncuation   = kUnicodeBnPuncuation.components(separatedBy: kSEPERATOR)


//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeBnNormal = " ৈ৹  া৹  ী৹  ূ৹ ব৹ হ৹ গ৹ দ৹ জ৹ ড৹ \(kNL)৹  ো৹  ে৹  ্৹  ি৹  ু৹ প৹ র৹ ক৹ ত৹ চ৹ ট৹ \(kNL)৹ \(kSHIFT)৹  ং৹ ম৹ ন৹ ল৹ স৹ শ৹ য৹  ্য৹ \(kSPECIAL)"
let kUnicodeBnLetterShift = "ঔ৹ ঐ৹ আ৹ ঈ৹ ঊ৹ ভ৹ ঙ৹ ঘ৹ ধ৹ ঝ৹ ঢ৹ \(kNL)৹ ও৹ এ৹ অ৹ ই৹ উ৹ ফ৹  ৃ৹ খ৹ থ৹ ছ৹ ঠ৹ \(kNL)৹ \(kSHIFT)৹  ঁ৹ জ্ঞ৹ ণ৹ ক্ষ৹ ষ৹ ঋ৹ য়৹ ৎ৹ \(kSPECIAL)"
let kUnicodeBnNumbers = "১৹ ২৹ ৩৹ ৪৹ ৫৹ ৬৹ ৭৹ ৮৹ ৯৹ ০৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ৳৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeBnPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ ₹৹ $৹ ৲৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॥৹ ়৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"

//MARK:- Hint Letters
let hintWordsBn = ""
