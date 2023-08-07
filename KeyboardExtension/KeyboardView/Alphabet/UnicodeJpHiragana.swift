//
//  UnicodeJpHiragana.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeJpHiragana: NSObject {
//}

let kFontJpHiraDic:[[String:[String]]] = [
    [NORMAL :kUnicodeLettersJpHiraNormal,
     SHIFT  :kUnicodeLettersJpHiraNormalShift,
     NUMERIC:kUnicodeLettersJpHiraNumList,
     SYMBOL :kUnicodeLettersJpHiraPuncuation],
]

let kUnicodeLettersJpHiraPuncuation   = kUnicodeJpHiraganaPuncuation  .components(separatedBy: kSEPERATOR)
let kUnicodeLettersJpHiraNumList      = kUnicodeJpHiraganaNumbers     .components(separatedBy: kSEPERATOR)
let kUnicodeLettersJpHiraNormal       = kUnicodeJpHiraganaNormal      .components(separatedBy: kSEPERATOR)
let kUnicodeLettersJpHiraNormalShift  = kUnicodeJpHiraganaNormalShift .components(separatedBy: kSEPERATOR)

/*
 #define kChar @[ @"あ", @"い", @"う", @"え", @"お",@"か",@"き", @"く", @"け", @"こ",@"さ",@"し", @"す", @"せ", @"そ",@"た", @"ち", @"つ", @"て", @"と",@"な", @"に", @"ぬ", @"ね", @"の",@"ゃ", @"ゅ", @"ょ", @"\u309B", @"゜"]

 #define kChar_shift @[ @"は", @"ひ", @"ふ", @"へ", @"ほ",@"ま", @"み", @"む", @"め", @"も",@"や", @"ゆ", @"よ", @"ら", @"り", @"る", @"れ", @"ろ",@"わ", @"を", @"ん", @"人", @"国",@"生",@"今", @"時", @"市", @"円",@"京", @"新", @""]

 #define kChar_alt @[ @"零", @"〇", @"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"十",@"百", @"千", @"万", @"億", @"兆", @"京", @"、", @"。", @"～",@"〻", @"「", @"」", @"￥",  @"$",  @"@", @"%", @"?", @"!", @"."]
 
 ///
 あ い う え お か き く け こ さ
 し す せ そ た ち つ て と な に
 ぬ ね の ゃ ゅ ょ \u309B ゜
 
 は ひ ふ ふ へ ほ ま み む め も
 や ゆ よ ら り る れ ろ わ を ん
 人 国 生 今 時 市 円 京 新
 #define kChar_shift @[ @"", @"", @"", @"", @"",@"", @"", @"", @"", @"",@"", @"", @"", @"", @"", @"", @"", @"",@"", @"", @"", @"", @"",@"",@"", @"", @"", @"",@"", @"", @""]

 
 零 〇 一 二 三 四 五 六 七 八 九
 十 百 千 万 億 兆 京 、 。～ 〻
 「 」 ￥ $ @ % ? ! .
 
 #define kChar_alt @[ @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"",@"", @"", @"", @"", @"", @"", @"", @"", @"",@"", @"", @"", @"",  @"",  @"", @"", @"", @"", @""]
 
*/

//Default font
let kUnicodeJpHiraganaNormal = "あ৹ い৹ う৹ え৹ お৹ か৹ き৹ く৹ け৹ こ৹ さ৹ \(kNL)৹ し৹ す৹ せ৹ そ৹ た৹ ち৹ つ৹ て৹ と৹ な৹ に৹ \(kNL)৹ \(kSHIFT)৹ ぬ৹ ね৹ の৹ ゃ৹ ゅ৹ ょ৹ ゛︎৹  ゜৹ \(kSPECIAL)"
let kUnicodeJpHiraganaNormalShift = "は৹ ひ৹ ふ৹ ふ৹ へ৹ ほ৹ ま৹ み৹ む৹ め৹ も৹ \(kNL)৹ や৹ ゆ৹ よ৹ ら৹ り৹ る৹ れ৹ ろ৹ わ৹ を৹ ん৹ \(kNL)৹ \(kSHIFT)৹ 人৹ 国৹ 生৹ 今৹ 時৹ 市৹ 円৹ 京৹ 新৹ \(kSPECIAL)"
let kUnicodeJpHiraganaNumbers = "零৹ 〇৹ 一৹ 二৹ 三৹ 四৹ 五৹ 六৹ 七৹ 八৹ 九৹ \(kNL)৹ 十৹ 百৹ 千৹ 万৹ 億৹ 兆৹ 京৹ 、৹ 。৹ ～৹ 〻৹ \(kNL)৹ \(kSHIFT)৹ 「৹ 」৹ ￥৹ $৹ @৹ %৹ ?৹ !৹ .৹ \(kSPECIAL)"
let kUnicodeJpHiraganaPuncuation = "[৹ ]৹ {৹ }৹ #৹ %৹ ^৹ *৹ +৹ =৹ \(kNL)৹ _৹ \\৹ |৹ ~৹ <৹ >৹ $৹ $৹ $৹ $৹ \(kNL)৹ \(kSHIFT)৹ .৹ ,৹ ?৹ !৹ '৹ \(kSPECIAL)" //todo need to implement comma


//MARK:- Hint words
let hintWordsJpHiragana = ""

