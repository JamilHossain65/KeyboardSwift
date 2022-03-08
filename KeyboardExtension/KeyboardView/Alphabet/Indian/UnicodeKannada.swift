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
let hintWordsKn = " ೌ ಔ, ೈ ಐ, ಾ ಆ, ೀ ಈ, ೂ ಊ, ಬ ಬ ಭ ಬ್ ಬ್ಬ ಬ್ರ, ಹ ಹ್ ಃ ಹ್ಹ ಹ್ರ, ಗ ಗ್ರ ಗ್ ಘ ಗ್ಗ, ದ ದ್ರ ದ್ ಧ ದ್ದ, ಜ ಜ್ರ ಜ್ಜ ಜ್ ಜ಼ ಝ, ಡ ಢ ಡ್ ಡ್ಡ ಡ್ರ, ೋ ಓ, ೇ ಏ, ್ ಅ, ಿ ಇ, ು ಉ, ಪ ಫ ಪ್ ಪ್ಪ ಪ್ರ, ರ ಱ ರ್ ರ್ರ, ಕ ಕ್ರ ಕ್ ಖ ಕ್ಕ, ತ ತ್ರ ತ ಥ ತ್ತ, ಚ ಚ್ರ ಚ್ಚ ಚ್ ಛ,ಟ ಟ್ರ ಟ್ ಠ ಟ, ೊ ಒ, ೆ ಎ, ಮ ಙ ಮ್ ಮ್ಮ ಮ್ರ ಂ,ನ ಣ ನ್ ನ್ನ ನ್ರ,ವ ಞ ವ್ ವ್ವ ವ್ರ,ಲ ಌ ಲ್ಲ ಳ ಲ್ ಲ್ರ ೡ  ೢ  ೣ ,ಸ ಸ್ರ ಸ್ ಶ ಸ್ಸ,ಯ ಯ್ರ ಯ್ ಷ ಯ್ಯ, ೃ ಋ,ಭ ಭ್ ಭ್ಭ ಭ್ರ,ಘ ಘ್ಘ ಘ್ ಘ್ರ,ಧ ಧ್ಧ ಧ್ ಧ್ರ, ಝ ಝ್ರ ಝ್ಝ ಝ್,ಢ ಢ್ ಢ್ಢ ಢ್ರ,ಫ ಫ಼ ಫ್ ಫ್ಫ ಫ್ರ, ಱ ಱ್ಱ ಱ್ ಱ್ರ ೞ, ಖ ಖ್ಖ ಖ್ ಖ್ರ, ಥ ಥ್ಥ ಥ್ ಥ್ರ , ಛ ಛ್ರ ಛ್ಛ ಛ್, ಠ ಠ್ ಠ್ಠ ಠ್ರ, ಣ ಣ್ ಣ್ಣ ಣ್ರ , ಞ ಞ್ ಞ್ಞ ಞ್ರ, ಳ ಳ್ ಳ್ಳ ಳ್ರ , ಶ ಶ್ಶ ಶ್ ಶ್ರ, ಷ ಷ್ಷ ಷ್ ಷ್ರ, ಋ ೠ,- – — •, / \\, € $ £ ¥ ₩ ₽,& §, “ ” “ „ » «, . …, ? ¿, ! ¡, ‘ ’ ‘ `,1 ೧,2 ೨,3 ೩,4 ೪,5 ೫,6 ೬,7 ೭,8 ೮,9 ೯,0 ೦ °"
