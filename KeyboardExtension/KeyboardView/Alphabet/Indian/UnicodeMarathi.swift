//
//  UnicodeMr.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeMr: NSObject {
//}

let kFontMrDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersMrNormal,
        SHIFT  :kUnicodeLettersMrUnshiftArray,
        NUMERIC:kUnicodeLettersMrNumList,
        SYMBOL :kUnicodeLettersMrPuncuation
    ]
]

let kUnicodeLettersMrUnshiftArray = kUnicodeMrLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersMrPuncuation = kUnicodeMrPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersMrNumList    = kUnicodeMrNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersMrNormal = kUnicodeMrNormal.components(separatedBy: "৹ ")
//et kUnicodeLettersMrStinky = kUnicodeMrStinky.components(separatedBy: "৹")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeMrNormal = " ौ৹  ै৹  ा৹  ी৹  ू৹ ब৹ ह৹ ग৹ द৹ ज৹ ड৹ \(kNL)৹  ो৹  े৹  ्৹  ि৹  ु৹ प৹ र৹ क৹ त৹ च৹ ट৹ \(kNL)৹ \(kSHIFT)৹  ं৹  ॅ৹ म৹ न৹ व৹ ल৹ स৹ य৹ \(kSPECIAL)"
let kUnicodeMrLetterShift = "औ৹ ऐ৹ आ৹ ई৹ ऊ৹ भ৹ ऋ৹ घ৹ ध৹ झ৹ ढ৹ \(kNL)৹ ओ৹ ए৹ अ৹ इ৹ उ৹ फ৹  ृ৹ ख৹ थ৹ छ৹ ठ৹ \(kNL)৹ \(kSHIFT)৹ ऱ्৹ ॲ৹ ज्ञ৹ ण৹ क्ष৹ ळ৹ श৹ ष৹ \(kSPECIAL)"
let kUnicodeMrNumbers = "१৹ २৹ ३৹ ४৹ ५৹ ६৹ ७৹ ८৹ ९৹ ०৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeMrPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॰৹ ॥৹ ऽ৹  ः৹  ़৹ ॐ৹ \(kSPECIAL)"

/*
 Marathi

 १२३४५६७८९०
 -/:;()₹&@“
 .।,?!’

 []{}#%^*+=
 _\|~<>$£€•
 ॰॥ऽ ः ़ ॐ
 */


//MARK:- Hint Letters
let hintWordsMr = " ौ औ, ै ऐ, ा आ, ी ई, ू ऊ,ब भ,ह ऋ,ग घ,द ध,ज झ ज्ञ,ड ढ, ो ओ ॉ, े ए, ् अ, ि इ, ु उ,प फ,र  ृ ऱ्,क ख,त थ त्र,च छ,ट ठ, ं ऱ्  ँ, ॅ ॲ ऍ,म ॐ ज्ञ,न ण ञ ङ,व क्ष,ल ळ ऌ ॡ  ॢ  ॣ,स श ष,ऋ ॠ ॄ,ओ ऑ,य ष,ए ऍ,1 १,2 २,3 ३,4 ४,5 ५,6 ६,7 ७,8 ८,9 ९,0 ०,- – — •, / \\, € $ £ ¥ ₩ ₽,& §, “ ” “ „ » «, . …, ? ¿, ! ¡, ‘ ’ ‘ `"

//ज झ ज्ञ, ो ओ ॉ, र ृ ऱ् ,त थ त्र, ं ँ, ॅ ॲ ऍ, म ॐ,न ण ञ ङ, ल ळ ऌ ॡ ॢ ॣ, स श ष,ऋ ॠ ॄ,ओ ऑ, ए ऍ,
//1 १,2 २,3 ३,4 ४,5 ५,6 ६,7 ७,8 ८,9 ९,0 ०

