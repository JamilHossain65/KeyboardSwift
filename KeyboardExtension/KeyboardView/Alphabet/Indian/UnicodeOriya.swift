//
//  UnicodeOr.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeOr: NSObject {
//}

let kFontOrDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersOrNormal,
        SHIFT  :kUnicodeLettersOrUnshiftArray,
        NUMERIC:kUnicodeLettersOrNumList,
        SYMBOL :kUnicodeLettersOrPuncuation
    ]
]

let kUnicodeLettersOrUnshiftArray = kUnicodeOrLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersOrPuncuation = kUnicodeOrPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersOrNumList    = kUnicodeOrNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersOrNormal = kUnicodeOrNormal.components(separatedBy: "৹ ")


//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeOrNormal = " ୌ৹  ୈ৹  ା৹  ୀ৹  ୂ৹ ବ৹ ହ৹ ଗ৹ ଦ৹ ଜ৹ ଡ৹ \(kNL)৹ ୋ৹  େ৹  ୍৹  ି৹  ୁ৹ ପ৹ ର৹ କ৹ ତ৹ ଚ৹ ଟ৹ \(kNL)৹ \(kSHIFT)৹ ଂ৹ ମ৹ ନ৹ ୱ৹ ଲ৹ ସ৹ ଶ৹ ଯ৹ \(kSPECIAL)"
let kUnicodeOrLetterShift = "ଔ৹ ଐ৹ ଆ৹ ଈ৹ ଊ৹ ଭ৹ ଋ৹ ଘ৹ ଧ৹ ଝ৹ ଢ৹ \(kNL)৹ ଓ৹ ଏ৹ ଅ৹ ଇ৹ ଉ৹ ଫ৹  ୃ৹ ଖ৹ ଥ৹ ଛ৹ ଠ৹ \(kNL)৹ \(kSHIFT)৹  ଁ৹ ଜ୍ଞ৹ ଣ৹ କ୍ଷ৹ ଳ৹  ଼৹ ଷ৹ ୟ৹ \(kSPECIAL)"
let kUnicodeOrNumbers = "୧৹ ୨৹ ୩৹ ୪৹ ୫৹ ୬৹ ୭৹ ୮৹ ୯৹ ୦৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeOrPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॥৹ .৹ ଽ৹ ଃ৹ ଓ‍ଁ৹ '৹ \(kSPECIAL)"

/*
 Odia
 ୌୌ ୈ ା ୀ ୂ ବ ହ ଗ ଦ ଜ ଡ
 ୋୋ େ ୍ ି ୁ ପ ର କ ତ ଚ ଟ
 ଂଂ ମ ନ ୱ ଲ ସ ଶ ଯ

 ଔ ଐ ଆ ଈ ଊ ଭ ଋ ଘ ଧ ଝ ଢ
 ଓ ଏ ଅ ଇ ଉ ଫ ୃ ଖ ଥ ଛ ଠ
 ଁଁ ଜ୍ଞ ଣ କ୍ଷ ଳ ଼ ଷ  ୟ

 ୧୨୩୪୫୬୭୮୯୦
 -/:;()₹&@“
 ।.,?!’

 []{}#%^*+=
 _\|~<>$£€•
 ॥ . ଽ ଃ ଓ‍ଁ '
 
 */


//MARK:- Hint Letters
let hintWordsOr = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
