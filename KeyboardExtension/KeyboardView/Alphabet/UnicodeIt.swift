//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}


let kFontItDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersItNormal,
     SHIFT  :kUnicodeLettersItNormalShift,
     NUMERIC:kUnicodeLettersItNumList,
     SYMBOL :kUnicodeLettersItPuncuation],
]

let kUnicodeLettersItPuncuation   = kUnicodeItPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersItNumList      = kUnicodeItNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersItNormal       = kUnicodeItNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersItNormalShift  = kUnicodeItNormalShift .components(separatedBy: kSEPERATOR)


//Default font
let kUnicodeItNormal = "q৹ w৹ e৹ r৹ t৹ y৹ u৹ i৹ o৹ p৹ \(kNL)৹ a৹ s৹ d৹ f৹ g৹ h৹ j৹ k৹ l৹ \(kNL)৹ \(kSHIFT)৹ z৹ x৹ c৹ v৹ b৹ n৹ m৹ \(kSPECIAL)"
let kUnicodeItNormalShift = "Q৹ W৹ E৹ R৹ T৹ Y৹ U৹ I৹ O৹ P৹ \(kNL)৹ A৹ S৹ D৹ F৹ G৹ H৹ J৹ K৹ L৹ \(kNL)৹ \(kSHIFT)৹ Z৹ X৹ C৹ V৹ B৹ N৹ M৹ \(kSPECIAL)"
let kUnicodeItNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ $৹ &৹ @৹ \(kNL)৹ \(kSHIFT)৹ \"৹ .৹ ^৹ %৹ ?৹ !৹ *৹ \(kSPECIAL)"
let kUnicodeItPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ -৹ _৹ /৹ |৹ ~৹ <৹ >৹ €৹ $৹ \(kNL)৹ \(kSHIFT)৹ ¥৹ •৹ .৹ ?৹ !৹ \(kSPECIAL)" 


//MARK:- Hint words
let hintWordsIt = "e è é ê ë ē ė ę,y ŷ ÿ,u û ü ù ú ū,i î ï í ī į ì,o ô ö ò ó œ ø ō õ,a à á â ä æ ã å ā,s ß ś š,c ç ć č,E È É Ê Ë Ē Ė Ę,U Û Ü Ù Ú Ū,I Î Ï Í Ī Į Ì,O Ô Ö Ò Ó Ó Œ Ø Ō Õ,A À Á Â Ä Æ Ã Å Ā,S Ś Š,C Ç Ć Č,1 1º 1ª,2 2º 2ª,3 3º 3ª,4 4º 4ª,5 5º 5ª,6 6º 6ª,7 7º 7ª,8 8º 8ª,0 0º 0ª °,- – — •,/ \\, € $ £ ¥ ₩ ₽,& §,“ ” “ „ » «,. …,? ¿,! ¡,‘ ’ ‘ `"
