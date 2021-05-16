//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject { }

let kOutline    = "𝕆𝕦𝕥𝕝𝕚𝕟𝕖" //d835 //"𝕆𝕦𝕥𝕝𝕚𝕟𝕖"    //"\ud835\udd46\ud835\udd66\ud835\udd65\ud835\udd5d\ud835\udd5a\ud835\udd5f\ud835\udd56"
let kSmallCaps  = "Sᴍᴀʟʟ Cᴀᴘs"  //"S\u1d0d\u1d00\u029f\u029f C\u1d00\u1d18s"
let kComic      = "ᑕOᗰIᑕ"      //"\u{1455O}\u{15f0I}\u{1455}"
let kSans       = "𝗦𝗮𝗻𝘀"       //"\ud835\udde6\ud835\uddee\ud835\uddfb\ud835\ude00"
let kSansItalic = "𝙎𝙖𝙣𝙨" //"\ud835\ude4e\ud835\ude56\ud835\ude63\ud835\ude68"


/*

*/


let kCircle = "ⒸⒾⓇⒸⓁⒺ"
let kHappy = "H̆̈ă̈p̆̈p̆̈y̆̈"
let kSad = "S̑̈ȃ̈d̑̈"
let kSquareWhite = "🅂🅀🅄🄰🅁🄴"
let kSquareBlack = "🆂🆀🆄🅰︎🆁🅴"



let kSquareLight = "🇸 🇶 🇺 🇦 🇷 🇪"
let kSkinky = "S̾t̾i̾n̾k̾y̾"
let kBubbles = "B̥ͦu̥ͦb̥ͦb̥ͦl̥ͦe̥ͦs̥ͦ"
let kUnderline = "U͟n͟d͟e͟r͟l͟i͟n͟e͟"
let kRays = "R҉a҉y҉s҉"













let kBirds = "B҈i҈r҈d҈s҈"
let kSlash = "S̸l̸a̸s̸h̸"
let kStop = "S⃠t⃠o⃠p⃠"
let kSkyline = "S̺͆k̺͆y̺͆l̺͆i̺͆n̺͆e̺͆"
let kArrows = "A͎r͎r͎o͎w͎s͎"



let kStrike = "S̶t̶r̶i̶k̶e̶"
let kClouds = "c͜͡l͜͡o͜͡u͜͡d͜͡s͜͡"
// S̶t̶r̶i̶k̶e̶


let kUnicodeFontArray = [kUnicodeLettersEnNormal,
                         kUnicodeLettersEnOutline,
                         kUnicodeLettersEnSmallCaps,
                         kUnicodeLettersEnComic,
                         kUnicodeLettersEnSans,
                         kUnicodeLettersEnSansItalic,
                         kUnicodeLettersEnCircleWhite,
                         kUnicodeLettersEnSquareWhite,
                         kUnicodeLettersEnSquareBlack,
                         kUnicodeLettersEnSquareWLight,
                         kUnicodeLettersEnStinky,
                         kUnicodeLettersEnBubbles,
                         kUnicodeLettersEnUnderline,
                         kUnicodeLettersEnRays,
                         kUnicodeLettersEnBirds,
                         kUnicodeLettersEnSlash,
                         kUnicodeLettersEnStop,
                         kUnicodeLettersEnSkyline,
                         kUnicodeLettersEnArrows,
                         kUnicodeLettersEnStrike,
                         kUnicodeLettersEnClouds
]

let kUnicodeFontNameArray = ["Normal",
                             kOutline,
                             kSmallCaps,
                             kComic,
                             kSans,
                             kSansItalic,
                             kCircle,
                             kHappy,
                             kSad,
                             kSquareWhite,
                             kSquareBlack,
                             kSquareLight,
                             kSkinky,
                             kBubbles,
                             kUnderline,
                             kRays,
                             kBirds,
                             kSlash,
                             kStop,
                             kSkyline,
                             kArrows,
                             kStrike,
                             kClouds,
]

