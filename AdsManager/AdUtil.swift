//
//  Event.swift
//  Event
//
//  Created by Jamil on 2/3/21.
//

import UIKit
import Foundation
import MBProgressHUD

//let SUITE_KEY = "group.com.vaticsoft.SmartKeyboard"   

 let SCREEN_WIDTH   = UIScreen.main.bounds.size.width
 let SCREEN_HEIGHT  = UIScreen.main.bounds.size.height

 let kContentShared = "Content Shared"
 let kTargetType    = "TargetType"
 let kTargetIMA     = "iMessage"
 let kTargetCA      = "Container"
 let kTargetKE      = "Keyboard"

 let kEventLaunch = "Launch"

 let kADS     = "kADS"
 let kECPM    = "kECPM"
 let kVALUE   = "kVALUE"
 let kPERCENT = "kPERCENT"
 let kREVENUE = "kREVENUE"
 let kECPM_DATE = "kECPM_DATE"

 let kADMOBE_AD   = "RatioMobi"
 let kAPPODEAL_AD = "RatioDeal"
 let kFACEBOOK_AD = "RatioAudi"

 let kADMOBE_AD_KEY   = "KeyMobi"
 let kAPPODEAL_AD_KEY = "KeyDeal"
 let kFACEBOOK_AD_KEY = "KeyAudi"

 let kAD_NAME_ARRAY_KEY = "kAD_NAME_ARRAY_KEY"

 let kUSER_ID       = "kUSER_ID"
 let kUSER_PASSWORD = "kUSER_PASSWORD"

 let kREGISTERED_USER_KEY       = "REGISTERED_USER_KEY"
 let kIS_OFFER                  = "kIS_OFFER"
 let kOFFER_START_TIME_INTERVAL = "kOFFER_START_TIME_INTERVAL"
 let kOFFER_END_TIME_INTERVAL   = "kOFFER_END_TIME_INTERVAL"
 let kCHEEKING_TIME_INTERVAL    = "kCHEEKING_TIME_INTERVAL"
 let kOFFER_MESSAGE_AD          = "kOFFER_MESSAGE_AD"
 let kOFFER_MESSAGE_POINT       = "kOFFER_MESSAGE_POINT"
 let kWITHDRAW_MESSAGE          = "kWITHDRAW_MESSAGE"

//ecpm
 let kCOUNTRY_CODE_BD = "bd"
 let kCOUNTRY_CODE_IN = "in"
 let kCOUNTRY_CODE_US = "us"
 let kCOUNTRY_CODE_RANK1 = "rank1"
 let kCOUNTRY_CODE_RANK2 = "rank2"
 let kCOUNTRY_CODE_RANK3 = "rank3"
 let kCOUNTRY_CODE       = "kCOUNTRY_CODE"

//#define SUITE_NAME @"group.com.vaticsoft.BurmeseKeyboard"
//let  AD_MIN_TIME = 10*60; //10 min

var langName: String {
    get {
        let actLanguages = activeLanguages.filter({$0.1}).map({$0.0}).sorted(by:>)
        let langName:String = actLanguages.filter({$0 != English}).first!
        log("langName:\(langName)")
        return langName
    }
}


//interstitial
//ca-app-pub-6852753831370662/6954560826
//Native
//ca-app-pub-6852753831370662/4570291273
//Open app
//ca-app-pub-6852753831370662/2187670512

//GER
//INTER
//ca-app-pub-7802882478784013/3804598385
//
//OPEN
//ca-app-pub-7802882478784013/7364569441
//NATIVE
//ca-app-pub-7802882478784013/3425324436

//Interstitial
//ca-app-pub-4020516547273393/2176452563
//Admob id
//ca-app-pub-4020516547273393~7293897930
//App open
//
//ca-app-pub-4020516547273393/9273996345


//app setting::106
public var admobAdKey: String {
    get {
        //let langName = getString(SelectedLanguage)
        switch langName {
        case Bangla:
            return ""
        case BanglaGoti:
            return "ca-app-pub-6852753831370662/6954560826"
        case BanglaDruti:
            return "ca-app-pub-4020516547273393/2176452563"
        case Thai:
            return "ca-app-pub-6852753831370662/2157832232"
        case Gujarati:
            return ""
        case Hindi:
            return "ca-app-pub-9133033983333483/9354257012"
        case Kannada:
            return ""
        case Malayalam:
            return ""
        case Marathi:
            return ""
        case Nepali:
            return ""
        case Oriya:
            return ""
        case Punjabi:
            return ""
        case Sanskrit:
            return ""
        case Tamil:
            return ""
        case Telugu:
            return ""
        case Urdu:
            return ""
        case Indonesian:
            return ""
        case Russian:
            return "ca-app-pub-8007562169424853/2159987459"
        case Spanish:
            return "ca-app-pub-8007562169424853/2425812770"
        case French:
            return ""
        case German:
            return "ca-app-pub-7802882478784013/3804598385"
        case Italian:
            return ""
        case Korean:
            return ""
        case Turkish:
            return "ca-app-pub-6852753831370662/6311791933"
        case Portuguese:
            return ""
        case Burmese:
            return "ca-app-pub-7802882478784013/4571622860"
            
        case JpHiragana:
            return "ca-app-pub-9133033983333483/4102060257"
        case JpKatakana:
            return "ca-app-pub-9133033983333483/4102060257"
        case SmartFonts:
            return "ca-app-pub-9133033983333483/2540966764"
        default://English
            return ""
        }
    }
}

