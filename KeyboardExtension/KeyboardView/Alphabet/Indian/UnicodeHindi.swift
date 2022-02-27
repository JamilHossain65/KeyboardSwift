//
//  UnicodeHi.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeHi: NSObject {
//}

let kFontHiDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersHiNormal,
        SHIFT  :kUnicodeLettersHiUnshiftArray,
        NUMERIC:kUnicodeLettersHiNumList,
        SYMBOL :kUnicodeLettersHiPuncuation
    ]
]

let kUnicodeLettersHiUnshiftArray = kUnicodeHiLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersHiPuncuation = kUnicodeHiPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersHiNumList    = kUnicodeHiNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersHiNormal = kUnicodeHiNormal.components(separatedBy: "৹ ")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeHiNormal = "ौ৹  ै৹  ा৹  ी৹  ू৹  ब৹  ह৹ ग৹ द৹ ज৹ ड৹ \(kNL)৹ ो৹  े৹  ्৹  ि৹  ु৹ प৹ र৹ क৹ त৹ च৹ ट৹ \(kNL)৹ \(kSHIFT)৹  ं৹  ॉ৹ म৹ न৹ व৹ ल৹ स৹ य৹ \(kSPECIAL)"
let kUnicodeHiLetterShift = "औ৹ ऐ৹ आ৹ ई৹ ऊ৹ भ৹ ऋ৹ घ৹ ध৹ झ৹ ढ৹ \(kNL)৹ ओ৹ ए৹ अ৹ इ৹ उ৹ फ৹  ृ৹ ख৹ थ৹ छ৹ ठ৹ \(kNL)৹ \(kSHIFT)৹  ँ৹ ऑ৹ ज्ञ৹ ण৹ क्ष৹  ়৹ श৹ ष৹ \(kSPECIAL)"
let kUnicodeHiNumbers = "१৹ २৹ ३৹ ४৹ ५৹ ६৹ ७৹ ८৹ ९৹ ०৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeHiPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ ^৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॥৹ ॰৹ ऽ৹  ः৹ ॐ৹ ’৹ \(kSPECIAL)"

/*
 Hindi
 ौौ ै ा ी ू ब ह ग द ज ड
 ोो े ् ि ु प र क त च ट
 ं ॉ म न व ल स य

 औ ऐ आ ई ऊ भ ऋ घ ध झ ढ
 ओ ए अ इ उ फ  ृ ख थ छ ठ
 ँँ ऑ ज्ञ ण क्ष ़ श ष

 १२३४५६७८९०
 -/:;()₹&@“
 ।.,?!’
 
 
 []{}#%^*+=
 _\|~<>$£€•
 ॥ ॰ ऽ  ः ॐ ’
 */

//MARK:- Hint Letters
let hintWordsHi = " ौ औ, ै ऐ, ा आ, ी ई, ू ऊ,ब भ,ह ऋ,ग घ,द ध,ज झ,ड ढ, ो ओ, े ए, ् अ, ि इ, ु उ, प फ,र  ृ,क ख,त थ,च छ,ट ठ, ं  ँ, ॉ ऑ,म ज्ञ,न ण,व क्ष,ल  ़,स श, य ष"