/*
𝑄𝑤𝑒𝑟𝑡𝑦𝑢𝑖𝑜𝑝𝑎𝑠𝑑𝑓𝑔ℎ𝑗𝑘𝑙𝑧𝑥𝑐𝑣𝑏𝑛𝑚
Qᴡᴇʀᴛʏᴜɪᴏᴘᴀsᴅғɢʜᴊᴋʟᴢxᴄᴠʙɴᴍ
ᑫᗯᗴᖇTYᑌIOᑭᗩᔕᗪᖴᘜᕼᒍKᒪᘔ᙭ᑕᐯᗷᑎᗰ
𝗤𝘄𝗲𝗿𝘁𝘆𝘂𝗶𝗼𝗽𝗮𝘀𝗱𝗳𝗴𝗵𝗷𝗸𝗹𝘇𝘅𝗰𝘃𝗯𝗻𝗺
𝙦𝙬𝙚𝙧𝙩𝙮𝙪𝙞𝙤𝙥𝙖𝙨𝙙𝙛𝙜𝙝𝙟𝙠𝙡𝙯𝙭𝙘𝙫𝙗𝙣𝙢
ⓆⓌⒺⓇⓉⓎⓊⒾⓄⓅⒶⓈⒹⒻⒼⒽⒿⓀⓁⓏⓍⒸⓋⒷⓃⓂ︎
q͜͡w͜͡e͜͡r͜͡t͜͡y͜͡u͜͡i͜͡o͜͡p͜͡a͜͡s͜͡d͜͡f͜͡g͜͡h͜͡j͜͡k͜͡l͜͡z͜͡x͜͡c͜͡v͜͡b͜͡n͜͡m͜͡
q̆̈w̆̈ĕ̈r̆̈t̆̈y̆̈ŭ̈ĭ̈ŏ̈p̆̈ă̈s̆̈d̆̈f̆̈ğ̈h̆̈j̆̈k̆̈l̆̈z̆̈x̆̈c̆̈v̆̈b̆̈n̆̈m̆̈
q̑̈w̑̈ȇ̈ȓ̈t̑̈y̑̈ȗ̈ȋ̈ȏ̈p̑̈ȃ̈s̑̈d̑̈f̑̈g̑̈h̑̈j̑̈k̑̈l̑̈z̑̈x̑̈c̑̈v̑̈b̑̈n̑̈m̑̈
🅀🅆🄴🅁🅃🅈🅄🄸🄾🄿🄰🅂🄳🄵🄶🄷🄹🄺🄻🅉🅇🄲🅅🄱🄽🄼
🆀🆆🅴🆁🆃🆈🆄🅸🅾︎🅿︎🅰︎🆂🅳🅵🅶🅷🅹🅺🅻🆉🆇🅲🆅🅱︎🅽🅼
🇶 🇼 🇪 🇷 🇹 🇾 🇺 🇮 🇴 🇵 🇦 🇸 🇩 🇫 🇬 🇭 🇯 🇰 🇱 🇿 🇽 🇨 🇻 🇧 🇳 🇲
𝘲᭙ꫀ𝘳𝓽ꪗꪊ𝓲ꪮρꪖ𝘴ᦔᠻᧁꫝ𝓳𝘬ꪶɀ᥊ᥴꪜ᥇ꪀꪑ
Ҩ山乇尺ㄒㄚㄩ|ㄖ卩卂丂ᗪ千ᘜ卄ﾌҜㄥ乙乂匚ᐯ乃几爪

 
 q̥ͦw̥ͦe̥ͦr̥ͦt̥ͦy̥ͦu̥ͦi̥ͦo̥ͦp̥ͦḁͦs̥ͦd̥ͦf̥ͦg̥ͦh̥ͦj̥ͦk̥ͦl̥ͦz̥ͦx̥ͦc̥ͦv̥ͦb̥ͦn̥ͦm̥ͦ
  ͟qw͟e͟r͟t͟ ͟yu͟i͟o͟ ͟pa͟s͟d͟f͟ ͟gh͟ ͟jk͟l͟z͟x͟c͟v͟b͟n͟m͟
 q҉w҉e҉r҉t҉y҉u҉i҉o҉p҉a҉s҉d҉f҉g҉h҉j҉k҉l҉z҉x҉c҉v҉b҉n҉m҉
 q҈w҈e҈r҈t҈y҈u҈i҈o҈p҈a҈s҈d҈f҈g҈h҈j҈k҈l҈z҈x҈c҈v҈b҈n҈m҈
 q̸w̸e̸r̸t̸y̸u̸i̸o̸p̸a̸s̸d̸f̸g̸h̸j̸k̸l̸z̸x̸c̸v̸b̸n̸m̸
 q⃠w⃠e⃠r⃠t⃠y⃠u⃠i⃠o⃠p⃠a⃠s⃠d⃠f⃠g⃠h⃠j⃠k⃠l⃠z⃠x⃠c⃠v⃠b⃠n⃠m⃠
 q̺͆w̺͆e̺͆r̺͆t̺͆y̺͆u̺͆i̺͆o̺͆p̺͆a̺͆z̺͆d̺͆f̺͆g̺͆h̺͆j̺͆k̺͆l̺͆z̺͆x̺͆c̺͆v̺͆b̺͆n̺͆m̺͆
 q͎w͎e͎r͎t͎y͎u͎i͎o͎p͎a͎s͎d͎f͎g͎h͎j͎k͎l͎z͎x͎c͎v͎b͎n͎m͎
 ዒሠቿዪፕሃሁጎዐየልነዕቻኗዘጋጕረጊሸርሀጌክጠ
 q̶w̶e̶r̶t̶y̶u̶i̶o̶p̶a̶s̶d̶f̶g̶h̶j̶k̶l̶z̶x̶c̶v̶b̶n̶m̶
 */