//app setting::6.2
var nativeAdKey: String {
    get {
        //let langName = getString(SelectedLanguage)
        switch langName {
        case Bangla:
            return ""
        case BanglaGoti:
            return "ca-app-pub-6852753831370662/4570291273"
        case BanglaDruti:
            return ""
        case Thai:
            return "ca-app-pub-6852753831370662/2572374392"
        case Gujarati:
            return ""
        case Hindi:
            return ""
        case Kannada:
            return ""
        case Malayalam:
            return ""
        case Marathi:
            return ""
        case Nepali:
            return ""
        case Oriya:
            return ""
        case Punjabi:
            return ""
        case Sanskrit:
            return ""
        case Tamil:
            return ""
        case Telugu:
            return ""
        case Urdu:
            return ""
        case Indonesian:
            return ""
        case Russian:
            return "ca-app-pub-8007562169424853/1545592552"
        case Spanish:
            return "ca-app-pub-8007562169424853/1892915215"
        case French:
            return ""
        case German:
            return "ca-app-pub-7802882478784013/3425324436"
        case Italian:
            return ""
        case Korean:
            return ""
        case Turkish:
            return "ca-app-pub-6852753831370662/4938480996"
        case Portuguese:
            return ""
        case Burmese:
            return "ca-app-pub-7802882478784013/9382565996"
        case JpHiragana:
            return "ca-app-pub-9133033983333483/4431969135"
        case JpKatakana:
            return "ca-app-pub-9133033983333483/4431969135"
        case SmartFonts:
            return ""
        default://English
            return "" //MARK: - todo
        }
    }
}

    //app setting::6.1
    var appOpenAdKey: String {
        get {
            //let langName = getString(SelectedLanguage)
            switch langName {
            case Bangla:
                return ""
            case BanglaGoti:
                return "ca-app-pub-6852753831370662/2187670512"
            case BanglaDruti:
                return "ca-app-pub-4020516547273393/9273996345"
            case Thai:
                return "ca-app-pub-6852753831370662/1048268689"
            case Gujarati:
                return ""
            case Hindi:
                return ""
            case Kannada:
                return ""
            case Malayalam:
                return ""
            case Marathi:
                return ""
            case Nepali:
                return ""
            case Oriya:
                return ""
            case Punjabi:
                return ""
            case Sanskrit:
                return ""
            case Tamil:
                return ""
            case Telugu:
                return ""
            case Urdu:
                return ""
            case Indonesian:
                return ""
            case Russian:
                return "ca-app-pub-8007562169424853/5366804520"
            case Spanish:
                return "ca-app-pub-8007562169424853/6626367145"
            case French:
                return ""
            case German:
                return "ca-app-pub-7802882478784013/7364569441"
            case Italian:
                return ""
            case Korean:
                return ""
            case Turkish:
                return "ca-app-pub-6852753831370662/8445859049"
            case Portuguese:
                return ""
            case Burmese:
                return "ca-app-pub-7802882478784013/3431237527"

            case JpHiragana:
                return "ca-app-pub-9133033983333483/3016769511"
            case JpKatakana:
                return "ca-app-pub-9133033983333483/3016769511"
            case SmartFonts:
                return ""
            default://English
                return "" //MARK: - todo
            }
        }
    }

//app setting:: 10
var admobAdRewardedKey: String {
    get {
        //let langName = getString(SelectedLanguage)
        switch langName {
        case Bangla:
            return ""
        case BanglaGoti:
            return "ca-app-pub-9133033983333483/6496283136"
        case BanglaDruti:
            return "ca-app-pub-9133033983333483/4963605614"
        case Thai:
            return "ca-app-pub-9133033983333483/4717195930"
        case Gujarati:
            return ""
        case Hindi:
            return ""
        case Kannada:
            return ""
        case Malayalam:
            return ""
        case Marathi:
            return ""
        case Nepali:
            return ""
        case Oriya:
            return ""
        case Punjabi:
            return ""
        case Sanskrit:
            return ""
        case Tamil:
            return ""
        case Telugu:
            return ""
        case Urdu:
            return ""
        case Indonesian:
            return ""
        case Russian:
            return "ca-app-pub-9133033983333483/6659982938"
        case Spanish:
            return ""
        case French:
            return ""
        case German:
            return ""
        case Italian:
            return ""
        case Korean:
            return ""
        case Turkish:
            return ""
        case Portuguese:
            return ""
        case Burmese:
            return ""
        case JpHiragana:
            return "ca-app-pub-9133033983333483/5534603529"
        case JpKatakana:
            return "ca-app-pub-9133033983333483/5534603529"
        case SmartFonts:
            return ""
        default://English
            return ""
        }
    }
}

//app setting::111
var admobAdRewardedInterstitialKey: String {
    get {
        //let langName = getString(SelectedLanguage)
        switch langName {
        case Bangla:
            return ""
        case BanglaGoti:
            return "ca-app-pub-9133033983333483/8744413734"
        case BanglaDruti:
            return ""
        case Thai:
            return ""
        case Gujarati:
            return ""
        case Hindi:
            return "ca-app-pub-9133033983333483/9354257012"
        case Kannada:
            return ""
        case Malayalam:
            return ""
        case Marathi:
            return ""
        case Nepali:
            return ""
        case Oriya:
            return ""
        case Punjabi:
            return ""
        case Sanskrit:
            return ""
        case Tamil:
            return ""
        case Telugu:
            return ""
        case Urdu:
            return ""
        case Indonesian:
            return ""
        case Russian:
            return "ca-app-pub-9133033983333483/4509503298"
        case Spanish:
            return "ca-app-pub-9133033983333483/1779398175"
        case French:
            return ""
        case German:
            return ""
        case Italian:
            return ""
        case Korean:
            return ""
        case Turkish:
            return ""
        case Portuguese:
            return ""
        case Burmese:
            return ""
        case JpHiragana:
            return ""
        case JpKatakana:
            return ""
        case SmartFonts:
            return "ca-app-pub-9133033983333483/9218904491"
        default://English
            return ""
        }
    }
}
