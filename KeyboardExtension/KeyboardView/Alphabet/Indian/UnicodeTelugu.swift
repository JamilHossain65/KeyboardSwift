//
//  UnicodeTe.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeTe: NSObject {
//}

let kFontTeDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersTeNormal,
        SHIFT  :kUnicodeLettersTeUnshiftArray,
        NUMERIC:kUnicodeLettersTeNumList,
        SYMBOL :kUnicodeLettersTePuncuation
    ]
]

let kUnicodeLettersTeUnshiftArray = kUnicodeTeLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersTePuncuation = kUnicodeTePuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersTeNumList    = kUnicodeTeNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersTeNormal = kUnicodeTeNormal.components(separatedBy: "৹ ")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeTeNormal = " ౌ৹  ై৹  ా৹  ీ৹  ూ৹ బ৹ హ৹ గ৹ ద৹ జ৹ డ৹ \(kNL)৹  ో৹  ే৹  ్৹  ి৹  ు৹ ప৹ ర৹ క৹ త৹ చ৹ ట৹ \(kNL)৹ \(kSHIFT)৹  ొ৹  ె৹ మ৹ న৹ వ৹ ల৹ స৹ య৹  ృ৹ \(kSPECIAL)"
let kUnicodeTeLetterShift = "ఔ৹ ఐ৹ ఆ৹ ఈ৹ ఊ৹ భ৹ ః৹ ఘ৹ ధ৹ ఝ৹ ఢ৹ \(kNL)৹ ఓ৹ ఏ৹ అ৹ ఇ৹ ఉ৹ ఫ৹ ఱ৹ ఖ৹ థ৹ ఛ৹ ఠ৹ \(kNL)৹ \(kSHIFT)৹ ఒ৹ ఎ৹ ం৹ ణ৹ ఞ৹ ళ৹ శ৹ ష৹ ఋ৹ \(kSPECIAL)"
let kUnicodeTeNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeTePuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ .৹ ॥৹ ఽ৹  ః৹  ఁ৹ ‘৹ \(kSPECIAL)"


/*
Telugu
ౌ ై ా ీ ూ బ హ గ ద జ డ
ో ే ్ ి ు ప ర క త చ ట
 ొ  ె మ న వ ల స య

ఔ ఐ ఆ ఈ ఊ భ ః ఘ ధ ఝ ఢ
ఓ ఏ అ ఇ ఉ ఫ ఱ ఖ థ ఛ ఠ
ఒ ఎ ం ణ ఞ ళ శ ష ఋ

1234567890
-/:;()₹&@“
.।,?!’

[]{}#%^*+=
_\|~<>$£€•
.॥ఽ ః ఁ ‘
*/


//MARK:- Hint Letters
let hintWordsTe = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