let kUnicodeLettersEnNormal       = kUnicodeEnNormal.components(separatedBy: ",")
let kUnicodeLettersEnStinky       = kUnicodeEnStinky.components(separatedBy: ",")
let kUnicodeLettersEnClouds       = kUnicodeEnClouds.components(separatedBy: ",")
let kUnicodeLettersEnHappy        = kUnicodeEnHappy.components(separatedBy: ",")
let kUnicodeLettersEnSad          = kUnicodeEnSad.components(separatedBy: ",")
let kUnicodeLettersEnBubbles      = kUnicodeEnBubbles.components(separatedBy: ",")
let kUnicodeLettersEnUnderline    = kUnicodeEnUnderline.components(separatedBy: ",")
let kUnicodeLettersEnRays         = kUnicodeEnRays.components(separatedBy: ",")
let kUnicodeLettersEnBirds        = kUnicodeEnBirds.components(separatedBy: ",")
let kUnicodeLettersEnSlash        = kUnicodeEnSlash.components(separatedBy: ",")
let kUnicodeLettersEnSkyline      = kUnicodeEnSkyline.components(separatedBy: ",")
let kUnicodeLettersEnArrows       = kUnicodeEnArrows.components(separatedBy: ",")
let kUnicodeLettersEnStrike       = kUnicodeEnStrike.components(separatedBy: ",")
let kUnicodeLettersEnCircleWhite  = kUnicodeEnCircleWhite.components(separatedBy: ",")
let kUnicodeLettersEnCircleBlack  = kUnicodeEnCircleBlack.components(separatedBy: ",")
let kUnicodeLettersEnSquareWhite  = kUnicodeEnCircleBlack.components(separatedBy: ",")
let kUnicodeLettersEnSquareBlack  = kUnicodeEnSquareBlack.components(separatedBy: ",")
let kUnicodeLettersEnSquareWLight = kUnicodeEnSquareWLight.components(separatedBy: ",")
let kUnicodeLettersEnOutline      = kUnicodeEnOutline.components(separatedBy: ",")
let kUnicodeLettersEnSmallCaps    = kUnicodeEnSmallCaps.components(separatedBy: ",")
let kUnicodeLettersEnComic        = kUnicodeEnComic.components(separatedBy: ",")
let kUnicodeLettersEnSans         = kUnicodeEnSans.components(separatedBy: ",")
let kUnicodeLettersEnSansItalic   = kUnicodeEnSansItalic.components(separatedBy: ",")
let kUnicodeLettersEnStop         = kUnicodeEnStop.components(separatedBy: ",")

//let kUnicodeEN = "Q W E R T Y U I O P A S D F G H J K L : Z X C V B N M"
//let kUnicodeDicEN = ["Q":"Q","W":"W","E":"E","R":"R","T":"T","Y":"Y","U":"U","I":"I","O":"O","P":"P","A":"A","S":"S","D":"D","F":"F","G":"G","H":"H","J":"J","K":"K","L":"L",":":":","Z":"Z","X":"X","C":"C","V":"V","B":"B","N":"N","M":"M"]

