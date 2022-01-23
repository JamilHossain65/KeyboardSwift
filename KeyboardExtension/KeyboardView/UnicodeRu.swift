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
let kUnicodeRuNormal = "й, ц, у, к, е, н, г, ш, щ, з, х\(kNL), ф, ы, в, а, п, о, о, л, д, ж, э\(kNL), \(kSHIFT), я, с, с, с, и, т, ь, б, ю, \(kSPECIAL)"
let kUnicodeRuNormalShift = "Й, Ц, У, К, Е, Н, Г, Ш, Щ, З, Х\(kNL), Ф, Ы, В, А, П, Р, О, Л, Д, Ж, Э\(kNL), \(kSHIFT), Я, Ч, С, М, И, Т, Ь, Б, Ю, \(kSPECIAL)"
let kUnicodeRuNumbers = "1, 2, 3, 4, 5, 6, 7, 8, 9, 0\(kNL), -, /, ;, (, ), ₽, &, @, «, 0\(kNL), \(kSHIFT), ., ?, !, ’, 0, 0, \(kSPECIAL)"
let kUnicodeRuPuncuation  = "[, ], {, }, #, %, ^, *, +, =, _\(kNL), \\, |, ~, <, >, $, €, £, •, .\(kNL), \(kSHIFT), ?, !, ’, 0, 0, \(kSPECIAL)"

/*
 й у у к е н г ш щ з х ф ы в а п о о л д ж э я с с с и т ь б ю

 ЙЦУКЕНГШЩЗХФЫВАПРОЛДЖЭЯЧСМИТЬБЮ

 1234567890-/:;()₽&@«.,?!’

 []{}#%^*+=_\|~<>$€£•.,?!’
 */

//MARK:- Hint words
//let hintWordsEn = "w ŵ,e è é ê ë ē ė ę,y ŷ ÿ,u û ü ù ú ū,i î ï í ī į ì,o ô ö ò ó œ ø ō õ,a à á â ä æ ã å ā,s ß ś š,l ł,z ž ź ż,c ç ć č,n ñ ń,W Ŵ,E È É Ê Ë Ē Ė Ę,Y Ŷ Ÿ,U Û Ü Ù Ú Ū,I Î Ï Í Ī Į Ì,O Ô Ö Ò Ó Ó Œ Ø Ō Õ,A À Á Â Ä Æ Ã Å Ā,S Ś Š,L Ł,Z Ž Ź Ż,C Ç Ć Č,N Ñ Ń"
