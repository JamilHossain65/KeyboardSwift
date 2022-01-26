//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}


let kFontRuDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersRuNormal,
     SHIFT  :kUnicodeLettersRuNormalShift,
     NUMERIC:kUnicodeLettersRuNumList,
     SYMBOL :kUnicodeLettersRuPuncuation],
]

let kUnicodeLettersRuNormal       = kUnicodeRuNormal.components(separatedBy: ", ")
let kUnicodeLettersRuNormalShift  = kUnicodeRuNormalShift.components(separatedBy: ", ")
let kUnicodeLettersRuNumList      = kUnicodeRuNumbers.components(separatedBy: ", ")
let kUnicodeLettersRuPuncuation   = kUnicodeRuPuncuation.components(separatedBy:", ")

//Default font
let kUnicodeRuNormal = "й, ц, у, к, е, н, г, ш, щ, з, х\(kNL), ф, ы, в, а, п, р, о, л, д, ж, э\(kNL), \(kSHIFT), я, ч, с, м, и, т, ь, б, ю, \(kSPECIAL)"
let kUnicodeRuNormalShift = "Й, Ц, У, К, Е, Н, Г, Ш, Щ, З, Х\(kNL), Ф, Ы, В, А, П, Р, О, Л, Д, Ж, Э\(kNL), \(kSHIFT), Я, Ч, С, М, И, Т, Ь, Б, Ю, \(kSPECIAL)"
let kUnicodeRuNumbers = "1, 2, 3, 4, 5, 6, 7, 8, 9, 0\(kNL), -, /, :, ;, (, ), ₽, &, «, @\(kNL), \(kSHIFT), ., ,, ?, !, ’, \(kSPECIAL)"
let kUnicodeRuPuncuation = "[, ], {, }, #, %, ^, *, +, =\(kNL), _ , \\, |, ~, <, >, $, €, £, •\(kNL), \(kSHIFT), ., ,, ?, !, ’, \(kSPECIAL)"

/*
 й у у к е н г ш щ з х ф ы в а п р о л д ж э я ч с м и т ь б ю

 чсмитьбю
 
 
 ЙЦУКЕНГШЩЗХФЫВАПРОЛДЖЭЯЧСМИТЬБЮ

 1234567890-/:;()₽&@«.,?!’

 []{}#%^*+=_\|~<>$€£•.,?!’
 
 .… ,?¿!¡’’‘` -– _—-• \\||~<>$€:;()₽$€£¥₩&&@«”“„»«°0987654321•£€$><~|\_=+*^%‰№#}{][
 
 */

//MARK:- Hint words
let hintWordsRu = "ь ъ,Ь Ъ,0 °,- – _ —- •,/ \\,₽ $ € £ ¥ ₩,& §,« ” “ „ « »,. …,? ¿,! ¡,’ ’ ‘ `"