/*
 decodevalue::𝕆𝕦𝕥𝕝𝕚𝕟𝕖

  Sᴍᴀʟʟ Cᴀᴘs

  ᑕOᗰIᑕ

  𝗦𝗮𝗻𝘀

  𝙎𝙖𝙣𝙨

  ⒸⒾⓇⒸⓁⒺ

  H̆̈ă̈p̆̈p̆̈y̆̈

  S̑̈ȃ̈d̑̈

  🅂🅀🅄🄰🅁🄴

  🆂🆀🆄🅰︎🆁🅴

  🇸 🇶 🇺 🇦 🇷 🇪

  S̾t̾i̾n̾k̾y̾

  B̥ͦu̥ͦb̥ͦb̥ͦl̥ͦe̥ͦs̥ͦ

  U͟n͟d͟e͟r͟l͟i͟n͟e͟

  R҉a҉y҉s҉

  B҈i҈r҈d҈s҈

  S̸l̸a̸s̸h̸

  S⃠t⃠o⃠p⃠

  S̺͆k̺͆y̺͆l̺͆i̺͆n̺͆e̺͆

  A͎r͎r͎o͎w͎s͎

  S̶t̶r̶i̶k̶e̶
 */

let kUnicodeEnNormal =
    "\u{0041}," +  //A
    "\u{0042}," +  //B
    "\u{0043}," +  //C
    "\u{0044}," +  //D
    "\u{0045}," +  //E
    "\u{0046}," +  //F
    "\u{0047}," +  //G
    "\u{0048}," +  //H
    "\u{0049}," +  //I
    "\u{004A}," +  //J
    "\u{004B}," +  //K
    "\u{004C}," +  //L
    "\u{004D}," +  //M
    "\u{004E}," +  //N
    "\u{004F}," +  //O
    "\u{0050}," +  //P
    "\u{0051}," +  //Q
    "\u{0052}," +  //R
    "\u{0053}," +  //S
    ":->:," +  //
    "\u{0054}," +  //T
    "\u{0055}," +  //U
    "\u{0056}," +  //V
    "\u{0057}," +  //W
    "\u{0058}," +  //X
    "\u{0059}," +  //Y
    "\u{005A}"     //Z

//𝑄 𝑤 𝑒 𝑟 𝑡 𝑦 𝑢 𝑖 𝑜 𝑝 𝑎 𝑠 𝑑 𝑓 𝑔 ℎ 𝑗 𝑘 𝑙 𝑧 𝑥 𝑐 𝑣 𝑏 𝑛 𝑚
let kUnicodeEnSerif = "𝑄,𝑤,𝑒,𝑟,𝑡,𝑦,𝑢,𝑖,𝑜,𝑝,𝑎,𝑠,𝑑,𝑓,𝑔,ℎ,𝑗,𝑘,𝑙,𝑧,𝑥,𝑐,𝑣,𝑏,𝑛,𝑚"
    /*"," +  //A
    "," +  //B
    "," +  //C
    "," +  //D
    "," +  //E
    "," +  //F
    "," +  //G
    "," +  //H
    "," +  //I
    "," +  //J
    "," +  //K
    "," +  //L
    "," +  //M
    "," +  //N
    "," +  //O
    "\u{0050}\u{033E}," +  //P
    "\u{0051}\u{033E}," +  //Q
    "\u{0052}\u{033E}," +  //R
    "\u{0053}\u{033E}," +  //S
    ":->:," +  //
    "\u{0054}\u{033E}," +  //T
    "\u{0055}\u{033E}," +  //U
    "\u{0056}\u{033E}," +  //V
    "\u{0057}\u{033E}," +  //W
    "\u{0058}\u{033E}," +  //X
    "\u{0059}\u{033E}," +  //Y
    "\u{005A}\u{033E}"     //Z
 */

