//
//  AdAppodeal.swift
//  KeyboardSwift
//
//  Created by Jamil on 17/3/22.
//

import UIKit
import Appodeal
//import APDAppodealAdExchangeAdapter

private struct AppodealConstants {
    static let key: String = "eeee4e1c555fb055153b45b9444be6636ca4ac238babdc69"
    static let adTypes: AppodealAdType = [.interstitial, .rewardedVideo, .banner, .nativeAd]
    static let logLevel: APDLogLevel = .debug
    static let testMode: Bool = true
}

class AdAppodeal: UIViewController, AppodealInterstitialDelegate {
    public static let shared = AdAppodeal()
    typealias AdAppodealCompletion = (_ success:Bool) -> Void
    
    //var interstitial: GADInterstitial?
    var appodealAdKey = "eeee4e1c555fb055153b45b9444be6636ca4ac238babdc69"

    //var void (^adFailWithCompletion)(BOOL success);

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.frame = CGRect.zero
        
        //sample code
        //https://github.com/appodeal/appodeal-ios-demo
        Appodeal.setInterstitialDelegate(self)
        
        showAd()
    }
    
    func showOn(_ viewController:UIViewController){
        DispatchQueue.main.async {
            let adVC = AdAppodeal(nibName: "AdAppodeal", bundle: nil)
            viewController.view.addSubview(adVC.view)
            viewController.addChild(adVC)
        }
    }
    
    @objc func showAd(){
//        if let _interstitial = interstitial, _interstitial.hasBeenUsed == false {
//            perform(#selector(showAd), with: nil, afterDelay: 1)
//        }else{
//            interstitial = nil
//        }
//
//        if interstitial != nil {
//            //let _interstitial = interstitial, _interstitial.isReady
//            interstitial?.present(fromRootViewController: self)
//        }
        perform(#selector(showAd), with: nil, afterDelay: 1)
        
        let placement = "default"
        //Appodeal.isInitalized(for: .interstitial)
        Appodeal.canShow(.interstitial, forPlacement: placement)
        
        Appodeal.showAd(.interstitial,
                        forPlacement: placement,
                        rootViewController: self)
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
        Appodeal.setInterstitialDelegate(self)
        Appodeal.initialize(withApiKey: AppodealConstants.key, types: AppodealConstants.adTypes)
    }
    
    func appodealSDKDidInitialize() {
        // Appodeal SDK did complete initialization
        print("appodealSDKDidInitialize")
        perform(#selector(showAd), with: nil, afterDelay: 0)
    }
    
    func interstitialDidLoadAdIsPrecache(_ precache: Bool) {
        print("interstitialDidLoadAdIsPrecache...")
    }
    
    func interstitialWillPresent() {
        print("interstitialWillPresent...")
    }
}
