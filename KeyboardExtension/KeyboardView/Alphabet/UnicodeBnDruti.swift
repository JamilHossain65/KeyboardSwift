//
//  UnicodeBnDruti.swift
//  KeyboardExtBnsion
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeBnDruti: NSObject {
//}

let kFontBnDrutiDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersBnDrutiNormal,
        SHIFT  :kUnicodeLettersBnDrutiUnshiftArray,
        NUMERIC:kUnicodeLettersBnDrutiNumList,
        SYMBOL :kUnicodeLettersBnDrutiPuncuation,
        
        NORMAL_REPLACE :kUnicodeLettersBnDrutiReplaceNormal,
        SHIFT_REPLACE  :kUnicodeLettersBnDrutiReplaceUnshiftArray,
        NUMERIC_REPLACE:kUnicodeLettersBnDrutiReplaceNumList,
        SYMBOL_REPLACE :kUnicodeLettersBnDrutiReplacePuncuation,
        
    ]
]

let kUnicodeLettersBnDrutiNormal       = kUnicodeBnDrutiNormal.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnDrutiUnshiftArray = kUnicodeBnDrutiLetterShift.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnDrutiNumList      = kUnicodeBnDrutiNumbers.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnDrutiPuncuation   = kUnicodeBnDrutiPuncuation.components(separatedBy: kSEPERATOR)

//replaced letter
let kUnicodeLettersBnDrutiReplaceNormal       = kUnicodeBnDrutiReplaceNormal.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnDrutiReplaceUnshiftArray = kUnicodeBnDrutiReplaceLetterShift.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnDrutiReplaceNumList      = kUnicodeBnDrutiReplaceNumbers.components(separatedBy: kSEPERATOR)
let kUnicodeLettersBnDrutiReplacePuncuation   = kUnicodeBnDrutiReplacePuncuation.components(separatedBy: kSEPERATOR)


//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeBnDrutiNormal = "q৹ w৹ e৹ r৹ t৹ y৹ u৹ i৹ o৹ p৹ \(kNL)৹ a৹ s৹ d৹ f৹ g৹ h৹ j৹ k৹ l৹ \(kNL)৹ \(kSHIFT)৹ z৹ x৹ c৹ v৹ b৹ n৹ m৹ \(kSPECIAL)"
let kUnicodeBnDrutiLetterShift = "্৹  ৃ৹  ৈ৹  ৌ৹  ং৹  ঃ৹  ঁ৹ য়৹ ৎ৹  ং৹ \(kNL)৹ ঋ৹ ঔ৹ ঙ৹ ঞ৹ ঠ৹ ষ৹ ড়৹ ঢ৹ ঢ়৹ ো৹ \(kNL)৹ \(kSHIFT)৹  জ্ঞ৹ ঞ্চ৹ ঞ্ছ৹ ঞ্জ৹ চ্চ৹ হ্য৹ ক্ষ৹ ঋ৹ \(kSPECIAL)"
let kUnicodeBnDrutiNumbers = "১৹ ২৹ ৩৹ ৪৹ ৫৹ ৬৹ ৭৹ ৮৹ ৯৹ ০৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ৳৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeBnDrutiPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ ₹৹ $৹ ৲৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॥৹  ়৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"

//kUnicodeBnDrutiNormal, kUnicodeBnDrutiReplaceNormal should me same amount
let kUnicodeBnDrutiReplaceNormal = "ক৹  ্৹  ে৹ র৹ ত৹ য়৹  ু৹  ি৹  ো৹ প৹ \(kNL)৹  া৹ স৹ দ৹ ফ৹ গ৹ হ৹ জ৹ ক৹ ল৹ \(kNL)৹ \(kSHIFT)৹ য৹ ক্স৹ চ৹ ভ৹ ব৹ ন৹ ম৹ \(kSPECIAL)"

let kUnicodeBnDrutiReplaceLetterShift = kUnicodeBnDrutiLetterShift
let kUnicodeBnDrutiReplaceNumbers     = kUnicodeBnDrutiNumbers
let kUnicodeBnDrutiReplacePuncuation  = kUnicodeBnDrutiPuncuation


//MARK:- Hint Letters
let hintWordsBnDruti = "a আ,w অ  ঃ,e এ ঐ  ৈ,u উ ঊ  ূ,i ই ঈ ী,o ও ঔ  ৌ  ্,k খ,g ঘ,n ণ ঙ ঞ ং  ঁ,c ছ,j ঝ য,t ট ঠ থ ৎ,d ধ ড ঢ,p ফ,b ভ,m ঙ ঞ,y য,r ড় ঢ় ঋ  ৃ,s শ ষ"

