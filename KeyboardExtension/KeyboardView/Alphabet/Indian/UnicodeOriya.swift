//
//  UnicodeOr.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeOr: NSObject {
//}

let kFontOrDic:[[String:[String]]] = [
    [
        NORMAL :kUnicodeLettersOrNormal,
        SHIFT  :kUnicodeLettersOrUnshiftArray,
        NUMERIC:kUnicodeLettersOrNumList,
        SYMBOL :kUnicodeLettersOrPuncuation
    ]
]

let kUnicodeLettersOrUnshiftArray = kUnicodeOrLetterShift.components(separatedBy: "৹ ")

//MARK:- Numbers and puncuations Array
let kUnicodeLettersOrPuncuation = kUnicodeOrPuncuation.components(separatedBy: "৹ ")
let kUnicodeLettersOrNumList    = kUnicodeOrNumbers.components(separatedBy: "৹ ")

//Font Array
let kUnicodeLettersOrNormal = kUnicodeOrNormal.components(separatedBy: "৹ ")


//MARK:- Numbers,punctuations,shift and unshift letters
let kUnicodeOrNormal = " ୌ৹  ୈ৹  ା৹  ୀ৹  ୂ৹ ବ৹ ହ৹ ଗ৹ ଦ৹ ଜ৹ ଡ৹ \(kNL)৹ ୋ৹  େ৹  ୍৹  ି৹  ୁ৹ ପ৹ ର৹ କ৹ ତ৹ ଚ৹ ଟ৹ \(kNL)৹ \(kSHIFT)৹ ଂ৹ ମ৹ ନ৹ ୱ৹ ଲ৹ ସ৹ ଶ৹ ଯ৹ \(kSPECIAL)"
let kUnicodeOrLetterShift = "ଔ৹ ଐ৹ ଆ৹ ଈ৹ ଊ৹ ଭ৹ ଋ৹ ଘ৹ ଧ৹ ଝ৹ ଢ৹ \(kNL)৹ ଓ৹ ଏ৹ ଅ৹ ଇ৹ ଉ৹ ଫ৹  ୃ৹ ଖ৹ ଥ৹ ଛ৹ ଠ৹ \(kNL)৹ \(kSHIFT)৹  ଁ৹ ଜ୍ଞ৹ ଣ৹ କ୍ଷ৹ ଳ৹  ଼৹ ଷ৹ ୟ৹ \(kSPECIAL)"
let kUnicodeOrNumbers = "୧৹ ୨৹ ୩৹ ୪৹ ୫৹ ୬৹ ୭৹ ୮৹ ୯৹ ୦৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₹৹ &৹ @৹ “৹ \(kNL)৹ \(kSHIFT)৹ ।৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeOrPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ €৹ •৹ \(kNL)৹ \(kSHIFT)৹ ॥৹ .৹ ଽ৹ ଃ৹ ଓ‍ଁ৹ '৹ \(kSPECIAL)"

/*
 Odia
 ୌ ୈ ା ୀ ୂ ବ ହ ଗ ଦ ଜ ଡ
 ୋ େ ୍ ି ୁ ପ ର କ ତ ଚ ଟ
 ଂଂ ମ ନ ୱ ଲ ସ ଶ ଯ

 ଔ ଐ ଆ ଈ ଊ ଭ ଋ ଘ ଧ ଝ ଢ
 ଓ ଏ ଅ ଇ ଉ ଫ ୃ ଖ ଥ ଛ ଠ
 ଁ ଜ୍ଞ ଣ କ୍ଷ ଳ ଼ ଷ  ୟ

 ୧୨୩୪୫୬୭୮୯୦
 -/:;()₹&@“
 ।.,?!’

 []{}#%^*+=
 _\|~<>$£€•
 ॥ . ଽ ଃ ଓ‍ଁ '
 
 */

//MARK:- Hint Letters
//let hintWordsOr = "ୌ ଔ, ୈ ଐ, ା ଆ, ୀ ଈ, ୂ ଊ, ବ ଭ,ହ ଋ,ଗ ଘ,ଦ ଧ,ଜ ଝ,ଡ ଢ, ୋ ଓ, େ ଏ, ୍ ଅ, ି ଇ, ୁ ଉ, ପ ଫ, ର ୃ , କ ଖ, ତ ଥ, ଚ ଛ, ଟ ଠ, ଁ,ମ ଜ୍ଞ,ନ ଣ,ୱ କ୍ଷ,ଲ ଳ,ସ  ଼,ଶ ଷ,ଯ ୟ"

