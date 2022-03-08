//
//  UnicodeTa.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeTa: NSObject {
//}

let kFontTaDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersTaNormal,
        SHIFT  :kUnicodeLettersTaUnshiftArray,
        NUMERIC:kUnicodeLettersTaNumList,
        SYMBOL :kUnicodeLettersTaPuncuation
    ]
]

let kUnicodeLettersTaUnshiftArray = kUnicodeTaLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersTaPuncuation = kUnicodeTaPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersTaNumList    = kUnicodeTaNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersTaNormal = kUnicodeTaNormal.components(separatedBy: "৹ ")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeTaNormal = "ஆ৹ ஈ৹ ஊ৹ ஏ৹ ள৹ ற৹ ன৹ ட৹ ண৹ ச৹ ஞ৹ \(kNL)৹ அ৹ இ৹ உ৹ ஐ৹ எ৹ க৹ ப৹ ம৹ த৹ ந৹ ய৹ \(kNL)৹ \(kSHIFT)৹ ஔ৹ ஓ৹ ஒ৹ வ৹ ங৹ ல৹ ர৹ ழ৹ \(kSPECIAL)"
let kUnicodeTaLetterShift = "௧৹ ௨৹ ௩৹ ௪৹ ௫৹ ௬৹ ௭৹ ௮৹ ௮৹ ௯৹ ௦৹ ௰৹ \(kNL)৹ ஃ৹ ஸ৹ ஷ৹ ஜ৹ ஹ৹ க்ஷ৹ ஶ்ரீ৹ ஶ৹ ௐ৹ ௱৹ ௲৹ \(kNL)৹ \(kSHIFT)৹ ௳৹ ௴৹ ௵৹ ௶৹ ௷৹ ௸৹ ௹৹ ௺৹ \(kSPECIAL)"
let kUnicodeTaNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ @৹ &৹ ₹৹ “৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeTaPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"

/*
Tamil
ஆ ஈ ஊ ஏ ள ற ன ட ண ச ஞ
அ இ உ ஐ எ க ப ம த ந ய
ஔ ஓ ஒ வ ங ல ர ழ
்

௧ ௨ ௩ ௪ ௫ ௬ ௭ ௮ ௮ ௯ ௦ ௰
ஃ ஸ ஷ ஜ ஹ க்ஷ ஶ்ரீ ஶ ௐ ௱ ௲
௳ ௴ ௵ ௶ ௷ ௸ ௹ ௺
 
 1234567890
 -/:;()₹&@“
 .।,?!’

 []{}#%^*+=
 _\|~<>$£€•
 .॥ಽ ಃ ಼ ‘
*/

//MARK:- Hint Letters
let hintWordsTa = "1 ௧,2 ௨,3 ௩,4 ௪,5 ௫,6 ௬,7 ௭,8 ௮,9 ௯,0 ௦ °,₹ ૱ ৲ ৳ ₽ ¥ € $ £ ₩,ச ஸ ஷ ஜ ஶ்ரீ, அ ஹ,க க்ஷ,- – — •, / \\, € $ £ ¥ ₩ ₽,& §, “ ” “ „ » «, . …, ? ¿, ! ¡, ‘ ’ ‘ `"

