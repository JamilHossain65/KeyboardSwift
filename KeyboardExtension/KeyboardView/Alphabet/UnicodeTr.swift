//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}

let kFontTrDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersTrNormal,
     SHIFT  :kUnicodeLettersTrNormalShift,
     NUMERIC:kUnicodeLettersTrNumList,
     SYMBOL :kUnicodeLettersTrPuncuation],
]

let kUnicodeLettersTrPuncuation   = kUnicodeTrPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersTrNumList      = kUnicodeTrNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersTrNormal       = kUnicodeTrNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersTrNormalShift  = kUnicodeTrNormalShift .components(separatedBy: kSEPERATOR)


//Default font
let kUnicodeTrNormal = "q৹ w৹ e৹ r৹ t৹ y৹ u৹ i৹ o৹ p৹ \(kNL)৹ a৹ s৹ d৹ f৹ g৹ h৹ j৹ k৹ l৹ \(kNL)৹ \(kSHIFT)৹ z৹ x৹ c৹ v৹ b৹ n৹ m৹ \(kSPECIAL)"
let kUnicodeTrNormalShift = "Q৹ W৹ E৹ R৹ T৹ Y৹ U৹ İ৹ O৹ P৹ \(kNL)৹ A৹ S৹ D৹ F৹ G৹ H৹ J৹ K৹ L৹ \(kNL)৹ \(kSHIFT)৹ Z৹ X৹ C৹ V৹ B৹ N৹ M৹ \(kSPECIAL)"
let kUnicodeTrNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ $৹ &৹ @৹ \(kNL)৹ \(kSHIFT)৹ \"৹ .৹ ^৹ %৹ ?৹ !৹ *৹ \(kSPECIAL)"
let kUnicodeTrPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ -৹ _৹ /৹ |৹ ~৹ <৹ >৹ €৹ $৹ \(kNL)৹ \(kSHIFT)৹ ¥৹ •৹ .৹ ?৹ !৹ \(kSPECIAL)" //todo need to implement comma


//MARK:- Hint words
let hintWordsTr = "u û ü ù ú ū,i ı î ï ì í į ī,o ö ô œ ò ó õ ø ō,a â,s ş ß ś š,g ğ,c ç ć č,U Û Ü Ù Ú Ū,İ I Î Ï Ì Í Į,O Ö Ô Œ Ò Ó Õ Ø Ō,A Â,S Ş Ś Š,G Ğ,C Ç Ć Č"