let kUnicodeEnStinky =
    "\u{0041}\u{033E}," +  //A
    "\u{0042}\u{033E}," +  //B
    "\u{0043}\u{033E}," +  //C
    "\u{0044}\u{033E}," +  //D
    "\u{0045}\u{033E}," +  //E
    "\u{0046}\u{033E}," +  //F
    "\u{0047}\u{033E}," +  //G
    "\u{0048}\u{033E}," +  //H
    "\u{0049}\u{033E}," +  //I
    "\u{004A}\u{033E}," +  //J
    "\u{004B}\u{033E}," +  //K
    "\u{004C}\u{033E}," +  //L
    "\u{004D}\u{033E}," +  //M
    "\u{004E}\u{033E}," +  //N
    "\u{004F}\u{033E}," +  //O
    "\u{0050}\u{033E}," +  //P
    "\u{0051}\u{033E}," +  //Q
    "\u{0052}\u{033E}," +  //R
    "\u{0053}\u{033E}," +  //S
    ":->:," +  //
    "\u{0054}\u{033E}," +  //T
    "\u{0055}\u{033E}," +  //U
    "\u{0056}\u{033E}," +  //V
    "\u{0057}\u{033E}," +  //W
    "\u{0058}\u{033E}," +  //X
    "\u{0059}\u{033E}," +  //Y
    "\u{005A}\u{033E}"     //Z

let kUnicodeEnClouds =
    "\u{0041}\u{0361}\u{035C}," +  //A \u0361\u035c
    "\u{0042}\u{0361}\u{035C}," +  //B
    "\u{0043}\u{0361}\u{035C}," +  //C
    "\u{0044}\u{0361}\u{035C}," +  //D
    "\u{0045}\u{0361}\u{035C}," +  //E
    "\u{0046}\u{0361}\u{035C}," +  //F
    "\u{0047}\u{0361}\u{035C}," +  //G
    "\u{0048}\u{0361}\u{035C}," +  //H
    "\u{0049}\u{0361}\u{035C}," +  //I
    "\u{004A}\u{0361}\u{035C}," +  //J
    "\u{004B}\u{0361}\u{035C}," +  //K
    "\u{004C}\u{0361}\u{035C}," +  //L
    "\u{004D}\u{0361}\u{035C}," +  //M
    "\u{004E}\u{0361}\u{035C}," +  //N
    "\u{004F}\u{0361}\u{035C}," +  //O
    "\u{0050}\u{0361}\u{035C}," +  //P
    "\u{0051}\u{0361}\u{035C}," +  //Q
    "\u{0052}\u{0361}\u{035C}," +  //R
    "\u{0053}\u{0361}\u{035C}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035C}," +  //T
    "\u{0055}\u{0361}\u{035C}," +  //U
    "\u{0056}\u{0361}\u{035C}," +  //V
    "\u{0057}\u{0361}\u{035C}," +  //W
    "\u{0058}\u{0361}\u{035C}," +  //X
    "\u{0059}\u{0361}\u{035C}," +  //Y
    "\u{005A}\u{0361}\u{035C}"     //Z

let kUnicodeEnHappy =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z



let kUnicodeEnSad =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z



let kUnicodeEnBubbles =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnUnderline =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z



let kUnicodeEnRays =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z



let kUnicodeEnBirds =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnSlash =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnSkyline =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnArrows =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnStrike =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnCircleWhite =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnCircleBlack =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z

let kUnicodeEnSquareWhite =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z


let kUnicodeEnSquareBlack =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z



let kUnicodeEnSquareWLight =
    "\u{0041}\u{0302}," +  //A
    "\u{0042}\u{0303}," +  //B
    "\u{0043}\u{0304}," +  //C
    "\u{0044}\u{0305}," +  //D
    "\u{0045}\u{0306}," +  //E
    "\u{0046}\u{0307}," +  //F
    "\u{0047}\u{0302}," +  //G
    "\u{0048}\u{0309}," +  //H
    "\u{0049}\u{030A}," +  //I
    "\u{004A}\u{030B}," +  //J
    "\u{004B}\u{030C}," +  //K
    "\u{004C}\u{030D}," +  //L
    "\u{004D}\u{030E}," +  //M
    "\u{004E}\u{033e}," +  //N
    "\u{004F}\u{033e}," +  //O
    "\u{0050}\u{033e}," +  //P
    "\u{0051}\u{033e}," +  //Q
    "\u{0052}\u{033e}," +  //R
    "\u{0053}\u{033e}," +  //S
    ":->:," +  //
    "\u{0054}\u{0361}\u{035c}," +  //T
    "\u{0055}\u{0361}\u{035c}," +  //U
    "\u{0056}\u{0361}\u{035c}," +  //V
    "\u{0057}\u{0361}\u{035c}," +  //W
    "\u{0058}\u{0361}\u{035c}," +  //X
    "\u{0059}\u{0361}\u{035c}," +  //Y
    "\u{005A}\u{0361}\u{035c}"     //Z

