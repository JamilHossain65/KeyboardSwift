//
//  KeyInfo.swift
//  KeyboardExtension
//
//  Created by Jamil on 21/12/21.
//

import UIKit
struct KeyboardInfo: Codable {
    var bgColor  : String
    var txtColor : String
    var fontDic  : [String:String]
}

class KeyInfo: NSObject {

    override init() {
        super.init()
    }
    
    func setKeyInfo(langKey:String, fontValue:String) {
        let _langKey = langKey.trimmingCharacters(in: .whitespaces)
        let _fontValue = fontValue.trimmingCharacters(in: .whitespaces)
        
        
        var info = getKeyInfo()
        info?.fontDic[_langKey] = _fontValue
        let fontDic = info?.fontDic ?? [:]
        
        let keyboardInfo = KeyboardInfo(bgColor: "", txtColor: "", fontDic: fontDic)
        do {
            let infoData = try JSONEncoder().encode(keyboardInfo)
            setData(infoData, key: USER_INFO_KEY)
            
            let info = getKeyInfo()
            print("info::\(info)")
        } catch {
            print(error.localizedDescription)
        }
    }

    func getKeyInfo() -> KeyboardInfo? {
        do {
            guard let data = getData(USER_INFO_KEY) as? Data else {return nil}
            let keyboardInfo = try JSONDecoder().decode(KeyboardInfo.self, from: data)
            return keyboardInfo
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

}

