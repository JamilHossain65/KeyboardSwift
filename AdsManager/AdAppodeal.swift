//
//  AdAppodeal.swift
//  KeyboardSwift
//
//  Created by Jamil on 17/3/22.
//

import UIKit
import Appodeal

//app setting:16
private struct AppodealConstants {
    static let key: String = "d161af6881a9948f32d1cf869155ea98703870c82108bdd2"
    static let adTypes: AppodealAdType = [.rewardedVideo]
    static let logLevel: APDLogLevel = .debug
    static let testMode: Bool = false
}

class AdAppodeal: UIViewController,AppodealNonSkippableVideoDelegate, AppodealRewardedVideoDelegate {
    public static let shared = AdAppodeal()
    typealias AdAppodealCompletion = (_ success:Bool) -> Void
    //var void (^adFailWithCompletion)(BOOL success);
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.frame = CGRect.zero
        
        //sample code
        //https://github.com/appodeal/appodeal-ios-demo
    }
    
    @objc func showNonSkippableAppodeal(_ controller:UIViewController){
        //perform(#selector(showNonSkippableAppodeal), with: nil, afterDelay: 60)
        
        let placement = "default"
        if Appodeal.canShow(.rewardedVideo, forPlacement: placement){
            log("rewardedVideo can show")
            Appodeal.showAd(.rewardedVideo, forPlacement: placement, rootViewController: controller)
        }else{
            log("rearded video not ready")
//            let canShow = Appodeal.canShow(.rewardedVideo, forPlacement: placement)
//            log("rewardedVideo ready:\(canShow)")
//            Appodeal.showAd(.rewardedVideo, forPlacement: placement, rootViewController: controller)
        }
    }
    
    // MARK: Appodeal Initialization
    func initializeAppodealSDK() {
        /// Custom settings
        // Appodeal.setFramework(.native, version: "1.0.0")
        // Appodeal.setTriggerPrecacheCallbacks(true)
        // Appodeal.setLocationTracking(true)
        //Appodeal.setLogLevel(AppodealConstants.logLevel)
        Appodeal.setAutocache(true, types: AppodealConstants.adTypes)
        
        /// Test Mode
        Appodeal.setTestingEnabled(AppodealConstants.testMode)
        
        /// User Data
        // Appodeal.setUserId("userID")
        
        // Initialise Appodeal SDK
        //Appodeal.setInterstitialDelegate(self)
        Appodeal.setRewardedVideoDelegate(self)
        Appodeal.initialize(withApiKey: AppodealConstants.key, types: AppodealConstants.adTypes)
    }
}

extension AdAppodeal {
    func nonSkippableVideoDidFinish() {
        perform(#selector(showNonSkippableAppodeal), with: nil, afterDelay: 20)
    }
    func rewardedVideoDidFinish() {
        perform(#selector(showNonSkippableAppodeal), with: nil, afterDelay: 20)
    }
}
