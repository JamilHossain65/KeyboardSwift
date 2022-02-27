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
let hintWordsMl = "ൗ ഔ, ൈ ഐ, ാ ആ, ീ ഈ, ൂ ഊ, ബ ഭ, ഹ ഴ, ഗ ഘ, ദ ധ, ജ ഝ, ഡ ഢ, ോ ഓ, േ ഏ,  ് അ, ി ഇ, ു ഉ, പ ഫ, ര റ, ക ഖ, ത ഥ, ച ഛ, ട ഠ, ൊ ഒ,  െ എ, മ ണ, ന ഞ, വ ള, ല ശ, സ ഷ, യ ഋ"
