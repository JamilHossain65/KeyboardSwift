//
//  UnicodeUr.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeUr: NSObject {
//}

let kFontUrDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersUrNormal,
        SHIFT  :kUnicodeLettersUrUnshiftArray,
        NUMERIC:kUnicodeLettersUrNumList,
        SYMBOL :kUnicodeLettersUrPuncuation
    ]
]

let kUnicodeLettersUrUnshiftArray = kUnicodeUrLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersUrPuncuation = kUnicodeUrPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersUrNumList    = kUnicodeUrNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersUrNormal = kUnicodeUrNormal.components(separatedBy: "৹ ") + vowelsUr + kSPECIALArray
let kUnicodeLettersUrStinky = kUnicodeUrStinky.components(separatedBy: "৹")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeUrNormal = "ক৹ খ৹ গ৹ ঘ৹ ঙ৹ চ৹ ছ৹ জ৹ ঝ৹ ঞ৹ \(kNL)৹ ট৹ ঠ৹ ড৹ ঢ৹ ণ৹ ত৹ দ৹ ন৹ k৹ স৹ \(kNL)৹ \(kSHIFT)"//থ৹ধ৹
let kUnicodeUrLetterShift = "অ৹ আ৹ ই৹ ঈ৹ উ৹ ঊ৹ ঋ৹ এ৹ ঐ৹ ও৹ \(kNL)৹ ঔ৹ প৹ ফ৹ ব৹ ভ৹ ম৹ য৹ র৹ ল৹ \(kNL)৹ \(kSHIFT)৹ শ৹ ষ৹ স৹ হ৹ ড়৹ ঢ়৹ য়৹ \(kSPECIAL)" //৹ৎ
let kUnicodeUrNumbers = "১৹ ২৹ ৩৹ ৪৹ ৫৹ ৬৹ ৭৹ ৮৹ ৯৹ ০৹ \(kNL)৹ ;৹ (৹ )৹ ।৹ :৹ ৳৹ a৹ b৹ c৹ \(kNL)৹ \(kSHIFT)৹ d৹ e৹ f৹ g৹ ৠ৹ ঌ৹ ৡ৹ \(kSPECIAL)"
let kUnicodeUrPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ /৹ |৹ ~৹ <৹ >৹ %৹ $৹ ^৹ \(kNL)৹ \(kSHIFT)৹ '৹ 0৹ ?৹ !৹ ’৹ *৹ \(kSPECIAL)"

//অ,আ,ই,ঈ,উ,ঊ,ঋ,এ,ঐ,ও,ঔ
//"জ,গ,ত,য,হ,ক,U,I,O,P,A,S,D,F,G,H,J,K,L,:,Z,X,C,V,B,N,M"

//Font strings
let kUnicodeUrSerif   = "𝑄,𝑤,𝑒,𝑟,𝑡,𝑦,𝑢,𝑖,𝑜,𝑝,𝑎,𝑠,𝑑,𝑓,𝑔,ℎ,𝑗,𝑘,𝑙,:,𝑧,𝑥,𝑐,𝑣,𝑏,𝑛,𝑚"
let kUnicodeUrStinky  = "q̾,w̾,e̾,r̾,t̾,y̾,u̾,i̾,o̾,p̾,a̾,s̾,d̾,f̾,g̾,h̾,j̾,k̾,l̾,:,z̾,x̾,c̾,v̾,b̾,n̾,m̾"

//bangla vowels
let vowelsUr = ["জ্ঞ","ং","্","া","ি","ু","ে"]


//MARK:- Hint Letters
let hintWordsUr = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
