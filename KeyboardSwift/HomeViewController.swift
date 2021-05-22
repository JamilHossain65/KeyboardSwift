//
//  HomeViewController.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderWidth  = 1.0
        textView.layer.cornerRadius = 8.0
        textView.layer.borderColor  = UIColor.gray.cgColor
        
        textView.becomeFirstResponder()
        
        let str : String = "𝕆𝕦𝕥𝕝𝕚𝕟𝕖\n\n Sᴍᴀʟʟ Cᴀᴘs\n\n ᑕOᗰIᑕ\n\n 𝗦𝗮𝗻𝘀\n\n 𝙎𝙖𝙣𝙨\n\n ⒸⒾⓇⒸⓁⒺ\n\n H̆̈ă̈p̆̈p̆̈y̆̈\n\n S̑̈ȃ̈d̑̈\n\n 🅂🅀🅄🄰🅁🄴\n\n 🆂🆀🆄🅰︎🆁🅴 \n\n 🇸 🇶 🇺 🇦 🇷 🇪 \n\n S̾t̾i̾n̾k̾y̾ \n\n B̥ͦu̥ͦb̥ͦb̥ͦl̥ͦe̥ͦs̥ͦ \n\n U͟n͟d͟e͟r͟l͟i͟n͟e͟ \n\n R҉a҉y҉s҉ \n\n B҈i҈r҈d҈s҈ \n\n S̸l̸a̸s̸h̸ \n\n S⃠t⃠o⃠p⃠ \n\n S̺͆k̺͆y̺͆l̺͆i̺͆n̺͆e̺͆ \n\n A͎r͎r͎o͎w͎s͎ \n\n S̶t̶r̶i̶k̶e̶ \n\n"
        
        /*
        𝕆𝕦𝕥𝕝𝕚𝕟𝕖
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

        //String to Unicode
        var dataenc = str.data(using: String.Encoding.nonLossyASCII)
        var encodevalue = String(data: dataenc!, encoding: String.Encoding.utf8)
        
        
        //Unicode to String
        var datadec  = encodevalue?.data(using: String.Encoding.utf8)
        var decodevalue = String(data: datadec!, encoding: String.Encoding.nonLossyASCII)
        
        print("encodevalue::\(encodevalue!)")
        print("decodevalue::\(decodevalue!)")
        
    }
}

