//
//  UnicodeUr.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeUr: NSObject {
//}

let kFontUrDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersUrNormal,
        SHIFT  :kUnicodeLettersUrShiftArray,
        NUMERIC:kUnicodeLettersUrNumList,
        SYMBOL :kUnicodeLettersUrPuncuation
    ]
]

let kUnicodeLettersUrShiftArray = kUnicodeUrLetterShift.components(separatedBy: " ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersUrPuncuation = kUnicodeUrPuncuation.components(separatedBy: " ")
let kUnicodeLettersUrNumList    = kUnicodeUrNumbers.components(separatedBy: " ")

//Font Array
let kUnicodeLettersUrNormal = kUnicodeUrNormal.components(separatedBy: " ")


//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeUrNormal = "پ ہ ئ ی ے ت ر ع و ق \(kNL) ل ک ج ھ گ ف د س ا  \(kNL) \(kSHIFT) م ن ب ط چ ش ز \(kSPECIAL2)"
let kUnicodeUrLetterShift = "پ ۂ ء ی ۓ ٹ ڑ ع ؤ ق \(kNL) ل خ ض ح غ ف ڈ ص آ \(kNL) \(kSHIFT) م م ب ب ث ژ ذ  \(kSPECIAL2)"
let kUnicodeUrNumbers = "۱ ۲ ۳ ۴ ۵ ۶ ۷ ۸ ۹ ۰ \(kNL) - / : ؛ ( ) ₨ & @ “  \(kNL) \(kSHIFT) ۔ ، ؟ ! \(kSPECIAL2)"
let kUnicodeUrPuncuation = "[ ] { } # % ^ * + = \(kNL) _ \\ | ~ > < €ؔ ※ • \(kNL) \(kSHIFT) . , ? !َُُِ \(kSPECIAL2)"

/*
 Urdu
 پ ہ ئ ی ے ت ر ع و ق
 ل ک ج ھ گ ف د س ا
 م ن ب ط چ ش ز


 پ ۂ ء ی ۓ ٹ ڑ ع ؤ ق
 ل خ ض ح غ ف ڈ ص آ
 م م ب ب ث ژ ذ

 ۱۲۳۴۵۶۷۸۹۰
 -/:؛)(₨&@“
 ۔،؟!

 ][}{#%^*+=
 _\|~><€ؔ※•
 .,?!
 */


//MARK:- Hint Letters
let hintWordsUr = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