//\ud835\udd46\ud835\udd66\ud835\udd65\ud835\udd5d\ud835\udd5a\ud835\udd5f\ud835\udd56
//𝕢𝕨𝕖𝕣𝕥𝕪𝕦𝕚𝕠𝕡𝕒𝕤𝕕𝕗𝕘𝕙𝕛𝕜𝕝𝕫𝕩𝕔𝕧𝕓𝕟𝕞
let kUnicodeEnOutline =
    "𝕢," +  //A 𝕆𝕦𝕥𝕝𝕚𝕟𝕖
    "𝕨," +  //B
    "𝕖," +  //C
    "𝕣," +  //D
    "𝕥," +  //E
    "𝕪," +  //F
    "𝕦," +  //G
    "𝕚," +  //H
    "𝕠," +  //I
    "𝕡," +  //J
    "𝕒," +  //K
    "𝕤," +  //L
    "𝕕," +  //M
    "𝕗," +  //N
    "𝕘," +  //O
    "𝕙," +  //P
    "𝕛," +  //Q
    "𝕜," +  //R
    "𝕝," +  //S
    ":->:," +  //
    "𝕫," +  //T
    "𝕩," +  //U
    "𝕔," +  //V
    "𝕧," +  //W
    "𝕓," +  //X
    "𝕟," +  //Y
    "𝕞"     //Z

let kUnicodeEnSmallCaps  = "Q,ᴡ,ᴇ,ʀ,ᴛ,ʏ,ᴜ,ɪ,ᴏ,ᴘ,ᴀ,s,ᴅ,ғ,ɢ,ʜ,ᴊ,ᴋ,ʟ,ᴢ,x,ᴄ,ᴠ,ʙ,ɴ,ᴍ"
let kUnicodeEnComic      = "ᑫ,ᗯ,ᗴ,ᖇ,T,Y,ᑌ,I,O,ᑭ,ᗩ,ᔕ,ᗪ,ᖴ,ᘜ,ᕼ,ᒍ,K,ᒪ,ᘔ,᙭,ᑕ,ᐯ,ᗷ,ᑎ,ᗰ"
let kUnicodeEnSans       = "𝗤,𝘄,𝗲,𝗿,𝘁,𝘆,𝘂,𝗶,𝗼,𝗽,𝗮,𝘀,𝗱,𝗳,𝗴,𝗵,𝗷,𝗸,𝗹,𝘇,𝘅,𝗰,𝘃,𝗯,𝗻,𝗺" //𝗤𝘄𝗲𝗿𝘁𝘆𝘂𝗶𝗼𝗽𝗮𝘀𝗱𝗳𝗴𝗵𝗷𝗸𝗹𝘇𝘅𝗰𝘃𝗯𝗻𝗺
let kUnicodeEnSansItalic = "𝙦,𝙬,𝙚,𝙧,𝙩,𝙮,𝙪,𝙞,𝙤,𝙥,𝙖,𝙨,𝙙,𝙛,𝙜,𝙝,𝙟,𝙠,𝙡,𝙯,𝙭,𝙘,𝙫,𝙗,𝙣,𝙢" //𝙦𝙬𝙚𝙧𝙩𝙮𝙪𝙞𝙤𝙥𝙖𝙨𝙙𝙛𝙜𝙝𝙟𝙠𝙡𝙯𝙭𝙘𝙫𝙗𝙣𝙢
let kUnicodeEnStop       = "q⃠,w⃠,e⃠,r⃠,t⃠,y⃠,u⃠,i⃠,o⃠,p⃠,a⃠,s⃠,d⃠,f⃠,g⃠,h⃠,j⃠,k⃠,l⃠,z⃠,x⃠,c⃠,v⃠,b⃠,n⃠,m⃠"  //q⃠w⃠e⃠r⃠t⃠y⃠u⃠i⃠o⃠p⃠a⃠s⃠d⃠f⃠g⃠h⃠j⃠k⃠l⃠z⃠x⃠c⃠v⃠b⃠n⃠m⃠




//Normal Stinky Clouds Happy Sad Bubbles Underline Rays Birds Slash Skyline Arrows Strike CircleWhite CircleBlack SquareWhite SquareBlack SquareWhiteLight Outline
