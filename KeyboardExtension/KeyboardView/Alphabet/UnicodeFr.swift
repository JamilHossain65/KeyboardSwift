//
//  UnicodeFr.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeFr: NSObject {
//}


let kFontFrDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersFrNormal,
     SHIFT  :kUnicodeLettersFrNormalShift,
     NUMERIC:kUnicodeLettersFrNumList,
     SYMBOL :kUnicodeLettersFrPuncuation],
]

let kUnicodeLettersFrPuncuation   = kUnicodeFrPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersFrNumList      = kUnicodeFrNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersFrNormal       = kUnicodeFrNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersFrNormalShift  = kUnicodeFrNormalShift .components(separatedBy: kSEPERATOR)


//Default font
let kUnicodeFrNormal = "q৹ w৹ e৹ r৹ t৹ y৹ u৹ i৹ o৹ p৹ \(kNL)৹ a৹ s৹ d৹ f৹ g৹ h৹ j৹ k৹ l৹ \(kNL)৹ \(kSHIFT)৹ z৹ x৹ c৹ v৹ b৹ n৹ m৹ \(kSPECIAL)"
let kUnicodeFrNormalShift = "Q৹ W৹ E৹ R৹ T৹ Y৹ U৹ I৹ O৹ P৹ \(kNL)৹ A৹ S৹ D৹ F৹ G৹ H৹ J৹ K৹ L৹ \(kNL)৹ \(kSHIFT)৹ Z৹ X৹ C৹ V৹ B৹ N৹ M৹ \(kSPECIAL)"
let kUnicodeFrNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ $৹ &৹ @৹ \(kNL)৹ \(kSHIFT)৹ \"৹ .৹ ^৹ %৹ ?৹ !৹ *৹ \(kSPECIAL)"
let kUnicodeFrPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ -৹ _৹ /৹ |৹ ~৹ <৹ >৹ €৹ $৹ \(kNL)৹ \(kSHIFT)৹ ¥৹ •৹ .৹ ?৹ !৹ \(kSPECIAL)" //todo need to implement comma



//MARK:- Hint words
let hintWordsFr = "e é è ê ë ę ė ē,y ÿ,u û ú ü ù ū,I î ï ì í į ī,o ô œ ö ò ó õ ø ō º,a à â æ á ä ã å ā ª,c ç ć č,n ñ ń,E È É Ê Ë Ē Ė Ę,Y Ÿ,U Û Ú Ü Ù Ū,I Î Ï Ì Í Į Ī,O Ô Œ Ö Ò Ó Õ Ø Ō º,A À Æ Á Ä Ã Å Ā ª,C Ç Ć Č,N Ñ Ń"
