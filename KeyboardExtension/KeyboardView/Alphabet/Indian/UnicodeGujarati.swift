//
//  UnicodeGu.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeGu: NSObject {
//}

let kFontGuDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersGuNormal,
        SHIFT  :kUnicodeLettersGuUnshiftArray,
        NUMERIC:kUnicodeLettersGuNumList,
        SYMBOL :kUnicodeLettersGuPuncuation
    ]
]

let kUnicodeLettersGuUnshiftArray = kUnicodeGuLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersGuPuncuation = kUnicodeGuPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersGuNumList    = kUnicodeGuNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersGuNormal = kUnicodeGuNormal.components(separatedBy: "৹ ")
//let kUnicodeLettersGuStinky = kUnicodeGuStinky.components(separatedBy: "৹")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeGuNormal = " ૌ৹  ૈ৹  ા৹  ી৹  ૂ৹ બ৹ હ৹ ગ৹ દ৹ જ৹ ડ৹ \(kNL)৹  ો৹  ે৹  ્৹  િ৹  ુ৹ પ৹ ર৹ ક৹ ત৹ ચ৹ ટ৹ \(kNL)৹ \(kSHIFT)৹  ં৹ ત৹ ર৹ મ৹ ન৹ વ৹ લ৹ સ৹ ય৹ \(kSPECIAL)"
let kUnicodeGuLetterShift = "ઔ৹ ઐ৹ આ৹ ઈ৹ ઊ৹ ભ৹ ઋ৹ ઘ৹ ધ৹ ઝ৹ ઢ৹ \(kNL)৹ ઓ৹ એ৹ અ৹ ઇ৹ ઉ৹ ફ৹  ૃ৹ ખ৹ થ৹ છ৹ ઠ৹ \(kNL)৹ \(kSHIFT)৹ ઑ৹  ઁ৹ જ્ઞ৹ ણ৹ ક્৹ ષ৹ ળ৹ શ৹ ષ৹ \(kSPECIAL)" //৹ৎ
let kUnicodeGuNumbers = "૧৹ ૨৹ ૩৹ ૪৹ ૫৹ ૬৹ ૭৹ ૮৹ ૯৹ ૦৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeGuPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ \(kNL)৹ \(kSHIFT)৹ ॥৹ .৹ ઽ৹  ઃ৹  ઼৹  ૐ৹ \(kSPECIAL)"

/*
//Font strings
let kUnicodeGuSerif   = "𝑄,𝑤,𝑒,𝑟,𝑡,𝑦,𝑢,𝑖,𝑜,𝑝,𝑎,𝑠,𝑑,𝑓,𝑔,ℎ,𝑗,𝑘,𝑙,:,𝑧,𝑥,𝑐,𝑣,𝑏,𝑛,𝑚"
let kUnicodeGuStinky  = "q̾,w̾,e̾,r̾,t̾,y̾,u̾,i̾,o̾,p̾,a̾,s̾,d̾,f̾,g̾,h̾,j̾,k̾,l̾,:,z̾,x̾,c̾,v̾,b̾,n̾,m̾"

//bangla vowels
let vowelsGu = ["জ্ঞ","ং","্","া","ি","ু","ে"]
let constantsGu = ["ং"," ঁ","ঃ","ৃ"]

*/

/*
 ૌ ૈ ા ી ૂ બહગદજડ
 ો ે ્ િ ુ પરકતચટ
 ં ત્રમનવલસય

 ઔઐઆઈઊભઋઘધઝઢ
 ઓએઅઇઉફ ૃ ખથછઠ
 ઑ ઁ જ્ઞણક્ષળશષ

 ૧૨૩૪૫૬૭૮૯૦
 -/:;()₹&@“
 ।.,?!’
 
 []{}#%^*+=
 _\|~<>૱$£•
 ॥.ઽ ઃ ઼ ૐ
 */


//MARK:- Hint Letters
let hintWordsGu = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
