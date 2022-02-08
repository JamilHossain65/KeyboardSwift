//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject {
//}

//Steps of adding a new language
/*
 
Step1: Add New Class:UnicodeEn.swift[i.e: UnicodeBn.swift], folder: KeyboardView/Alphabet
Step2: Add New Class:LanguageName.txt[i.e: bangla.txt], folder: HintBar/Alphabet
 
Step3: Class:JhUtil,      veriable: kAllLanguageDicArray
Step4: Class:SharedClass, veriable: activeLanguages
Step5: Class:SharedClass, veriable: countryCodes
Step6: Class:SharedClass, veriable: languageCodes
 
*/
let kFontEnDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersEnNormal,
     SHIFT  :kUnicodeLettersEnNormalShift,
     NUMERIC:kUnicodeLettersEnNumList,
     SYMBOL :kUnicodeLettersEnPuncuation],
    
    ["𝕆𝕦𝕥𝕝𝕚𝕟𝕖":kUnicodeLettersEnOutline,
     SHIFT  :kUnicodeLettersEnNormalShift,
     NUMERIC:kUnicodeLettersEnNumList,
     SYMBOL :kUnicodeLettersEnPuncuation],
    
    ["Sᴍᴀʟʟ Cᴀᴘs":kUnicodeLettersEnSmallCaps],
    ["ᑕOᗰIᑕ":kUnicodeLettersEnComic],
    ["𝗦𝗮𝗻𝘀":kUnicodeLettersEnSans],
    ["𝙎𝙖𝙣𝙨":kUnicodeLettersEnSansItalic],
    ["ⒸⒾⓇⒸⓁⒺ":kUnicodeLettersEnCircleWhite],
    ["🅂🅀🅄🄰🅁🄴":kUnicodeLettersEnSquareWhite],
//    ["🆂🆀🆄🅰︎🆁🅴":kUnicodeLettersEnSquareBlack],
//    ["🇸 🇶 🇺 🇦 🇷 🇪":kUnicodeLettersEnSquareWLight],
    ["H̆̈ă̈p̆̈p̆̈y̆̈":kUnicodeLettersEnHappy],
    ["S̑̈ȃ̈d̑̈":kUnicodeLettersEnSad],
    ["S̾t̾i̾n̾k̾y̾":kUnicodeLettersEnStinky],
    ["B̥ͦu̥ͦb̥ͦb̥ͦl̥ͦe̥ͦs̥ͦ":kUnicodeLettersEnBubbles],
    ["U͟n͟d͟e͟r͟l͟i͟n͟e͟":kUnicodeLettersEnUnderline],
    ["R҉a҉y҉s҉":kUnicodeLettersEnRays],
    ["B҈i҈r҈d҈s҈":kUnicodeLettersEnBirds],
    ["S̸l̸a̸s̸h̸":kUnicodeLettersEnSlash],
    ["S⃠t⃠o⃠p⃠":kUnicodeLettersEnStop],
    ["S̺͆k̺͆y̺͆l̺͆i̺͆n̺͆e̺͆":kUnicodeLettersEnSkyline],
    ["A͎r͎r͎o͎w͎s͎":kUnicodeLettersEnArrows],
    ["S̶t̶r̶i̶k̶e̶":kUnicodeLettersEnStrike],
    ["c͜͡l͜͡o͜͡u͜͡d͜͡s͜͡":kUnicodeLettersEnClouds],
]

let kUnicodeLettersEnPuncuation   = kUnicodeEnPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnNumList      = kUnicodeEnNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnNormal       = kUnicodeEnNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnNormalShift  = kUnicodeEnNormalShift .components(separatedBy: kSEPERATOR)

let kUnicodeLettersEnStinky       = kUnicodeEnStinky      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnClouds       = kUnicodeEnClouds      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnHappy        = kUnicodeEnHappy       .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSad          = kUnicodeEnSad         .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnBubbles      = kUnicodeEnBubbles     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnUnderline    = kUnicodeEnUnderline   .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnRays         = kUnicodeEnRays        .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnBirds        = kUnicodeEnBirds       .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSlash        = kUnicodeEnSlash       .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSkyline      = kUnicodeEnSkyline     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnArrows       = kUnicodeEnArrows      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnStrike       = kUnicodeEnStrike      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnCircleWhite  = kUnicodeEnCircleWhite .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSquareWhite  = kUnicodeEnSquareWhite .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSquareBlack  = kUnicodeEnSquareBlack .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSquareWLight = kUnicodeEnSquareWLight.components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnOutline      = kUnicodeEnOutline     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSmallCaps    = kUnicodeEnSmallCaps   .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnComic        = kUnicodeEnComic       .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSans         = kUnicodeEnSans        .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnSansItalic   = kUnicodeEnSansItalic  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersEnStop         = kUnicodeEnStop        .components(separatedBy: kSEPERATOR)

