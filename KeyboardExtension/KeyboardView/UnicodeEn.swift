//
//  UnicodeEn.swift
//  KeyboardExtension
//
//  Created by Jamil on 9/5/21.
//

import UIKit

//class UnicodeEn: NSObject { }

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
                         kUnicodeLettersEnHappy,
                         kUnicodeLettersEnSad,
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
                         kUnicodeLettersEnClouds,]

let kUnicodeFontNameArray = ["Normal",
                             "𝕆𝕦𝕥𝕝𝕚𝕟𝕖",
                             "Sᴍᴀʟʟ Cᴀᴘs",
                             "ᑕOᗰIᑕ",
                             "𝗦𝗮𝗻𝘀",
                             "𝙎𝙖𝙣𝙨",
                             "ⒸⒾⓇⒸⓁⒺ",
                             "🅂🅀🅄🄰🅁🄴",
                             "🆂🆀🆄🅰︎🆁🅴",
                             "🇸 🇶 🇺 🇦 🇷 🇪",
                             "H̆̈ă̈p̆̈p̆̈y̆̈",
                             "S̑̈ȃ̈d̑̈",
                             "S̾t̾i̾n̾k̾y̾",
                             "B̥ͦu̥ͦb̥ͦb̥ͦl̥ͦe̥ͦs̥ͦ",
                             "U͟n͟d͟e͟r͟l͟i͟n͟e͟",
                             "R҉a҉y҉s҉",
                             "B҈i҈r҈d҈s҈",
                             "S̸l̸a̸s̸h̸",
                             "S⃠t⃠o⃠p⃠",
                             "S̺͆k̺͆y̺͆l̺͆i̺͆n̺͆e̺͆",
                             "A͎r͎r͎o͎w͎s͎",
                             "S̶t̶r̶i̶k̶e̶",
                             "c͜͡l͜͡o͜͡u͜͡d͜͡s͜͡",]

let kUnicodeLettersEnNumList      = kUnicodeEnNumbers.components(separatedBy: ",")
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
let kUnicodeLettersEnSquareWhite  = kUnicodeEnSquareWhite.components(separatedBy: ",")
let kUnicodeLettersEnSquareBlack  = kUnicodeEnSquareBlack.components(separatedBy: ",")
let kUnicodeLettersEnSquareWLight = kUnicodeEnSquareWLight.components(separatedBy: ",")
let kUnicodeLettersEnOutline      = kUnicodeEnOutline.components(separatedBy: ",")
let kUnicodeLettersEnSmallCaps    = kUnicodeEnSmallCaps.components(separatedBy: ",")
let kUnicodeLettersEnComic        = kUnicodeEnComic.components(separatedBy: ",")
let kUnicodeLettersEnSans         = kUnicodeEnSans.components(separatedBy: ",")
let kUnicodeLettersEnSansItalic   = kUnicodeEnSansItalic.components(separatedBy: ",")
let kUnicodeLettersEnStop         = kUnicodeEnStop.components(separatedBy: ",")

