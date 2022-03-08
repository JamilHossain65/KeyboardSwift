//
//  UnicodeTe.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeTe: NSObject {
//}

let kFontTeDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersTeNormal,
        SHIFT  :kUnicodeLettersTeUnshiftArray,
        NUMERIC:kUnicodeLettersTeNumList,
        SYMBOL :kUnicodeLettersTePuncuation
    ]
]

let kUnicodeLettersTeUnshiftArray = kUnicodeTeLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersTePuncuation = kUnicodeTePuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersTeNumList    = kUnicodeTeNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersTeNormal = kUnicodeTeNormal.components(separatedBy: "৹ ")

//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeTeNormal = " ౌ৹  ై৹  ా৹  ీ৹  ూ৹ బ৹ హ৹ గ৹ ద৹ జ৹ డ৹ \(kNL)৹  ో৹  ే৹  ్৹  ి৹  ు৹ ప৹ ర৹ క৹ త৹ చ৹ ట৹ \(kNL)৹ \(kSHIFT)৹  ొ৹  ె৹ మ৹ న৹ వ৹ ల৹ స৹ య৹  ృ৹ \(kSPECIAL)"
let kUnicodeTeLetterShift = "ఔ৹ ఐ৹ ఆ৹ ఈ৹ ఊ৹ భ৹ ః৹ ఘ৹ ధ৹ ఝ৹ ఢ৹ \(kNL)৹ ఓ৹ ఏ৹ అ৹ ఇ৹ ఉ৹ ఫ৹ ఱ৹ ఖ৹ థ৹ ఛ৹ ఠ৹ \(kNL)৹ \(kSHIFT)৹ ఒ৹ ఎ৹ ం৹ ణ৹ ఞ৹ ళ৹ శ৹ ష৹ ఋ৹ \(kSPECIAL)"
let kUnicodeTeNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ .৹ ।৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeTePuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ .৹ ॥৹ ఽ৹  ః৹  ఁ৹ ‘৹ \(kSPECIAL)"


/*
Telugu
ౌ ై ా ీ ూ బ హ గ ద జ డ
ో ే ్ ి ు ప ర క త చ ట
 ొ  ె మ న వ ల స య

ఔ ఐ ఆ ఈ ఊ భ ః ఘ ధ ఝ ఢ
ఓ ఏ అ ఇ ఉ ఫ ఱ ఖ థ ఛ ఠ
ఒ ఎ ం ణ ఞ ళ శ ష ఋ

1234567890
-/:;()₹&@“
.।,?!’

[]{}#%^*+=
_\|~<>$£€•
.॥ఽ ః ఁ ‘
*/








//MARK:- Hint Letters
let hintWordsTe = " ౌ ఔ, ై ఐ, ా ఆ, ీ ఈ, ూ ఊ, ో ఓ, ే ఏ, ్ అ, ి ఇ, ు ఉ, ొ ఒ, ె ఎ,బ భ బ్ బ్బ బ్ర, హ ః హ్ హ్ర, గ ఘ గ్ గ్గ గ్ర,ద ధ ద్‍ ద్ద ద్ధ ద్ర, జ ఝ జ్ జ్జ జ్ర ౙ, డ ఢ డ్ డ్డ డ్ర,ప ఫ ప్ ప్ప ప్ర, ర ఱ ర్ ర్ర,క ఖ క్ క్క క్ర, త థ త్ త్త త్ర, చ ఛ చ్ చ్చ చ్ఛ ౘ, ట ఠ ట్ ట్ట ట్ర, మ ం మ్ మ్మ మ్ర, న ణ న్ న్న ఞ ఙ, వ వ్ వ్వ వ్ర, ల ళ ల్ల ల్ ఌ ౡ  ౢ  ౣ, స శ ష స్ స్స, య య్ య్య, ృ ఋ ౄ,భ భ్ బ్ బ్బ బ్ర, హ ః హ్ హ్ర, గ ఘ గ్ గ్గ గ్ర, ద ధ ద్‍ ద్ద ద్ధ ద్ర, జ ఝ జ్ జ్జ జ్ర ౙ, డ ఢ డ్ డ్డ డ్ర, ఫ ఫ్ ఫ్ర, ఱ ఱ్, ఖ ఖ్, థ థ్, ఛ ఛ్ , ఠ ఠ్, ం ఁ , ణ ణ్ , ఞ ఞ్, ళ ళ్ ళ్ళ ఴ ఴ్, శ శ్ శ్శ శ్ర, ష ష్, ఋ ౠ,1 ౧,2 ౨,3 ౩,4 ౪,5 ౫,6 ౬,7 ౭,8 ౮,9 ౯,0 ౦ °,- – — •, / \\, € $ £ ¥ ₩ ₽,& §, “ ” “ „ » «, . …, ? ¿, ! ¡, ‘ ’ ‘ `"
//బ భ బ్ బ్బ బ్ర, హ ః హ్ హ్ర, గ ఘ గ్ గ్గ గ్ర,ద ధ ద్‍ ద్ద ద్ధ ద్ర, జ ఝ జ్ జ్జ జ్ర ౙ, డ ఢ డ్ డ్డ డ్ర,ప ఫ ప్ ప్ప ప్ర, ర ఱ ర్ ర్ర,క ఖ క్ క్క క్ర, త థ త్ త్త త్ర, చ ఛ చ్ చ్చ చ్ఛ ౘ, ట ఠ ట్ ట్ట ట్ర, మ ం మ్ మ్మ మ్ర, న ణ న్ న్న ఞ ఙ, వ వ్ వ్వ వ్ర, ల ళ ల్ల ల్ ఌ ౡ ౢ ౣ, స శ ష స్ స్స, య య్ య్య, ృ ఋ ౄ,భ భ్ బ్ బ్బ బ్ర, హ ః హ్ హ్ర, గ ఘ గ్ గ్గ గ్ర, ద ధ ద్‍ ద్ద ద్ధ ద్ర, జ ఝ జ్ జ్జ జ్ర ౙ, డ ఢ డ్ డ్డ డ్ర, ఫ ఫ్ ఫ్ర, ఱ ఱ్, ఖ ఖ్, థ థ్, ఛ ఛ్ , ఠ ఠ్, ం ఁ , ణ ణ్ , ఞ ఞ్, ళ ళ్ ళ్ళ ఴ ఴ్, శ శ్ శ్శ శ్ర, ష ష్, ఋ ౠ


