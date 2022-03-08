//
//  UnicodeMl.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeMl: NSObject {
//}

let kFontMlDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersMlNormal,
        SHIFT  :kUnicodeLettersMlUnshiftArray,
        NUMERIC:kUnicodeLettersMlNumList,
        SYMBOL :kUnicodeLettersMlPuncuation
    ]
]

let kUnicodeLettersMlUnshiftArray = kUnicodeMlLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersMlPuncuation = kUnicodeMlPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersMlNumList    = kUnicodeMlNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersMlNormal = kUnicodeMlNormal.components(separatedBy: "৹ ")


//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeMlNormal = " ൗ৹  ൈ৹  ാ৹  ീ৹  ൂ৹ ബ৹ ഹ৹ ഗ৹ ദ৹ ജ৹ ഡ৹ \(kNL)৹  ോ৹  േ৹  ്৹  ി৹  ു৹ പ৹ ര৹ ക৹ ത৹ ച৹ ട৹ \(kNL)৹ \(kSHIFT)৹ ോ৹  െ৹ മ৹ ന৹ വ৹ ല৹ സ৹ യ৹  ൃ৹ \(kSPECIAL)"
let kUnicodeMlLetterShift = "ഔ৹ ഐ৹ ആ৹ ഈ৹ ഊ৹ ഭ৹ ഴ৹ ഘ৹ ധ৹ ഝ৹ ഢ৹ \(kNL)৹ ഓ৹ ഏ৹ അ৹ ഇ৹ ഉ৹ ഫ৹ റ৹ ഖ৹ ഥ৹ ഛ৹ ഠ৹ \(kNL)৹ \(kSHIFT)৹ ഒ৹ എ৹  ം৹ ണ৹ ഞ৹ ള৹ ശ৹ ഷ৹ ഋ৹ \(kSPECIAL)"
let kUnicodeMlNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeMlPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ .৹ ॥৹ ഽ৹  ഃ৹ !৹ ’৹ \(kSPECIAL)"

/*
 Malayalam
 ൗ ൈ ാ ീ ൂ ബ ഹ ഗ ദ ജ ഡ
 ോ േ  ് ി ു പ ര ക ത ച ട
 ൊ  െ മ ന വ ല സ യ
 ഔ ഐ ആ ഈ ഊ ഭ ഴ ഘ ധ ഝ ഢ
 ഓ ഏ അ ഇ ഉ ഫ റ ഖ ഥ ഛ ഠ
 ഒ എ ം ണ ഞ ള ശ ഷ ഋ

 1234567890
 -/:;()₹&@“
 .।,?!’

 []{}#%^*+=
 _\|~<>$£€•
 . ॥ ഽ  ഃ ! ’
 */


//MARK:- Hint Letters
let hintWordsMl = "ൗ ഔ, ൈ ഐ, ാ ആ, ീ ഈ, ൂ ഊ, ബ ഭ,ഹ ഴ ഃ,ഗ ഗ്ര ഗ് ഘ ഗ്ഗ, ദ ദ്ര ദ് ധ ദ്ദ, ജ ജ്ര ജ്ജ ജ് ഝ, ഡ ഢ ഡ് ഡ്ഡ ഡ്ര, ോ ഓ, േ ഏ,  ് അ, ി ഇ, ു ഉ, പ ഫ പ് പ്പ പ്ര, ര റ,റ ര ർ ര് ര്ര, ക ക്ര ക്ക ഖ ൿ ക്, ത ത്ര ത് ഥ ത്ത,ച ച്ര ച്ച ച് ഛ, ട ഠ ട് ട്ട ട്ര ഺ, ൊ ഒ,  െ എ, മ ഞ മ് മ്മ മ്ര, ന ൹ ന്ന ണ ൻ ന് ന്ര ഩ, വ ഴ വ് വ്വ വ്ര, ല ശ, സ സ്ര സ് ശ സ്സ, യ യ്ര യ ഷ യ്യ ഋ, ൃ ൄ,ഭ ഭ് ഭ്ര, ഴ ഴ് ഴ്ര, ഘ ഘ് ഘ്ര, ധ ധ്ധ ധ് ധ്ര, ഝ ഝ്ര ഝ്, ഫ ഫ് ഫ്ഫ ഫ്ര, റ റ് റ്റ റ്ര, ഥ ഥ് ഥ്ര, ഛ ഛ്ര ഛ്, ഠ ഠ് ഠ്ഠ ഠ്ര, ം ങ, ണ ൺ ണ്  ണ്ണ ണ്ര, ഞ ഞ് ഞ്ഞ ഞ്ര, ള ള് ൾ ള്ള ള്ര, ശ ശ്ശ ശ് ശ്ര, ഷ ഷ് ഷ്ര, ഋ ൠ,1 ൧,2 ൨,3 ൩,4 ൪,5 ൫,6 ൬,7 ൭,8 ൮,9 ൯,0 ൦ ൰ ൱ ൲ °,- – — •, / \\, € $ £ ¥ ₩ ₽,& §, “ ” “ „ » «, . …, ? ¿, ! ¡, ‘ ’ ‘ `"

//ഹ ഃ, ഗ ഗ്ര ഗ് ഘ ഗ്ഗ, ദ ദ്ര ദ് ധ ദ്ദ, ജ ജ്ര ജ്ജ ജ് ഝ, ഡ ഢ ഡ് ഡ്ഡ ഡ്ര,പ ഫ പ് പ്പ പ്ര, റ ര ർ ര് ര്ര,ക ക്ര ക്ക ഖ ൿ ക്, ത ത്ര ത് ഥ ത്ത, ച ച്ര ച്ച ച് ഛ, ട ഠ ട് ട്ട ട്ര ഺ, മ ഞ മ് മ്മ മ്ര, ന ൹ ന്ന ണ ൻ ന് ന്ര ഩ, വ ഴ വ് വ്വ വ്ര, സ സ്ര സ് ശ സ്സ,യ യ്ര യ ഷ യ്യ,
//ഭ ഭ് ഭ്ര, ഴ ഴ് ഴ്ര, ഘ ഘ് ഘ്ര, ധ ധ്ധ ധ് ധ്ര, ഝ ഝ്ര ഝ്, ഫ ഫ് ഫ്ഫ ഫ്ര, റ റ് റ്റ റ്ര, ഥ ഥ് ഥ്ര, ഛ ഛ്ര ഛ്, ഠ ഠ് ഠ്ഠ ഠ്ര, ം ങ, ണ ൺ ണ്  ണ്ണ ണ്ര, ഞ ഞ് ഞ്ഞ ഞ്ര, ള ള് ൾ ള്ള ള്ര, ശ ശ്ശ ശ് ശ്ര, ഷ ഷ് ഷ്ര, ഋ ൠ

// 1 ൧,2 ൨,3 ൩,4 ൪,5 ൫,6 ൬,7 ൭,8 ൮,9 ൯,0 ൦ ൰ ൱ ൲ °


