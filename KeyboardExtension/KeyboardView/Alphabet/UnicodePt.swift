//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}

let kFontPtDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersPtNormal,
     SHIFT  :kUnicodeLettersPtNormalShift,
     NUMERIC:kUnicodeLettersPtNumList,
     SYMBOL :kUnicodeLettersPtPuncuation],
]

let kUnicodeLettersPtPuncuation   = kUnicodePtPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersPtNumList      = kUnicodePtNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersPtNormal       = kUnicodePtNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersPtNormalShift  = kUnicodePtNormalShift .components(separatedBy: kSEPERATOR)


//Default font
let kUnicodePtNormal = "q৹ w৹ e৹ r৹ t৹ y৹ u৹ i৹ o৹ p৹ \(kNL)৹ a৹ s৹ d৹ f৹ g৹ h৹ j৹ k৹ l৹ \(kNL)৹ \(kSHIFT)৹ z৹ x৹ c৹ v৹ b৹ n৹ m৹ \(kSPECIAL)"
let kUnicodePtNormalShift = "Q৹ W৹ E৹ R৹ T৹ Y৹ U৹ I৹ O৹ P৹ \(kNL)৹ A৹ S৹ D৹ F৹ G৹ H৹ J৹ K৹ L৹ \(kNL)৹ \(kSHIFT)৹ Z৹ X৹ C৹ V৹ B৹ N৹ M৹ \(kSPECIAL)"
let kUnicodePtNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ $৹ &৹ @৹ \(kNL)৹ \(kSHIFT)৹ \"৹ .৹ ^৹ %৹ ?৹ !৹ *৹ \(kSPECIAL)"
let kUnicodePtPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ -৹ _৹ /৹ |৹ ~৹ <৹ >৹ €৹ $৹ \(kNL)৹ \(kSHIFT)৹ ¥৹ •৹ .৹ ?৹ !৹ \(kSPECIAL)" //todo need to implement comma


//MARK:- Hint words
let hintWordsPt = "w ŵ,e è é ê ë ē ė ę,y ŷ ÿ,u û ü ù ú ū,i î ï í ī į ì,o ô ö ò ó œ ø ō õ,a à á â ä æ ã å ā,s ß ś š,l ł,z ž ź ż,c ç ć č,n ñ ń,W Ŵ,E È É Ê Ë Ē Ė Ę,Y Ŷ Ÿ,U Û Ü Ù Ú Ū,I Î Ï Í Ī Į Ì,O Ô Ö Ò Ó Ó Œ Ø Ō Õ,A À Á Â Ä Æ Ã Å Ā,S Ś Š,L Ł,Z Ž Ź Ż,C Ç Ć Č,N Ñ Ń"