let hintWordsOr = "ବ ବ୍ର ବ୍ବ ଵ ଭ ବ୍ ବର୍ ବ୍ଯ, ହ ହ୍ଯ ହର୍ ହ୍ ଃ ହ୍ହ ହ୍ର, ଗ ଗ୍ଯ ଗ୍ର ଗର୍ ଗ୍ ଘ ଗ୍ଗ, ଦ ଦ୍ଯ ଦର୍ ଦ୍ ଧ ଦ୍ଦ, ଜ ଜ୍ଯ ଜ୍ର ଜର୍ ଜ୍ଜ ଜ୍ ଝ, ଡ ଡ଼ ଢ ଡ୍ ଡ୍ଡ ଡର୍ ଡ୍ର ଡ୍ଯ,ପ ପ୍ ପର୍ ଫ ପ୍ପ ପ୍ର ପ୍ଯ, କ କ୍ କର୍ କ୍ଯ ଖ କ୍କ, ତ ତ୍ଯ ତର୍ ତ୍ ଥ ତ୍ତ, ଚ ଛ ଚ୍ ଚ୍ଚ ଚର୍ ଚ୍ର ଚ୍ଯ, ଟ ଠ ଟ୍ ଟ୍ଟ ଟର୍ ଟ୍ର ଟ୍ଯ,ମ ଜ୍ଞ ମ୍ ମ୍ମ ମର୍ ମର୍ ମ୍ର ମ୍ଯ, ନ ନ୍ନ ନ୍ର ନ୍ ନର୍ ନ୍ଯ ଣ ଞ ଙ, ୱ କ୍ଷ ୱ୍ ୱର୍ ୱ୍ର ୱ୍ଯ, ଲ ୡ ଲ୍ଯ ଲର୍ ଲ୍ ଲ୍ଲ ଲ୍ର ଌ ୢ ୣ, ସ ସ୍ସ ସ୍ର ସ୍ ସର୍ ସ୍ଯ, ଶ ଶ୍ଯ ଶ୍ର ଶର୍ ଶ୍ ଷ ଶ୍ଶ, ଯ ୟ ଯ୍ ଯ୍ଯ ଯର୍ ଯ୍ର,୧ 1,୨ 2,୩ 3,୪ 4,୫ 5,୬ 6,୭ 7,୮ 8,୯ 9,୦ 0,- – — •, / \\, € $ £ ¥ ₩ ₽,& §, “ ” “ „ » «, . …, ? ¿, ! ¡, ‘ ’ ‘ `"

//ବ ବ୍ର ବ୍ବ ଵ ଭ ବ୍ ବର୍ ବ୍ଯ, ହ ହ୍ଯ ହର୍ ହ୍ ଃ ହ୍ହ ହ୍ର, ଗ ଗ୍ଯ ଗ୍ର ଗର୍ ଗ୍ ଘ ଗ୍ଗ, ଦ ଦ୍ଯ ଦର୍ ଦ୍ ଧ ଦ୍ଦ, ଜ ଜ୍ଯ ଜ୍ର ଜର୍ ଜ୍ଜ ଜ୍ ଝ, ଡ ଡ଼ ଢ ଡ୍ ଡ୍ଡ ଡର୍ ଡ୍ର ଡ୍ଯ,ପ ପ୍ ପର୍ ଫ ପ୍ପ ପ୍ର ପ୍ଯ, କ କ୍ କର୍ କ୍ଯ ଖ କ୍କ, ତ ତ୍ଯ ତର୍ ତ୍ ଥ ତ୍ତ, ଚ ଛ ଚ୍ ଚ୍ଚ ଚର୍ ଚ୍ର ଚ୍ଯ, ଟ ଠ ଟ୍ ଟ୍ଟ ଟର୍ ଟ୍ର ଟ୍ଯ,ମ ଜ୍ଞ ମ୍ ମ୍ମ ମର୍ ମର୍ ମ୍ର ମ୍ଯ, ନ ନ୍ନ ନ୍ର ନ୍ ନର୍ ନ୍ଯ ଣ ଞ ଙ, ୱ କ୍ଷ ୱ୍ ୱର୍ ୱ୍ର ୱ୍ଯ, ଲ ୡ ଲ୍ଯ ଲର୍ ଲ୍ ଲ୍ଲ ଲ୍ର ଌ ୢ ୣ, ସ ସ୍ସ ସ୍ର ସ୍ ସର୍ ସ୍ଯ, ଶ ଶ୍ଯ ଶ୍ର ଶର୍ ଶ୍ ଷ ଶ୍ଶ, ଯ ୟ ଯ୍ ଯ୍ଯ ଯର୍ ଯ୍ର



