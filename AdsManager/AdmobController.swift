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
    var admobCompletion : ((_ success: Bool) -> ())?
    var rewardedAd: GADRewardedAd?
    var interstitialAd: GADInterstitialAd?
    
    //app setting:: 6
    var admobAdKey: String {
        get {
            let langName = getString(SelectedLanguage)
            switch langName {
            case Bangla:
                return ""
            case BanglaGoti:
                return "ca-app-pub-9133033983333483/1612139034"
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
                return "ca-app-pub-9133033983333483/6077303084"
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
            case SmartFonts:
                return "ca-app-pub-9133033983333483/2540966764"
            default://English
                return "ca-app-pub-9133033983333483/1612139034" //MARK: - todo
            }
        }
    }

    //var void (^adFailWithCompletion)(BOOL success);

    private var isMobileAdsStartCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect.zero
        
        let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
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
    
    func loadRewardedAd(_ viewController:UIViewController, isShow:Bool? = false){
        //if !Reachability.isConnected() { return }
        
        if let _ = AdmobController.shared.rewardedAd {
            return log("Ad already loaded")
        }
        
        let rewardedKey = "ca-app-pub-9133033983333483/6496283136"
        GADRewardedAd.load(withAdUnitID:rewardedKey, request: GADRequest()) { ad, error in
            if let error = error {
                return log("Failed to load rewarded interstitial ad with error: \(error.localizedDescription)")
            }
            
            log("Rewarded ad load")

            AdmobController.shared.rewardedAd = ad
            AdmobController.shared.rewardedAd?.fullScreenContentDelegate = self
            //let options = GADServerSideVerificationOptions()
              //    options.customRewardString = "SAMPLE_CUSTOM_DATA_STRING"
            //AdmobController.shared.interstitialAd?.serverSideVerificationOptions = options
            adLoadingStatus = .LOADED
            LoadingView.shared.dismish()

            if isShow!{
                self.loadAdmobOn(viewController)
                AdmobController.shared.rewardedAd?.present(fromRootViewController: viewController, userDidEarnRewardHandler: {
                    print("EarnReward 1")
                })
            }
        }
    }
    
    
    @objc func showRewardedAd(_ viewController:UIViewController) {
        guard let _ = AdmobController.shared.rewardedAd else {
            loadRewardedAd(viewController, isShow: true)
            return log("Ad wasn't ready")
        }
        
        loadAdmobOn(viewController)
        if UIApplication.shared.applicationState == .active{
            let isPurchased = getObject("kIsPurchaed") as? Bool ?? false
            if !isPurchased {
                AdmobController.shared.rewardedAd?.present(fromRootViewController: viewController, userDidEarnRewardHandler: {
                    print("EarnReward 1")
                })
            }
        }else{
            let isPurchased = getObject("kIsPurchaed") as? Bool ?? false
            if !isPurchased {
                loadRewardedAd(viewController, isShow: true)
            }
            log("app is not active")
        }
    }
    
    
    func showAdmobInterstitial(_ viewController:UIViewController){
        // if !Reachability.isConnected() { return }
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:admobAdKey, request: request) { ad, error in
            if let error = error {
                return log("Failed to load interstitial ad with error: \(error.localizedDescription)")
            }

            self.loadAdmobOn(viewController)
            AdmobController.shared.interstitialAd = ad
            AdmobController.shared.interstitialAd?.fullScreenContentDelegate = self
            AdmobController.shared.interstitialAd?.present(fromRootViewController: viewController)
        }
    }
    
    //MARK: - ADMOB DELEGATE METHODS
    
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        log("Ad did fail to present full screen content::\(error.localizedDescription)")
        AdmobController.shared.interstitialAd = nil
        AdmobController.shared.rewardedAd = nil
        LoadingView.shared.removeFromSuperview()
        adLoadingStatus = .NOT_REQUESTED
        admobCompletion?(true)
    }
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        log("adWillPresentFullScreenContent.\(ad)")
        savePreAdShownTime()
        adLoadingStatus = .SHOWING
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        log("Ad did dismiss full screen content.:\(ad)")
        AdmobController.shared.interstitialAd = nil
        AdmobController.shared.rewardedAd = nil
        adLoadingStatus = .NOT_REQUESTED
        admobCompletion?(true)
    }
    
    func adDidRecordClick(_ ad: GADFullScreenPresentingAd) {
        log("adDidRecordClick:\(ad)")
        AdmobController.shared.interstitialAd = nil
        AdmobController.shared.rewardedAd = nil
        adLoadingStatus = .NOT_REQUESTED
    }
    
    //MARK: - Google Concent Methods
    static func askForConsentForm(_ controller:UIViewController, completion: @escaping () -> Void) {
        let umpParams = UMPRequestParameters()
        let debugSettings = UMPDebugSettings()
        //
        #if DEBUG
        debugSettings.geography = UMPDebugGeography.EEA
        #endif  // DEBUG
        umpParams.debugSettings = debugSettings
        umpParams.tagForUnderAgeOfConsent = false
        
        UMPConsentInformation
            .sharedInstance
            .requestConsentInfoUpdate(with: umpParams,
                                      completionHandler: { error in
                if error != nil {
                    log("MYERROR #1 \(String(describing: error))")
                    completion()
                } else {
                    let formStatus = UMPConsentInformation.sharedInstance.formStatus
                    log("FORM STATUS: \(formStatus)")
                    
                    if formStatus == .available {
                        loadForm(controller, completion: {
                            completion()
                        })
                    } else {
                        completion()
                    }
                }
            })
    }
    
    static func loadForm(_ controller:UIViewController, completion: @escaping () -> Void) {
        UMPConsentForm.load(completionHandler: { form, loadError in
            if loadError != nil {
                log("MYERROR #2 \(String(describing: loadError))")
                completion()
            } else {
                log("CONSENT STATUS: \(UMPConsentInformation.sharedInstance.consentStatus)")
                if UMPConsentInformation
                    .sharedInstance.consentStatus == .required {
                    
//                    guard let rootViewController = UIApplication.shared.currentUIWindow()?.rootViewController else {
//                        return completion()
//                    }
                    
                    form?.present(from: controller, completionHandler: { dismissError in
                        if UMPConsentInformation
                            .sharedInstance.consentStatus == .obtained {
                            completion()
                        }
                    })
                }
            }
        })
    }
    
    func startGoogleMobileAdsSDK() {
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