let kUnicodeEnNumbers = "1,2,3,4,4,5,6,7,8,9,0,-,/,:,;,(,),$,&,@,\",.,,,?,!,'"
let kUnicodeEnNormal  = "Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,:,Z,X,C,V,B,N,M"
let kUnicodeEnSerif   = "𝑄,𝑤,𝑒,𝑟,𝑡,𝑦,𝑢,𝑖,𝑜,𝑝,𝑎,𝑠,𝑑,𝑓,𝑔,ℎ,𝑗,𝑘,𝑙,:,𝑧,𝑥,𝑐,𝑣,𝑏,𝑛,𝑚"
let kUnicodeEnStinky  = "q̾,w̾,e̾,r̾,t̾,y̾,u̾,i̾,o̾,p̾,a̾,s̾,d̾,f̾,g̾,h̾,j̾,k̾,l̾,:,z̾,x̾,c̾,v̾,b̾,n̾,m̾"
let kUnicodeEnClouds  = "q͜͡,w͜͡,e͜͡,r͜͡,t͜͡,y͜͡,u͜͡,i͜͡,o͜͡,p͜͡,a͜͡,s͜͡,d͜͡,f͜͡,g͜͡,h͜͡,j͜͡,k͜͡,l͜͡,:,z͜͡,x͜͡,c͜͡,v͜͡,b͜͡,n͜͡,m͜͡"
let kUnicodeEnHappy   = "q̆̈,w̆̈,ĕ̈,r̆̈,t̆̈,y̆̈,ŭ̈,ĭ̈,ŏ̈,p̆̈,ă̈,s̆̈,d̆̈,f̆̈,ğ̈,h̆̈,j̆̈,k̆̈,l̆̈,:,z̆̈,x̆̈,c̆̈,v̆̈,b̆̈,n̆̈,m̆̈"
let kUnicodeEnSad     = "q̑̈,w̑̈,ȇ̈,ȓ̈,t̑̈,y̑̈,ȗ̈,ȋ̈,ȏ̈,p̑̈,ȃ̈,s̑̈,d̑̈,f̑̈,g̑̈,h̑̈,j̑̈,k̑̈,l̑̈,:,z̑̈,x̑̈,c̑̈,v̑̈,b̑̈,n̑̈,m̑̈"
let kUnicodeEnBubbles = "q̥ͦ,w̥ͦ,e̥ͦ,r̥ͦ,t̥ͦ,y̥ͦ,u̥ͦ,i̥ͦ,o̥ͦ,p̥ͦ,ḁͦ,s̥ͦ,d̥ͦ,f̥ͦ,g̥ͦ,h̥ͦ,j̥ͦ,k̥ͦ,l̥ͦ,:,z̥ͦ,x̥ͦ,c̥ͦ,v̥ͦ,b̥ͦ,n̥ͦ,m̥ͦ"
let kUnicodeEnRays    = "q҉,w҉,e҉,r҉,t҉,y҉,u҉,i҉,o҉,p҉,a҉,s҉,d҉,f҉,g҉,h҉,j҉,k҉,l҉,:,z҉,x҉,c҉,v҉,b҉,n҉,m҉"
let kUnicodeEnBirds   = "q҈,w҈,e҈,r҈,t҈,y҈,u҈,i҈,o҈,p҈,a҈,s҈,d҈,f҈,g҈,h҈,j҈,k҈,l҈,:,z҈,x҈,c҈,v҈,b҈,n҈,m҈"
let kUnicodeEnSlash   = "q̸,w̸,e̸,r̸,t̸,y̸,u̸,i̸,o̸,p̸,a̸,s̸,d̸,f̸,g̸,h̸,j̸,k̸,l̸,:,z̸,x̸,c̸,v̸,b̸,n̸,m̸"
let kUnicodeEnSkyline = "q̺͆,w̺͆,e̺͆,r̺͆,t̺͆,y̺͆,u̺͆,i̺͆,o̺͆,p̺͆,a̺͆,z̺͆,d̺͆,f̺͆,g̺͆,h̺͆,j̺͆,k̺͆,l̺͆,:,z̺͆,x̺͆,c̺͆,v̺͆,b̺͆,n̺͆,m̺͆"
let kUnicodeEnArrows  = "q͎,w͎,e͎,r͎,t͎,y͎,u͎,i͎,o͎,p͎,a͎,s͎,d͎,f͎,g͎,h͎,j͎,k͎,l͎,:,z͎,x͎,c͎,v͎,b͎,n͎,m͎"
let kUnicodeEnStrike  = "q̶,w̶,e̶,r̶,t̶,y̶,u̶,i̶,o̶,p̶,a̶,s̶,d̶,f̶,g̶,h̶,j̶,k̶,l̶,:,z̶,x̶,c̶,v̶,b̶,n̶,m̶"
let kUnicodeEnRunes   = "ዒ,ሠ,ቿ,ዪ,ፕ,ሃ,ሁ,ጎ,ዐ,የ,ል,ነ,ዕ,ቻ,ኗ,ዘ,ጋ,ጕ,ረ,:,ጊ,ሸ,ር,ሀ,ጌ,ክ,ጠ"
let kUnicodeEnCircleWhite  = "Ⓠ,Ⓦ,Ⓔ,Ⓡ,Ⓣ,Ⓨ,Ⓤ,Ⓘ,Ⓞ,Ⓟ,Ⓐ,Ⓢ,Ⓓ,Ⓕ,Ⓖ,Ⓗ,Ⓙ,Ⓚ,Ⓛ,:,Ⓩ,Ⓧ,Ⓒ,Ⓥ,Ⓑ,Ⓝ,Ⓜ︎"
let kUnicodeEnSquareWhite  = "🅀,🅆,🄴,🅁,🅃,🅈,🅄,🄸,🄾,🄿,🄰,🅂,🄳,🄵,🄶,🄷,🄹,🄺,🄻,:,🅉,🅇,🄲,🅅,🄱,🄽,🄼"
let kUnicodeEnSquareBlack  = "🆀,🆆,🅴,🆁,🆃,🆈,🆄,🅸,🅾︎,🅿︎,🅰︎,🆂,🅳,🅵,🅶,🅷,🅹,🅺,🅻,:,🆉,🆇,🅲,🆅,🅱︎,🅽,🅼"
let kUnicodeEnSquareWLight = "🇶 ,🇼 ,🇪 ,🇷 ,🇹 ,🇾 ,🇺 ,🇮 ,🇴 ,🇵 ,🇦 ,🇸 ,🇩 ,🇫 ,🇬 ,🇭 ,🇯 ,🇰 ,🇱 ,:,🇿 ,🇽 ,🇨 ,🇻 ,🇧 ,🇳 ,🇲 "
let kUnicodeEnUnderline    = " ͟q,w͟,e͟,r͟,t͟,y,u͟,i͟,o͟,p,a͟,s͟,d͟,f͟,g,h͟,j,k͟,l͟,:,z͟,x͟,c͟,v͟,b͟,n͟,m͟"
let kUnicodeEnOutline      = "𝕢,𝕨,𝕖,𝕣,𝕥,𝕪,𝕦,𝕚,𝕠,𝕡,𝕒,𝕤,𝕕,𝕗,𝕘,𝕙,𝕛,𝕜,𝕝,:,𝕫,𝕩,𝕔,𝕧,𝕓,𝕟,𝕞"
let kUnicodeEnSmallCaps    = "Q,ᴡ,ᴇ,ʀ,ᴛ,ʏ,ᴜ,ɪ,ᴏ,ᴘ,ᴀ,s,ᴅ,ғ,ɢ,ʜ,ᴊ,ᴋ,ʟ,:,ᴢ,x,ᴄ,ᴠ,ʙ,ɴ,ᴍ"
let kUnicodeEnComic        = "ᑫ,ᗯ,ᗴ,ᖇ,T,Y,ᑌ,I,O,ᑭ,ᗩ,ᔕ,ᗪ,ᖴ,ᘜ,ᕼ,ᒍ,K,ᒪ,:,ᘔ,᙭,ᑕ,ᐯ,ᗷ,ᑎ,ᗰ"
let kUnicodeEnSans         = "𝗤,𝘄,𝗲,𝗿,𝘁,𝘆,𝘂,𝗶,𝗼,𝗽,𝗮,𝘀,𝗱,𝗳,𝗴,𝗵,𝗷,𝗸,𝗹,:,𝘇,𝘅,𝗰,𝘃,𝗯,𝗻,𝗺" //𝗤𝘄𝗲𝗿𝘁𝘆𝘂𝗶𝗼𝗽𝗮𝘀𝗱𝗳𝗴𝗵𝗷𝗸𝗹𝘇𝘅𝗰𝘃𝗯𝗻𝗺
let kUnicodeEnSansItalic   = "𝙦,𝙬,𝙚,𝙧,𝙩,𝙮,𝙪,𝙞,𝙤,𝙥,𝙖,𝙨,𝙙,𝙛,𝙜,𝙝,𝙟,𝙠,𝙡,:,𝙯,𝙭,𝙘,𝙫,𝙗,𝙣,𝙢" //𝙦𝙬𝙚𝙧𝙩𝙮𝙪𝙞𝙤𝙥𝙖𝙨𝙙𝙛𝙜𝙝𝙟𝙠𝙡𝙯𝙭𝙘𝙫𝙗𝙣𝙢
let kUnicodeEnStop         = "q⃠,w⃠,e⃠,r⃠,t⃠,y⃠,u⃠,i⃠,o⃠,p⃠,a⃠,s⃠,d⃠,f⃠,g⃠,h⃠,j⃠,k⃠,l⃠,:,®z⃠,x⃠,c⃠,v⃠,b⃠,n⃠,m⃠"  //q⃠w⃠e⃠r⃠t⃠y⃠u⃠i⃠o⃠p⃠a⃠s⃠d⃠f⃠g⃠h⃠j⃠k⃠l⃠z⃠x⃠c⃠v⃠b⃠n⃠m⃠

//Normal Stinky Clouds Happy Sad Bubbles Underline Rays Birds Slash Skyline Arrows Strike CircleWhite CircleBlack SquareWhite SquareBlack SquareWhiteLight Outline
