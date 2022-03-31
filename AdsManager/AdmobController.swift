//
//  AdmobController.swift
//  KeyboardSwift
//
//  Created by Jamil on 17/3/22.
//

import UIKit
import GoogleMobileAds

class AdmobController: UIViewController,/*GADFullScreenContentDelegate,*/ GADInterstitialDelegate {
    public static let sharedInstance = AdmobController()
    typealias admobCompletion = (_ success:Bool) -> Void
    
    var interstitial: GADInterstitial?
    //app setting:: 6
    var admobAdKey = "ca-app-pub-9133033983333483/2677152111"

    //var void (^adFailWithCompletion)(BOOL success);

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.frame = CGRect.zero
        
        let request = GADRequest()
        interstitial = GADInterstitial(adUnitID: admobAdKey)
        interstitial?.delegate = self
        
        let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
        print("deviceID::\(String(describing: deviceID))")
        //let staticID = "7B9B8DBE-E8EB-44B3-957C-43AD0F2EAFA2"
        
        //app setting:: 3
        //this check avoid admob policy violation
        if(deviceID == "7B9B8DBE-E8EB-44B3-957C-43AD0F2EAFA2" || //indian
           deviceID == "AC3DABB5-98CD-4CE0-98F8-EA42F686A6E0"    // russain
        ){
            GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["06fa119d4743dd21237899a32e0d1031"]
        }
        
        interstitial?.load(request)
        perform(#selector(showAd), with: nil, afterDelay: 0)
    }
    
    func showOn(_ viewController:UIViewController){
        let adVC = AdmobController(nibName: "AdmobController", bundle: nil)
        viewController.view.addSubview(adVC.view)
        viewController.addChild(adVC)
    }
    
    @objc func showAd(){
        if let _interstitial = interstitial, _interstitial.hasBeenUsed == false {
            perform(#selector(showAd), with: nil, afterDelay: 1)
        }else{
            interstitial = nil
        }
        
        if interstitial != nil {
            //let _interstitial = interstitial, _interstitial.isReady
            interstitial?.present(fromRootViewController: self)

        } else {
            print("Ad wasn't ready")
        }
    }
    
    //MARK: - DELEGATE METHODS
    /*
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
      print("Ad did fail to present full screen content.")
    }

    /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did present full screen content.")
    }

    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did dismiss full screen content.")
    }
 */
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitialDidDismissScreen")
    }
    
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        print("interstitialWillPresentScreen")
    }
    
}
