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
    static let key: String = "8d27e0858ace2ac52cee20d53ad32bc2beb523fa0fde604b"
    static let adTypes: AppodealAdType = [.interstitial,.rewardedVideo]
    static let logLevel: APDLogLevel = .debug
    static let testMode: Bool = false
}

class AdAppodeal: UIViewController, AppodealInterstitialDelegate {
    public static let shared = AdAppodeal()
    typealias AdAppodealCompletion = (_ success:Bool) -> Void
    
    //var void (^adFailWithCompletion)(BOOL success);

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.frame = CGRect.zero
        
        //sample code
        //https://github.com/appodeal/appodeal-ios-demo
        Appodeal.setInterstitialDelegate(self)
        self.showAd()
    }
    
    func showOn(_ viewController:UIViewController){
        DispatchQueue.main.async {
            let adVC = AdAppodeal(nibName: "AdAppodeal", bundle: nil)
            viewController.view.addSubview(adVC.view)
            viewController.addChild(adVC)
        }
    }
    
    @objc func showAd(){
        print("appodeal ad should show here")
        perform(#selector(showAd), with: nil, afterDelay: 10*60)
        let placement = "default"
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
    
    func interstitialDidLoadAdIsPrecache(_ precache: Bool) {
        print("interstitialDidLoadAdIsPrecache...")
    }
    
    func interstitialWillPresent() {
        print("interstitialWillPresent...")
    }
}
