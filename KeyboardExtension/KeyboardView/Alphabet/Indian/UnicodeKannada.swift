//
//  UnicodeKn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeKn: NSObject {
//}

let kFontKnDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersKnNormal,
        SHIFT  :kUnicodeLettersKnUnshiftArray,
        NUMERIC:kUnicodeLettersKnNumList,
        SYMBOL :kUnicodeLettersKnPuncuation
    ]
]

let kUnicodeLettersKnUnshiftArray = kUnicodeKnLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersKnPuncuation = kUnicodeKnPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersKnNumList    = kUnicodeKnNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersKnNormal = kUnicodeKnNormal.components(separatedBy: "৹ ")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeKnNormal = " ೌ৹  ೈ৹  ಾ৹  ೀ৹  ೂ৹ ಬ৹ ಹ৹ ಗ৹ ದ৹ ಜ৹ ಡ৹ \(kNL)৹  ೋ৹  ೇ৹  ್৹  ಿ৹  ು৹ ಪ৹ ರ৹ ಕ৹ ತ৹ ಚ৹ ಟ৹ \(kNL)৹ \(kSHIFT)৹   ೊ৹  ೆ৹ ಮ৹ ನ৹ ವ৹ ಲ৹ ಸ৹ ಯ৹  ೃ৹  \(kSPECIAL)"
let kUnicodeKnLetterShift = "ಔ৹ ಐ৹ ಆ৹ ಈ৹ ಊ৹ ಭ৹  ಃ৹ ಘ৹ ಧ৹ ಝ৹ ಢ৹ \(kNL)৹ ಓ৹ ಏ৹ ಅ৹ ಇ৹ ಉ৹ ಫ৹ ಱ৹ ಖ৹ ಥ৹ ಛ৹ ಠ৹ ಒ৹ \(kNL)৹ \(kSHIFT)৹ ಎ৹ ಒ৹  ಂ৹ ಣ৹ ಞ৹ ಳ৹ ಶ৹ ಷ৹ ಋ৹ \(kSPECIAL)"
let kUnicodeKnNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeKnPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ .৹ ॥৹ ಽ৹  ಃ৹  ಼৹ ‘৹ \(kSPECIAL)"

/*
 ೋ ೇ ್ ಿ ು 
 Kannada
 ೌೌ ೈ ಾ ೀ ೂ ಬ ಹ ಗ ದ ಜ ಡ
 ೋೋ ೇ ್ ಿ ು ಪ ರ ಕ ತ ಚ ಟ
 ೊ ೆ ಮ ನ ವ ಲ ಸ ಯ

 ಔ ಐ ಆ ಈ ಊ ಭ ಃ ಘ ಧ ಝ ಢ
 ಓ ಏ ಅ ಇ ಉ ಫ ಱ ಖ ಥ ಛ ಠ ಒ
 ಎ ಒ ಂ  ಣ ಞ ಳ ಶ ಷ ಋ
 1234567890
 -/:;()₹&@“
 .।,?!’

 []{}#%^*+=
 _\|~<>$£€•
 .॥ಽ ಃ ಼ ‘
 */


//MARK:- Hint Letters
let hintWordsKn = " ೌ ಔ, ೈ ಐ, ಾ ಆ, ೀ ಈ, ೂ ಊ, ಬ ಭ, ಹ ಃ, ಗ ಘ, ದ ಧ, ಜ ಝ, ಡ ಢ, ೋ ಓ, ೇ ಏ, ್ ಅ, ಿ ಇ, ು ಉ, ಪ ಫ, ರ ಱ, ಕ ಖ, ತ ಥ, ಚ ಛ, ಟ ಠ, ೊ ಒ, ೆ  ಎ, ಮ  ಂ,ನ ಣ,ವ ಞ,ಲ ಳ,ಸ ಶ,ಯ ಷ, ೃ  ಋ"

