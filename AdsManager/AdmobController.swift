//
//  AdmobController.swift
//  KeyboardSwift
//
//  Created by Jamil on 17/3/22.
//

import UIKit
import GoogleMobileAds
import UserMessagingPlatform

class AdmobController: UIViewController, GADFullScreenContentDelegate {
    public static let sharedInstance = AdmobController()
    typealias admobCompletion = (_ success:Bool) -> Void
    
    private var interstitial: GADInterstitialAd?
    
    //app setting:: 6
    var admobAdKey = "ca-app-pub-9133033983333483/2540966764"

    //var void (^adFailWithCompletion)(BOOL success);

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.frame = CGRect.zero
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: admobAdKey, request: request ) { (ad, error) in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.interstitial = ad
            self.interstitial?.fullScreenContentDelegate = self
        }
        
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
        perform(#selector(showAd), with: nil, afterDelay: 0)
    }
    
    func showOn(_ viewController:UIViewController){
        let adVC = AdmobController(nibName: "AdmobController", bundle: nil)
        viewController.view.addSubview(adVC.view)
        viewController.addChild(adVC)
    }
    
    @objc func showAd(){
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
            perform(#selector(showAd), with: nil, afterDelay: 2)
        }
    }
    
    func requestConsentInfoUpdate(){
        // Create a UMPRequestParameters object.
        let parameters = UMPRequestParameters()
        
        let debugSettings = UMPDebugSettings()
//        debugSettings.testDeviceIdentifiers = ["275b5f12d7a4d7ffe03eb5b6b3daf1db"]
//        debugSettings.geography = UMPDebugGeography.EEA
        
        // Set tag for under age of consent. Here false means users are not under age.
        parameters.tagForUnderAgeOfConsent = false
        
        // Request an update to the consent information.
        UMPConsentInformation.sharedInstance.requestConsentInfoUpdate(
            with: parameters,
            completionHandler: { [self] error in

              // The consent information has updated.
              if error != nil {
                // Handle the error.
                  print("consent error::\(error)")
              } else {
                // The consent information state was updated.
                // You are now ready to see if a form is available.
                let formStatus = UMPConsentInformation.sharedInstance.formStatus
                  print("formStatus::\(formStatus.rawValue)")
                if formStatus == UMPFormStatus.available {
                  loadForm()
                }
              }
            })
    }
    
    func loadForm() {
        UMPConsentForm.load(completionHandler: { form, loadError in
        if loadError != nil {
          // Handle the error.
            print("loadError::\(loadError)")
        } else {
          // Present the form. You can also hold on to the reference to present
          // later.
          if UMPConsentInformation.sharedInstance.consentStatus == UMPConsentStatus.required {
            form?.present(
                from: self,
                completionHandler: { dismissError in
                  if UMPConsentInformation.sharedInstance.consentStatus == UMPConsentStatus.obtained {
                    // App can start requesting ads.
                  }
                    // Handle dismissal by reloading form.
                    self.loadForm()
                })
          } else {
            // Keep the form available for changes to user consent.
          }
        }
      })
    }
    
    //MARK: - DELEGATE METHODS
    
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
      print("Ad did fail to present full screen content.")
    }

    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did dismiss full screen content.")
    }
}
