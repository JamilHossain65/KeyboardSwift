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

let kUnicodeLettersRuNormal       = kUnicodeRuNormal     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersRuNormalShift  = kUnicodeRuNormalShift.components(separatedBy: kSEPERATOR)
let kUnicodeLettersRuNumList      = kUnicodeRuNumbers    .components(separatedBy: kSEPERATOR)
let kUnicodeLettersRuPuncuation   = kUnicodeRuPuncuation .components(separatedBy:kSEPERATOR)

//Default font
let kUnicodeRuNormal = "й৹ ц৹ у৹ к৹ е৹ н৹ г৹ ш৹ щ৹ з৹ х৹ \(kNL)৹ ф৹ ы৹ в৹ а৹ п৹ р৹ о৹ л৹ д৹ ж৹ э৹ \(kNL)৹ \(kSHIFT)৹ я৹ ч৹ с৹ м৹ и৹ т৹ ь৹ б৹ ю৹ \(kSPECIAL)"
let kUnicodeRuNormalShift = "Й৹ Ц৹ У৹ К৹ Е৹ Н৹ Г৹ Ш৹ Щ৹ З৹ Х৹ \(kNL)৹ Ф৹ Ы৹ В৹ А৹ П৹ Р৹ О৹ Л৹ Д৹ Ж৹ Э৹ \(kNL)৹ \(kSHIFT)৹ Я৹ Ч৹ С৹ М৹ И৹ Т৹ Ь৹ Б৹ Ю৹ \(kSPECIAL)"
let kUnicodeRuNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ ₽৹ &৹ «৹ @৹ \(kNL)৹ \(kSHIFT)৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeRuPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _ ৹ \\৹ |৹ ~৹ <৹ >৹ $৹ €৹ £৹ •৹ \(kNL)৹ \(kSHIFT)৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"

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
