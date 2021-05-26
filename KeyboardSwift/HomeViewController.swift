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
        
        textView.text =
            "𝕥𝕙𝕖𝕣𝕖 𝕒𝕣𝕖 𝕞𝕒𝕟𝕪 𝕗𝕠𝕟𝕥𝕤 𝕚 𝕔𝕒𝕟 𝕦𝕤𝕖\n\n" +
            //"ᴛʜᴇʀᴇ ᴀʀᴇ ᴍᴀɴʏ ғᴏɴᴛs ɪ ᴄᴀɴ ᴜsᴇ\n" +
            "tᕼᗴᖇᗴ ᗩᖇᗴ ᗰᗩᑎy ᖴoᑎyᔕ i ᑕᗩᑎ ᑌᔕᗴ\n\n" +
            "ⓣⓗⓔⓡⓔ ⓐⓡⓔ ⓜ︎ⓐⓝⓨ ⓕⓞⓝⓣⓢ ⓘ ⓒⓐⓝ ⓤⓢⓔ\n"  +
            //"t̆̈h̆̈ĕ̈r̆̈ĕ̈ ă̈r̆̈ĕ̈ m̆̈ă̈n̆̈y̆̈ f̆̈ŏ̈n̆̈t̆̈s̆̈ ĭ̈ c̆̈ă̈n̆̈ ŭ̈s̆̈ĕ̈\n" +
            "t̾h̾e̾r̾e̾ a̾r̾e̾ m̾a̾n̾y̾ f̾o̾n̾t̾s̾ i̾ c̾a̾n̾ u̾s̾e̾\n" +
            "t̥ͦh̥ͦe̥ͦr̥ͦe̥ͦ ḁͦr̥ͦe̥ͦ m̥ͦḁͦn̥ͦy̥ͦ f̥ͦo̥ͦn̥ͦt̥ͦs̥ͦ i̥ͦ c̥ͦḁͦn̥ͦ u̥ͦs̥ͦe̥ͦ\n\n" +
            //"t͟h͟e͟r͟e͟ a͟r͟e͟  m͟a͟n͟y f͟o͟n͟t͟s͟ i͟ c͟a͟n͟ u͟s͟e͟\n" +
            "t҉h҉e҉r҉e҉ a҉r҉e҉ m҉a҉n҉y҉ f҉o҉n҉t҉s҉ i҉ c҉a҉n҉ u҉s҉e҉\n"  +
            "t̸h̸e̸r̸e̸ a̸r̸e̸ m̸a̸n̸y̸ f̸o̸n̸t̸s̸ i̸ c̸n̸ u̸s̸e̸\n"
        
        textView.text = ""
        
        textView.layer.borderWidth  = 1.0
        textView.layer.cornerRadius = 8.0
        textView.layer.borderColor  = UIColor.lightGray.cgColor
        
        textView.becomeFirstResponder()
    }
}

