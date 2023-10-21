//
//  AdmobController.swift
//  KeyboardSwift
//
//  Created by Jamil on 17/3/22.
//

import UIKit
import GoogleMobileAds
import UserMessagingPlatform

//https://developers.facebook.com/docs/audience-network/guides/setting-up/ad-setup/ios/rewarded-video

class AdmobController: UIViewController, GADFullScreenContentDelegate {
    public static let shared = AdmobController()
    typealias admobCompletion = (_ success:Bool) -> Void
    
    //private var rewardedInterstitialAd: GADRewardedInterstitialAd?
    private var interstitialAd: GADInterstitialAd?
    
    //app setting:: 6
    var admobAdKey: String {
        get {
            let langName = getString(SelectedLanguage)
            switch langName {
            case Bangla:
                return ""
            case BanglaGoti:
                return ""
            case BanglaDruti:
                return "ca-app-pub-9133033983333483/1492998119"
            case Thai:
                return "ca-app-pub-9133033983333483/2553101054"
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
                return ""
            case Spanish:
                return "ca-app-pub-9133033983333483/4720877434"
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
                return "ca-app-pub-9133033983333483/2368759846"
            case JpHiragana:
                return "ca-app-pub-9133033983333483/4102060257"
            case JpKatakana:
                return "ca-app-pub-9133033983333483/4102060257"
            default://English
                return "ca-app-pub-9133033983333483/2553101054" //MARK: - todo
            }
        }
    }

    //var void (^adFailWithCompletion)(BOOL success);

    private var isMobileAdsStartCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect.zero
        
        let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
        print("deviceID::\(String(describing: deviceID))")
        //let staticID = "7B9B8DBE-E8EB-44B3-957C-43AD0F2EAFA2"
        
        //app setting:: 103
        //this check avoid admob policy violation
        if(deviceID == "7B9B8DBE-E8EB-44B3-957C-43AD0F2EAFA2" || //indian
           deviceID == "AC3DABB5-98CD-4CE0-98F8-EA42F686A6E0"    // russain
        ){
            GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["06fa119d4743dd21237899a32e0d1031"]
        }
        
    }
    
    func loadAdmobOn(_ viewController:UIViewController){
        let adVC = AdmobController(nibName: "AdmobController", bundle: nil)
        viewController.view.addSubview(adVC.view)
        viewController.addChild(adVC)
    }
    
    func loadRewardedInterstitial(_ viewController:UIViewController, isShow:Bool? = false){
        if isProVersion{ return }
        //Rewarded interstitial
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:admobAdKey, request: request) { ad, error in
            if let error = error {
                return print("Failed to load rewarded interstitial ad with error: \(error.localizedDescription)")
            }

            AdmobController.shared.interstitialAd = ad
            AdmobController.shared.interstitialAd?.fullScreenContentDelegate = self
            //let options = GADServerSideVerificationOptions()
              //    options.customRewardString = "SAMPLE_CUSTOM_DATA_STRING"
            //AdmobController.shared.interstitialAd?.serverSideVerificationOptions = options
            
            adLoadingStatus = .LOADED
            print("isShow::\(isShow!)")
            if isShow!{
                self.loadAdmobOn(viewController)
                AdmobController.shared.interstitialAd?.present(fromRootViewController: viewController)
            }
            
            print("ad loaded:::\(AdmobController.shared.interstitialAd)")
        }
    }
    
    @objc func showRewardedInterstitial(_ viewController:UIViewController) {
        if isProVersion{ return }
        guard let rewardedInterstitialAd = AdmobController.shared.interstitialAd else {
            loadRewardedInterstitial(viewController, isShow: true)
            return print("Ad wasn't ready")
        }
        
        loadAdmobOn(viewController)
        if UIApplication.shared.applicationState == .active{
            let isPurchased = getObject("kIsPurchaed") as? Bool ?? false
            if !isPurchased {
                self.interstitialAd?.present(fromRootViewController: viewController)
            }
        }else{
            let isPurchased = getObject("kIsPurchaed") as? Bool ?? false
            if !isPurchased {
                loadRewardedInterstitial(viewController, isShow: true)
            }
            print("app is not active")
        }
    }
    
    func showAdmobInterstitial(_ viewController:UIViewController){
        if isProVersion{ return }
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:admobAdKey, request: request) { ad, error in
            if let error = error {
                return print("Failed to load rewarded interstitial ad with error: \(error.localizedDescription)")
            }

            AdmobController.shared.interstitialAd = ad
            AdmobController.shared.interstitialAd?.fullScreenContentDelegate = self
            AdmobController.shared.interstitialAd?.present(fromRootViewController: viewController)
        }
    }
    
    //MARK: - ADMOB DELEGATE METHODS
    
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content::\(error.localizedDescription)")
        AdmobController.shared.interstitialAd = nil
        adLoadingStatus = .NOT_REQUESTED
    }
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("adWillPresentFullScreenContent.\(ad)")
        savePreAdShownTime()
        adLoadingStatus = .NOT_REQUESTED
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.:\(ad)")
        AdmobController.shared.interstitialAd = nil
        adLoadingStatus = .NOT_REQUESTED
    }
    
    //MARK: - Google Concent METHODS
    func requestConsentInfoUpdate(){
        // Create a UMPRequestParameters object.
        let parameters = UMPRequestParameters()
        // Set tag for under age of consent. false means users are not under age
        // of consent.
        let debugSettings = UMPDebugSettings()
        parameters.tagForUnderAgeOfConsent = false
        debugSettings.testDeviceIdentifiers = [ GADSimulatorID ]
        debugSettings.geography = .EEA
        parameters.debugSettings = debugSettings
        
        
        // Request an update for the consent information.
        UMPConsentInformation.sharedInstance.requestConsentInfoUpdate(with: parameters) {
            [weak self] requestConsentError in
            guard let self else { return }
            
            if let consentError = requestConsentError {
                // Consent gathering failed.
                return print("Error: \(consentError.localizedDescription)")
            }
            
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
                            })
                    } else {
                        // Keep the form available for changes to user consent.
                    }
                }
            })
            
        }
        
        // Check if you can initialize the Google Mobile Ads SDK in parallel
        // while checking for new consent information. Consent obtained in
        // the previous session can be used to request ads.
        //        if UMPConsentInformation.sharedInstance.canRequestAds {
        //            startGoogleMobileAdsSDK()
        //        }
    }
        
    private func startGoogleMobileAdsSDK() {
        DispatchQueue.main.async {
            guard !self.isMobileAdsStartCalled else { return }
            
            self.isMobileAdsStartCalled = true
            
            // Initialize the Google Mobile Ads SDK.
            GADMobileAds.sharedInstance().start()
            
            // TODO: Request an ad.
            // GADInterstitialAd.load(...)
        }
    }
}
