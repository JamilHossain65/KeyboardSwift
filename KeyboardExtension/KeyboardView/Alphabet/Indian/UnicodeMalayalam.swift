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
let kUnicodeLettersMlStinky = kUnicodeMlStinky.components(separatedBy: "৹")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeMlNormal = "ൗ৹  ൈ৹  ാ৹  ീ৹  ൂ৹ ബ৹ ഹ৹ ഗ৹ ദ৹ ജ৹ ഡ৹ \(kNL)৹ ോ৹  േ৹  ്৹  ി৹  ു৹ പ৹ ര৹ ക৹ ത৹ ച৹ ട৹ \(kNL)৹ \(kSHIFT)৹ ോ৹  െ৹ മ৹ ന৹ വ৹ ല৹ സ৹ യ৹  ൃ৹ \(kSPECIAL)"
let kUnicodeMlLetterShift = "ഔ৹ ഐ৹ ആ৹ ഈ৹ ഊ৹ ഭ৹ ഴ৹ ഘ৹ ധ৹ ഝ৹ ഢ৹ \(kNL)৹ ഓ৹ ഏ৹ അ৹ ഇ৹ ഉ৹ ഫ৹ റ৹ ഖ৹ ഥ৹ ഛ৹ ഠ৹ \(kNL)৹ \(kSHIFT)৹ ഒ৹ എ৹  ം৹ ണ৹ ഞ৹ ള৹ ശ৹ ഷ৹ ഋ৹ \(kSPECIAL)"
let kUnicodeMlNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeMlPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ .৹ ॥৹ ഽ৹ ഽഃ৹ !৹ ’৹ \(kSPECIAL)"

/*
 Malayalam
 ൗൗ ൈ ാ ീ ൂ ബ ഹ ഗ ദ ജ ഡ
 ോോ േ ് ി ു പ ര ക ത ച ട
 ൊൊ െ മ ന വ ല സ യ
 ഔ ഐ ആ ഈ ഊ ഭ ഴ ഘ ധ ഝ ഢ
 ഓ ഏ അ ഇ ഉ ഫ റ ഖ ഥ ഛ ഠ
 ഒ എ ം ണ ഞ ള ശ ഷ ഋ

 1234567890
 -/:;()₹&@“
 .।,?!’

 []{}#%^*+=
 _\|~<>$£€•
 .॥ഽഃ!’
 */

//Font strings
let kUnicodeMlSerif   = "𝑄,𝑤,𝑒,𝑟,𝑡,𝑦,𝑢,𝑖,𝑜,𝑝,𝑎,𝑠,𝑑,𝑓,𝑔,ℎ,𝑗,𝑘,𝑙,:,𝑧,𝑥,𝑐,𝑣,𝑏,𝑛,𝑚"
let kUnicodeMlStinky  = "q̾,w̾,e̾,r̾,t̾,y̾,u̾,i̾,o̾,p̾,a̾,s̾,d̾,f̾,g̾,h̾,j̾,k̾,l̾,:,z̾,x̾,c̾,v̾,b̾,n̾,m̾"

//bangla vowels
let vowelsMl = ["জ্ঞ","ং","্","া","ি","ু","ে"] //["্","া","ি","ী","ু","ূ","ৃ","ে","ৈ","ো","ৌ"]



//MARK:- Hint Letters
let hintWordsMl = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