//Default font
let kUnicodeEnNormal = "q৹ w৹ e৹ r৹ t৹ y৹ u৹ i৹ o৹ p৹ \(kNL)৹ a৹ s৹ d৹ f৹ g৹ h৹ j৹ k৹ l৹ \(kNL)৹ \(kSHIFT)৹ z৹ x৹ c৹ v৹ b৹ n৹ m৹ \(kSPECIAL)"
let kUnicodeEnNormalShift = "Q৹ W৹ E৹ R৹ T৹ Y৹ U৹ I৹ O৹ P৹ \(kNL)৹ A৹ S৹ D৹ F৹ G৹ H৹ J৹ K৹ L৹ \(kNL)৹ \(kSHIFT)৹ Z৹ X৹ C৹ V৹ B৹ N৹ M৹ \(kSPECIAL)"
let kUnicodeEnNumbers = "1৹ 2৹ 3৹ 4৹ 5৹ 6৹ 7৹ 8৹ 9৹ 0৹ \(kNL)৹ -৹ /৹ :৹ ;৹ (৹ )৹ $৹ &৹ @৹ \(kNL)৹ \(kSHIFT)৹ \"৹ .৹ ^৹ %৹ ?৹ !৹ *৹ \(kSPECIAL)"
let kUnicodeEnPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ -৹ _৹ /৹ |৹ ~৹ <৹ >৹ €৹ $৹ \(kNL)৹ \(kSHIFT)৹ ¥৹ •৹ .৹ ?৹ !৹ \(kSPECIAL)" //todo need to implement comma

