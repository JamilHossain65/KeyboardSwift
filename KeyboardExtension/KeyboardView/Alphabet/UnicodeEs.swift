//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}


let kFontEsDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersEsNormal,
     SHIFT  :kUnicodeLettersEsNormalShift,
     NUMERIC:kUnicodeLettersEsNumList,
     SYMBOL :kUnicodeLettersEsPuncuation],
]

let kUnicodeLettersEsPuncuation   = kUnicodeEsPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEsNumList      = kUnicodeEsNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEsNormal       = kUnicodeEsNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEsNormalShift  = kUnicodeEsNormalShift .components(separatedBy: kSEPERATOR)


let kUnicodeEsNormal      = "q৹ w৹ e৹ r৹ t৹ y৹ u৹ i৹ o৹ p৹ \(kNL)৹ " +
                            "a৹ s৹ d৹ f৹ g৹ h৹ j৹ k৹ l৹ ñ৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ z৹ x৹ c৹ v৹ b৹ n৹ m৹ \(kSPECIAL)"

let kUnicodeEsNormalShift = "Q৹ W৹ E৹ R৹ T৹ Y৹ U৹ I৹ O৹ P৹ \(kNL)৹ " +
                            "A৹ S৹ D৹ F৹ G৹ H৹ J৹ K৹ L৹ Ñ৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ Z৹ X৹ C৹ V৹ B৹ N৹ M৹ \(kSPECIAL)"
let kUnicodeEsNumbers     = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ " +
                            "-৹ /৹ :৹ ;৹ (৹ )৹ €৹ &৹ @৹ “৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"
let kUnicodeEsPuncuation  = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ " +
                            "_৹ \\৹ |৹ ~৹ <৹ >৹ $৹ £৹ ¥৹ •৹ \(kNL)৹ " +
                            "\(kSHIFT)৹ .৹ ,৹ ?৹ !৹ ’৹ \(kSPECIAL)"


//MARK:- Hint words
let hintWordsEs = "e é è ë ê ę ė ē,u ú ü ù û ū,i í ï ì î į ī,o ó ò ö ô õ ø œ ō,a á à ä â ã å ą æ ā ª,s š,d đ,c ç ć č,n ń,E É È Ë Ê Ę Ė Ē,U Ú Ü Ù Û Ū,I Í Ï Ì Î Į Ī,O Ó Ò Ö Ô Õ Ø Œ Ō º,A Á À Ä Â Ã Å Ą Æ Ā ª,S Š,D Đ,C Ç Ć Č,N Ń,1 1º 1ª,2 2º 2ª,3 3º 3ª,4 4º 4ª,5 5º 5ª,6 6º 6ª,7 7º 7ª,8 8º 8ª,0 0º 0ª °,- – — •,/ \\, € $ £ ¥ ₩ ₽,& §,“ ” “ „ » «,. …,? ¿,! ¡,‘ ’ ‘ `"

//o ó ò ö ô õ ø œ ō º
