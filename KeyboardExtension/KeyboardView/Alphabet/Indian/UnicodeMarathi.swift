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
 ौौ ै ा ी ू ब ह ग द ज ड
 ोो े ् ि ु प र क त च ट
 ंं ॅ म न व ल स य

 औ ऐ आ ई ऊ भ ऋ घ ध झ ढ
 ओ ए अ इ उ फ ृ ख थ छ ठ
  ऱ् ॲ ज्ञ ण क्ष ळ श ष

 १२३४५६७८९०
 -/:;()₹&@“
 .।,?!’

 []{}#%^*+=
 _\|~<>$£€•
 ॰॥ऽ ः ़ ॐ
 */

//Font strings
//let kUnicodeMrSerif   = "𝑄,𝑤,𝑒,𝑟,𝑡,𝑦,𝑢,𝑖,𝑜,𝑝,𝑎,𝑠,𝑑,𝑓,𝑔,ℎ,𝑗,𝑘,𝑙,:,𝑧,𝑥,𝑐,𝑣,𝑏,𝑛,𝑚"
//let kUnicodeMrStinky  = "q̾,w̾,e̾,r̾,t̾,y̾,u̾,i̾,o̾,p̾,a̾,s̾,d̾,f̾,g̾,h̾,j̾,k̾,l̾,:,z̾,x̾,c̾,v̾,b̾,n̾,m̾"

//bangla vowels
let vowelsMr = ["জ্ঞ","ং","্","া","ি","ু","ে"] //["্","া","ি","ী","ু","ূ","ৃ","ে","ৈ","ো","ৌ"]


//MARK:- Hint Letters
let hintWordsMr = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
