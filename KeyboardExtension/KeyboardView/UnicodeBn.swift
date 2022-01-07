//
//  UnicodeBn.swift
//  KeyboardExtBnsion
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeBn: NSObject {
//}

let kFontBnDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersBnNormal,
        SHIFT  :kUnicodeLettersBnUnshiftArray,
        NUMERIC:kUnicodeLettersBnNumList,
        SYMBOL :kUnicodeLettersBnPuncuation
    ]
]

let kUnicodeLettersBnUnshiftArray = kUnicodeBnLetterShift.components(separatedBy: ",")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersBnPuncuation = kUnicodeBnPuncuation.components(separatedBy: ";")
let kUnicodeLettersBnNumList    = kUnicodeBnNumbers.components(separatedBy: ",")

//Font Array
let kUnicodeLettersBnNormal = kUnicodeBnNormal.components(separatedBy: ",") + vowels
let kUnicodeLettersBnStinky = kUnicodeBnStinky.components(separatedBy: ",")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeBnPuncuation  = "[;];{;};#;%;^;*;+;=;_;/;|;~;<;>;%;$;^;:;';,;?;!;’;*"
let kUnicodeBnNumbers     = "১,২,৩,৪,৫,৬,৭,৮,৯,০,;,(,),।,:,৳,a,b,c,:,d,e,f,g,ৠ,ঌ,ৡ"
let kUnicodeBnNormal      = "ক,খ,গ,ঘ,ঙ,চ,ছ,জ,ঝ,ঞ,ট,ঠ,ড,ঢ,ণ,ত,দ,ন,স,:"//থ,ধ,
let kUnicodeBnLetterShift = "অ,আ,ই,ঈ,উ,ঊ,ঋ,এ,ঐ,ও,ঔ,প,ফ,ব,ভ,ম,য,র,ল,:,শ,ষ,স,হ,ড়,ঢ়,য়"//,ৎ
//অ,আ,ই,ঈ,উ,ঊ,ঋ,এ,ঐ,ও,ঔ
//"জ,গ,ত,য,হ,ক,U,I,O,P,A,S,D,F,G,H,J,K,L,:,Z,X,C,V,B,N,M"

//Font strings
let kUnicodeBnSerif   = "𝑄,𝑤,𝑒,𝑟,𝑡,𝑦,𝑢,𝑖,𝑜,𝑝,𝑎,𝑠,𝑑,𝑓,𝑔,ℎ,𝑗,𝑘,𝑙,:,𝑧,𝑥,𝑐,𝑣,𝑏,𝑛,𝑚"
let kUnicodeBnStinky  = "q̾,w̾,e̾,r̾,t̾,y̾,u̾,i̾,o̾,p̾,a̾,s̾,d̾,f̾,g̾,h̾,j̾,k̾,l̾,:,z̾,x̾,c̾,v̾,b̾,n̾,m̾"

//bangla vowels
let vowels = ["জ্ঞ","ং","্","া","ি","ু","ে"] //["্","া","ি","ী","ু","ূ","ৃ","ে","ৈ","ো","ৌ"]
let constants = ["ং"," ঁ","ঃ","ৃ"]
//,ং ,ঁ", ,ঃ",
/*
 ্, া, ি, ী, ু, ূ, ৃ, ে, ৈ, ো, ৌ,ক,খ,গ,ঘ,ঙ,চ,ছ,জ,ঝ,ঞ,ট,ঠ,ড,ঢ,ণ,থ,দ,ধ
 অ,আ,ই,ঈ,উ,ঊ,ঋ,এ,ঐ,ও,ঔ,ন,প,ফ,ব,ভ,ম,য,র,ল,শ,ষ,স,হ,ড়,ঢ়,য়,ৎ,
 ০,১,২,৩,৪,৫,৬,৭,৮,৯,৳,$,-,_,(,),@,।,?,!,., ঁ, ক  ক্ষ ক্স জ্ঞ ঞ্চ ঞ্ছ ঞ্জ
 */


//MARK:- Hint Letters
let hintWordsBn = "ঙ ঞ,ছ স শ ষ,জ য য়,ট ঠ,ঠ ট,ড ড়,ঢ ঢ়,ন ণ,ণ ন,ত থ ৎ,দ ধ,প ফ,ফ প,ব র ভ,স শ ষ ছ,ম ন ণ,  ্ অ,  া আ, ি ী ই ঈ, ু  ূ  ৃ উ ঊ ঋ, ে ো ৈ ৌ এ ও ঐ ঔ, ং ঃ  ঁ,জ্ঞ ক্ষ ক্স ঞ্চ ঞ্ছ ঞ্জ,অ  ্,আ  া,ই ঈ  ি ী, উ ঊ,ঋ  ৃ,এ ঐ,ও ঔ"
//