//Others suported font
let kUnicodeEnSerif = "𝑄৹ 𝑤৹ 𝑒৹ 𝑟৹ 𝑡৹ 𝑦৹ 𝑢৹ 𝑖৹ 𝑜৹ 𝑝৹ \(kNL)৹ 𝑎৹ 𝑠৹ 𝑑৹ 𝑓৹ 𝑔৹ ℎ৹ 𝑗৹ 𝑘৹ 𝑙৹ \(kNL)৹ \(kSHIFT)৹ 𝑧৹ 𝑥৹ 𝑐৹ 𝑣৹ 𝑏৹ 𝑛৹ 𝑚৹ \(kSPECIAL)"
let kUnicodeEnStinky = "q̾৹ w̾৹ e̾৹ r̾৹ t̾৹ y̾৹ u̾৹ i̾৹ o̾৹ p̾৹ \(kNL)৹ a̾৹ s̾৹ d̾৹ f̾৹ g̾৹ h̾৹ j̾৹ k̾৹ l̾৹ \(kNL)৹ \(kSHIFT)৹ z̾৹ x̾৹ c̾৹ v̾৹ b̾৹ n̾৹ m̾৹ \(kSPECIAL)"
let kUnicodeEnClouds = "q͜͡৹ w͜͡৹ e͜͡৹ r͜͡৹ t͜͡৹ y͜͡৹ u͜͡৹ i͜͡৹ o͜͡৹ p͜͡৹ \(kNL)৹ a͜͡৹ s͜͡৹ d͜͡৹ f͜͡৹ g͜͡৹ h͜͡৹ j͜͡৹ k͜͡৹ l͜͡৹ \(kNL)৹ \(kSHIFT)৹ z͜͡৹ x͜͡৹ c͜͡৹ v͜͡৹ b͜͡৹ n͜͡৹ m͜͡৹ \(kSPECIAL)"
let kUnicodeEnHappy = "q̆̈৹ w̆̈৹ ĕ̈৹ r̆̈৹ t̆̈৹ y̆̈৹ ŭ̈৹ ĭ̈৹ ŏ̈৹ p̆̈৹ \(kNL)৹ ă̈৹ s̆̈৹ d̆̈৹ f̆̈৹ ğ̈৹ h̆̈৹ j̆̈৹ k̆̈৹ l̆̈৹ \(kNL)৹ \(kSHIFT)৹ z̆̈৹ x̆̈৹ c̆̈৹ v̆̈৹ b̆̈৹ n̆̈৹ m̆̈৹ \(kSPECIAL)"
let kUnicodeEnSad = "q̑̈৹ w̑̈৹ ȇ̈৹ ȓ̈৹ t̑̈৹ y̑̈৹ ȗ̈৹ ȋ̈৹ ȏ̈৹ p̑̈৹ \(kNL)৹ ȃ̈৹ s̑̈৹ d̑̈৹ f̑̈৹ g̑̈৹ h̑̈৹ j̑̈৹ k̑̈৹ l̑̈৹ \(kNL)৹ \(kSHIFT)৹ z̑̈৹ x̑̈৹ c̑̈৹ v̑̈৹ b̑̈৹ n̑̈৹ m̑̈৹ \(kSPECIAL)"
let kUnicodeEnBubbles = "q̥ͦ৹ w̥ͦ৹ e̥ͦ৹ r̥ͦ৹ t̥ͦ৹ y̥ͦ৹ u̥ͦ৹ i̥ͦ৹ o̥ͦ৹ p̥ͦ৹ \(kNL)৹ ḁͦ৹ s̥ͦ৹ d̥ͦ৹ f̥ͦ৹ g̥ͦ৹ h̥ͦ৹ j̥ͦ৹ k̥ͦ৹ l̥ͦ৹ \(kNL)৹ \(kSHIFT)৹ z̥ͦ৹ x̥ͦ৹ c̥ͦ৹ v̥ͦ৹ b̥ͦ৹ n̥ͦ৹ m̥ͦ৹ \(kSPECIAL)"
let kUnicodeEnRays = "q҉৹ w҉৹ e҉৹ r҉৹ t҉৹ y҉৹ u҉৹ i҉৹ o҉৹ p҉৹ \(kNL)৹ a҉৹ s҉৹ d҉৹ f҉৹ g҉৹ h҉৹ j҉৹ k҉৹ l҉৹ \(kNL)৹ \(kSHIFT)৹ z҉৹ x҉৹ c҉৹ v҉৹ b҉৹ n҉৹ m҉৹ \(kSPECIAL)"
let kUnicodeEnBirds = "q҈৹ w҈৹ e҈৹ r҈৹ t҈৹ y҈৹ u҈৹ i҈৹ o҈৹ p҈৹ \(kNL)৹ a҈৹ s҈৹ d҈৹ f҈৹ g҈৹ h҈৹ j҈৹ k҈৹ l҈৹ \(kNL)৹ \(kSHIFT)৹ z҈৹ x҈৹ c҈৹ v҈৹ b҈৹ n҈৹ m҈৹ \(kSPECIAL)"
let kUnicodeEnSlash = "q̸৹ w̸৹ e̸৹ r̸৹ t̸৹ y̸৹ u̸৹ i̸৹ o̸৹ p̸৹ \(kNL)৹ a̸৹ s̸৹ d̸৹ f̸৹ g̸৹ h̸৹ j̸৹ k̸৹ l̸৹ \(kNL)৹ \(kSHIFT)৹ z̸৹ x̸৹ c̸৹ v̸৹ b̸৹ n̸৹ m̸৹ \(kSPECIAL)"
let kUnicodeEnSkyline = "q̺͆৹ w̺͆৹ e̺͆৹ r̺͆৹ t̺͆৹ y̺͆৹ u̺͆৹ i̺͆৹ o̺͆৹ p̺͆৹ \(kNL)৹ a̺͆৹ z̺͆৹ d̺͆৹ f̺͆৹ g̺͆৹ h̺͆৹ j̺͆৹ k̺͆৹ l̺͆৹ \(kNL)৹ \(kSHIFT)৹ z̺͆৹ x̺͆৹ c̺͆৹ v̺͆৹ b̺͆৹ n̺͆৹ m̺͆৹ \(kSPECIAL)"
let kUnicodeEnArrows = "q͎৹ w͎৹ e͎৹ r͎৹ t͎৹ y͎৹ u͎৹ i͎৹ o͎৹ p͎৹ \(kNL)৹ a͎৹ s͎৹ d͎৹ f͎৹ g͎৹ h͎৹ j͎৹ k͎৹ l͎৹ \(kNL)৹ \(kSHIFT)৹ z͎৹ x͎৹ c͎৹ v͎৹ b͎৹ n͎৹ m͎৹ \(kSPECIAL)"
let kUnicodeEnStrike = "q̶৹ w̶৹ e̶৹ r̶৹ t̶৹ y̶৹ u̶৹ i̶৹ o̶৹ p̶৹ \(kNL)৹ a̶৹ s̶৹ d̶৹ f̶৹ g̶৹ h̶৹ j̶৹ k̶৹ l̶৹ \(kNL)৹ \(kSHIFT)৹ z̶৹ x̶৹ c̶৹ v̶৹ b̶৹ n̶৹ m̶৹ \(kSPECIAL)"
let kUnicodeEnRunes = "ዒ৹ ሠ৹ ቿ৹ ዪ৹ ፕ৹ ሃ৹ ሁ৹ ጎ৹ ዐ৹ የ৹ \(kNL)৹ ል৹ ነ৹ ዕ৹ ቻ৹ ኗ৹ ዘ৹ ጋ৹ ጕ৹ ረ৹ \(kNL)৹ \(kSHIFT)৹ ጊ৹ ሸ৹ ር৹ ሀ৹ ጌ৹ ክ৹ ጠ৹ \(kSPECIAL)"
let kUnicodeEnCircleWhite = "Ⓠ৹ Ⓦ৹ Ⓔ৹ Ⓡ৹ Ⓣ৹ Ⓨ৹ Ⓤ৹ Ⓘ৹ Ⓞ৹ Ⓟ৹ \(kNL)৹ Ⓐ৹ Ⓢ৹ Ⓓ৹ Ⓕ৹ Ⓖ৹ Ⓗ৹ Ⓙ৹ Ⓚ৹ Ⓛ৹ \(kNL)৹ \(kSHIFT)৹ Ⓩ৹ Ⓧ৹ Ⓒ৹ Ⓥ৹ Ⓑ৹ Ⓝ৹ Ⓜ︎৹ \(kSPECIAL)"
let kUnicodeEnSquareWhite = "🅀৹ 🅆৹ 🄴৹ 🅁৹ 🅃৹ 🅈৹ 🅄৹ 🄸৹ 🄾৹ 🄿৹ \(kNL)৹ 🄰৹ 🅂৹ 🄳৹ 🄵৹ 🄶৹ 🄷৹ 🄹৹ 🄺৹ 🄻৹ \(kNL)৹ \(kSHIFT)৹ 🅉৹ 🅇৹ 🄲৹ 🅅৹ 🄱৹ 🄽৹ 🄼৹ \(kSPECIAL)"
let kUnicodeEnSquareBlack = "🆀৹ 🆆৹ 🅴৹ 🆁৹ 🆃৹ 🆈৹ 🆄৹ 🅸৹ 🅾︎৹ 🅿︎৹ \(kNL)৹🅰︎ ৹🆂 ৹🅳 ৹🅵 ৹🅶 ৹🅷৹ 🅹৹ 🅺৹ 🅻৹ \(kNL)৹ \(kSHIFT)৹ 🆉৹ 🆇৹ 🅲৹ 🆅৹ 🅱︎৹ 🅽৹ 🅼৹ \(kSPECIAL)"
let kUnicodeEnSquareWLight = "🇶৹ 🇼৹ 🇪৹ 🇷৹ 🇹৹ 🇾৹ 🇺৹ 🇮৹ 🇴৹ 🇵৹ \(kNL)৹ 🇦৹ 🇸৹ 🇩৹ 🇫৹ 🇬৹ 🇭৹ 🇯৹ 🇰 ৹🇱৹ \(kNL)৹ \(kSHIFT)৹ 🇿 ৹🇽৹ 🇨৹ 🇻৹ 🇧৹ 🇳৹ 🇲৹ \(kSPECIAL)"
let kUnicodeEnUnderline = "q৹ w͟৹ e͟৹ r͟৹ t͟৹ y৹ u͟৹ i͟৹ o͟৹ p৹ \(kNL)৹ a͟৹ s͟৹ d͟৹ f͟৹ g৹ h͟৹ j৹ k͟৹ l͟৹ \(kNL)৹ \(kSHIFT)৹ z͟৹ x͟৹ c͟৹ v͟৹ b͟৹ n͟৹ m͟৹ \(kSPECIAL)"
let kUnicodeEnOutline = "𝕢৹ 𝕨৹ 𝕖৹ 𝕣৹ 𝕥৹ 𝕪৹ 𝕦৹ 𝕚৹ 𝕠৹ 𝕡৹ \(kNL)৹ 𝕒৹ 𝕤৹ 𝕕৹ 𝕗৹ 𝕘৹ 𝕙৹ 𝕛৹ 𝕜৹ 𝕝৹ \(kNL)৹ \(kSHIFT)৹ 𝕫৹ 𝕩৹ 𝕔৹ 𝕧৹ 𝕓৹ 𝕟৹ 𝕞৹ \(kSPECIAL)"
let kUnicodeEnSmallCaps = "Q৹ ᴡ৹ ᴇ৹ ʀ৹ ᴛ৹ ʏ৹ ᴜ৹ ɪ৹ ᴏ৹ ᴘ৹ \(kNL)৹ ᴀ৹ s৹ ᴅ৹ ғ৹ ɢ৹ ʜ৹ ᴊ৹ ᴋ৹ ʟ৹ \(kNL)৹ \(kSHIFT)৹ ᴢ৹ x৹ ᴄ৹ ᴠ৹ ʙ৹ ɴ৹ ᴍ৹ \(kSPECIAL)"
let kUnicodeEnComic = "ᑫ৹ ᗯ৹ ᗴ৹ ᖇ৹ T৹ Y৹ ᑌ৹ I৹ O৹ ᑭ৹ \(kNL)৹ ᗩ৹ ᔕ৹ ᗪ৹ ᖴ৹ ᘜ৹ ᕼ৹ ᒍ৹ K৹ ᒪ৹ \(kNL)৹ \(kSHIFT)৹ ᘔ৹ ᙭৹ ᑕ৹ ᐯ৹ ᗷ৹ ᑎ৹ ᗰ৹ \(kSPECIAL)"
let kUnicodeEnSans = "𝗤৹ 𝘄৹ 𝗲৹ 𝗿৹ 𝘁৹ 𝘆৹ 𝘂৹ 𝗶৹ 𝗼৹ 𝗽৹ \(kNL)৹ 𝗮৹ 𝘀৹ 𝗱৹ 𝗳৹ 𝗴৹ 𝗵৹ 𝗷৹ 𝗸৹ 𝗹৹ \(kNL)৹ \(kSHIFT)৹ 𝘇৹ 𝘅৹ 𝗰৹ 𝘃৹ 𝗯৹ 𝗻৹ 𝗺৹ \(kSPECIAL)"
let kUnicodeEnSansItalic = "𝙦৹ 𝙬৹ 𝙚৹ 𝙧৹ 𝙩৹ 𝙮৹ 𝙪৹ 𝙞৹ 𝙤৹ 𝙥৹ \(kNL)৹ 𝙖৹ 𝙨৹ 𝙙৹ 𝙛৹ 𝙜৹ 𝙝৹ 𝙟৹ 𝙠৹ 𝙡৹ \(kNL)৹ \(kSHIFT)৹ 𝙯৹ 𝙭৹ 𝙘৹ 𝙫৹ 𝙗৹ 𝙣৹ 𝙢৹ \(kSPECIAL)"
let kUnicodeEnStop = "q⃠৹ w⃠৹ e⃠৹ r⃠৹ t⃠৹ y⃠৹ u⃠৹ i⃠৹ o⃠৹ p⃠৹ \(kNL)৹ a⃠৹ s⃠৹ d⃠৹ f⃠৹ g⃠৹ h⃠৹ j⃠৹ k⃠৹ l⃠৹ \(kNL)৹ \(kSHIFT)৹ ®z⃠৹ x⃠৹ c⃠৹ v⃠৹ b⃠৹ n⃠৹ m⃠৹ \(kSPECIAL)"

//Normal Stinky Clouds Happy Sad Bubbles Underline Rays Birds Slash Skyline Arrows Strike CircleWhite CircleBlack SquareWhite SquareBlack SquareWhiteLight Outline


//MARK:- Hint words
let hintWordsEn = "w ŵ,e è é ê ë ē ė ę,y ŷ ÿ,u û ü ù ú ū,i î ï í ī į ì,o ô ö ò ó œ ø ō õ,a à á â ä æ ã å ā,s ß ś š,l ł,z ž ź ż,c ç ć č,n ñ ń,W Ŵ,E È É Ê Ë Ē Ė Ę,Y Ŷ Ÿ,U Û Ü Ù Ú Ū,I Î Ï Í Ī Į Ì,O Ô Ö Ò Ó Ó Œ Ø Ō Õ,A À Á Â Ä Æ Ã Å Ā,S Ś Š,L Ł,Z Ž Ź Ż,C Ç Ć Č,N Ñ Ń"
