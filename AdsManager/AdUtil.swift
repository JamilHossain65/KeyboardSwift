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
