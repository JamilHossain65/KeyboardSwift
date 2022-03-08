//
//  UnicodePa.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodePa: NSObject {
//}

let kFontPaDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersPaNormal,
        SHIFT  :kUnicodeLettersPaUnshiftArray,
        NUMERIC:kUnicodeLettersPaNumList,
        SYMBOL :kUnicodeLettersPaPuncuation
    ]
]

let kUnicodeLettersPaUnshiftArray = kUnicodePaLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersPaPuncuation = kUnicodePaPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersPaNumList    = kUnicodePaNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersPaNormal = kUnicodePaNormal.components(separatedBy: "৹ ")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodePaNormal = " ੌ৹  ੈ৹  ਾ৹  ੀ৹  ੂ৹ ਬ৹ ਹ৹ ਗ৹ ਦ৹ ਜ৹ ਡ৹ \(kNL)৹  ੋ৹  ੇ৹  ੱ৹  ਿ৹  ੁ৹ ਪ৹ ਰ৹ ਕ৹ ਤ৹ ਚ৹ ਟ৹ \(kNL)৹ \(kSHIFT)৹  ੰ৹ ੜ৹ ਮ৹ ਨ৹ ਵ৹ ਲ৹ ਸ৹ ਯ৹ \(kSPECIAL)"
let kUnicodePaLetterShift = "ਔ৹ ਐ৹ ਆ৹ ਈ৹ ਊ৹ ਭ৹  ੍ਹ৹ ਘ৹ ਧ৹ ਝ৹ ਢ৹ \(kNL)৹ ਓ৹ ਏ৹ ਅ৹ ਇ৹ ਉ৹ ਫ৹  ੍ਰ৹ ਖ৹ ਥ৹ ਛ৹ ਠ৹ \(kNL)৹ \(kSHIFT)৹  ਂ৹ ਞ৹ ਙ৹ ਣ৹  ੍ਵ৹ ਲ਼৹ ਸ਼৹  ਼৹ \(kSPECIAL)"
let kUnicodePaNumbers = "੧৹ ੨৹ ੩৹ ੪৹ ੫৹ ੬৹ ੭৹ ੮৹ ੯৹ ੦৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodePaPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॥৹ ੲ৹ ੳ৹  ਃ৹ ੴ৹   ੑ৹ \(kSPECIAL)"

/*
 Panjabi
 ੌ ਔ, ੈ ਐ, ਾ ਆ, ੀ ਈ, ੂ ਊ,ਬ ਭ,ਹ  ੍ਹ,ਗ ਘ,ਦ ਧ,ਜ ਝ,ਡ ਢ,
 ੋ, ੇ, ੱ, ਿ, ੁ,ਪ,ਰ,ਕ,ਤ,ਚ,ਟ
 ੰ ੜ ਮ ਨ ਵ ਲ ਸ ਯ

 ਔ ਐ ਆ ਈ ਊ ਭ ੍ਹ ਘ ਧ ਝ ਢ
 ਓ ਏ ਅ ਇ ਉ ਫ ੍ਰ ਖ ਥ ਛ ਠ
 ਂ ਞ  ਙ ਣ ੍ਵ ਲ਼ ਸ਼

 ੧੨੩੪੫੬੭੮੯੦
 -/:;()₹&@“
 ।.,?!’

 []{}#%^*+=
 _\|~<>$£€•
 ॥ੲੳ ਃ ੴ ੑ 
 */


//MARK:- Hint Letters
let hintWordsPa = "ੌ ਔ, ੈ ਐ, ਾ ਆ, ੀ ਈ, ੂ ਊ,ਬ ਭ,ਹ  ੍ਹ,ਗ ਘ ਗ਼,ਦ ਧ,ਜ ਜ਼ ਝ,ਡ ਢ, ੋ ਓ, ੇ ਏ, ੱ ਅ, ਿ ਇ, ੁ ਉ,ਪ ਫ,ਨ ਣ ਞ ਙ  ੍ਰ,ਕ ਖ,ਤ ਥ,ਚ ਛ,ਟ ਠ, ੰ  ਂ ,ੜ ਞ,ਮ ਙ,ਨ ਣ,ਵ  ੍ਵ,ਲ,ਸ ਲ਼,ਯ ਸ਼,ਫ ਫ਼,ਖ ਖ਼,- – — •, / \\, € $ £ ¥ ₩ ₽,& §, “ ” “ „ » «, . …, ? ¿, ! ¡, ‘ ’ ‘ `"
//ਗ ਘ ਗ਼, ਜ ਜ਼ ਝ,ਨ ਣ ਞ ਙ,ਫ ਫ਼, ਖ ਖ਼,ਂ
