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
//https://developers.google.com/admob/ios/app-open

class AdmobController: UIViewController, FullScreenContentDelegate {
    public static let shared = AdmobController()
    var admobCompletion : ((_ error:Error?) -> ())?
    var rewardedAd: RewardedAd?
    var interstitialAd: InterstitialAd?
    var appOpenAd: AppOpenAd?
    var rewardedInterstitialAd: RewardedInterstitialAd?
    
    /// The privacy options button.
    @IBOutlet weak var privacySettingsButton: UIBarButtonItem!

    /// The ad inspector button.
    @IBOutlet weak var adInspectorButton: UIBarButtonItem!

    /// The view that holds the native ad.
    @IBOutlet weak var nativeAdPlaceholder: UIView!

    /// Indicates whether videos should start muted.
    @IBOutlet weak var startMutedSwitch: UISwitch!

    /// The refresh ad button.
    @IBOutlet weak var refreshAdButton: UIButton!

    /// Displays the current status of video assets.
    @IBOutlet weak var videoStatusLabel: UILabel!

    /// The SDK version label.
    @IBOutlet weak var versionLabel: UILabel!

    /// The ad loader. You must keep a strong reference to the GADAdLoader during the ad loading
    /// process.
    var adLoader: AdLoader!

    /// The native ad view that is being presented.
    var nativeAdView: NativeAdView!
    
    //var void (^adFailWithCompletion)(BOOL success);

    private var isMobileAdsStartCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect.zero
        
        //let deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
        //let staticID = "7B9B8DBE-E8EB-44B3-957C-43AD0F2EAFA2"
        
        //app setting:: 103
        //this check avoid admob policy violation
//        if(deviceID == "7B9B8DBE-E8EB-44B3-957C-43AD0F2EAFA2" || //indian
//           deviceID == "AC3DABB5-98CD-4CE0-98F8-EA42F686A6E0"    // russain
//        ){
//            MobileAds.shared.requestConfiguration.testDeviceIdentifiers = ["06fa119d4743dd21237899a32e0d1031"]
//        }
        
        //initNativeAd()
        
    }
    
    func initNativeAd(){
        /*
        guard
          let nibObjects = Bundle.main.loadNibNamed("NativeAdView", owner: nil, options: nil),
          let adView = nibObjects.first as? NativeAdView
        else {
          assert(false, "Could not load nib file for adView")
        }

        setAdView(adView)
         */
    }

    func setAdView(_ view: NativeAdView) {
      nativeAdView = view
      nativeAdPlaceholder.addSubview(view)
      nativeAdView.translatesAutoresizingMaskIntoConstraints = false

      // Layout constraints for positioning the native ad view to stretch the entire width and height
      // of the nativeAdPlaceholder.
      NSLayoutConstraint.activate([
        nativeAdView.leadingAnchor.constraint(equalTo: nativeAdPlaceholder.leadingAnchor),
        nativeAdView.trailingAnchor.constraint(equalTo: nativeAdPlaceholder.trailingAnchor),
        nativeAdView.topAnchor.constraint(equalTo: nativeAdPlaceholder.topAnchor),
        nativeAdView.bottomAnchor.constraint(equalTo: nativeAdPlaceholder.bottomAnchor),
      ])
    }

    // MARK: - Actions

    /// Handle changes to user consent.
    @IBAction func privacySettingsTapped(_ sender: UIBarButtonItem) {
        //conscent
      /*
        Task {
        do {
          try await GoogleMobileAdsConsentManager.shared.presentPrivacyOptionsForm(from: self)
        } catch {
          let alertController = UIAlertController(
            title: error.localizedDescription, message: "Please try again later.",
            preferredStyle: .alert)
          alertController.addAction(
            UIAlertAction(
              title: "OK", style: .cancel,
              handler: nil))
          present(alertController, animated: true)
        }
      }
        */
    }

    /// Handle ad inspector launch.
    @IBAction func adInspectorTapped(_ sender: UIBarButtonItem) {
      Task {
        do {
          try await MobileAds.shared.presentAdInspector(from: self)
        } catch {
          let alertController = UIAlertController(
            title: error.localizedDescription, message: "Please try again later.",
            preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
          present(alertController, animated: true)
        }
      }
    }

    /// Refreshes the native ad.
    //@IBAction func refreshAd(_ sender: AnyObject!) {
     func refreshAd() {
//      refreshAdButton.isEnabled = false
//      videoStatusLabel.text = ""
    //    adLoader = AdLoader(
    //      adUnitID: adUnitID, rootViewController: self,
    //      adTypes: [.native], options: nil)
    //    adLoader.delegate = self
    //    adLoader.load(Request())
        print("nativeAdKey::\(nativeAdKey)")
        let multipleAdOptions = MultipleAdsAdLoaderOptions()
        multipleAdOptions.numberOfAds = 1
        adLoader = AdLoader(adUnitID: nativeAdKey,rootViewController: self,
             adTypes: [.native],
             options: [multipleAdOptions]
        )
         
        adLoader.delegate = self
        adLoader.load(Request())
    }

    /// Returns a `UIImage` representing the number of stars from the given star rating; returns `nil`
    /// if the star rating is less than 3.5 stars.
    func imageOfStars(from starRating: NSDecimalNumber?) -> UIImage? {
      guard let rating = starRating?.doubleValue else {
        return nil
      }
      if rating >= 5 {
        return UIImage(named: "stars_5")
      } else if rating >= 4.5 {
        return UIImage(named: "stars_4_5")
      } else if rating >= 4 {
        return UIImage(named: "stars_4")
      } else if rating >= 3.5 {
        return UIImage(named: "stars_3_5")
      } else {
        return nil
      }
    }
    
//    func loadAdmobOn(_ viewController:UIViewController){
//        let adVC = AdmobController(nibName: "AdmobController", bundle: nil)
//        viewController.view.addSubview(adVC.view)
//        viewController.addChild(adVC)
//    }
    
    /*
    func loadRewardedAd(_ viewController:UIViewController, isShow:Bool? = false){
        //if !Reachability.isConnected() { return }
        
        if let _ = AdmobController.shared.rewardedAd {
            return log("Ad already loaded")
        }
        
        GADRewardedAd.load(withAdUnitID:admobAdRewardedKey, request: GADRequest()) { ad, error in
            if let error = error {
                return log("Failed to load rewarded ad with error: \(error.localizedDescription)")
            }
            
            log("Rewarded ad load")

            AdmobController.shared.rewardedAd = ad
            AdmobController.shared.rewardedAd?.fullScreenContentDelegate = self
            //let options = GADServerSideVerificationOptions()
              //    options.customRewardString = "SAMPLE_CUSTOM_DATA_STRING"
            //AdmobController.shared.interstitialAd?.serverSideVerificationOptions = options
            adLoadingStatus = .LOADED

            if isShow!{
                self.loadAdmobOn(viewController)
                AdmobController.shared.rewardedAd?.present(fromRootViewController: viewController, userDidEarnRewardHandler: {
                    print("EarnReward 1")
                })
            }
        }
    }
    
    
    @objc func showRewardedAd(_ viewController:UIViewController, completion: ((Int) -> Void)? = nil) {
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
                    if let _completion = completion {
                        _completion(1)
                    }
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
    
    func loadRewardedInterstitialAd(_ viewController:UIViewController, isShow:Bool? = false,completion: ((Int) -> Void)? = nil){
        //if !Reachability.isConnected() { return }
        
        if let _ = AdmobController.shared.rewardedInterstitialAd {
            return log("Ad already loaded")
        }
        
        GADRewardedInterstitialAd.load(withAdUnitID:admobAdRewardedInterstitialKey, request: GADRequest()) { ad, error in
            if let error = error {
                return log("Failed to load rewarded Interstitial ad with error: \(error.localizedDescription)")
            }
            
            log("Rewarded ad load")

            AdmobController.shared.rewardedInterstitialAd = ad
            AdmobController.shared.rewardedInterstitialAd?.fullScreenContentDelegate = self
            //let options = GADServerSideVerificationOptions()
              //    options.customRewardString = "SAMPLE_CUSTOM_DATA_STRING"
            //AdmobController.shared.interstitialAd?.serverSideVerificationOptions = options
            adLoadingStatus = .LOADED

            if isShow!{
                self.loadAdmobOn(viewController)
                AdmobController.shared.rewardedInterstitialAd?.present(fromRootViewController: viewController, userDidEarnRewardHandler: {
                    print("EarnReward 1")
                    if let _completion = completion {
                        _completion(1)
                    }
                })
            }
        }
    }
    
    
    @objc func showRewardedInterstitialAd(_ viewController:UIViewController, completion: ((Int) -> Void)? = nil) {
        guard let _ = AdmobController.shared.rewardedInterstitialAd else {
            loadRewardedInterstitialAd(viewController, isShow: true, completion: completion)
            return log("Ad wasn't ready")
        }
        
        loadAdmobOn(viewController)
        if UIApplication.shared.applicationState == .active{
            let isPurchased = getObject("kIsPurchaed") as? Bool ?? false
            if !isPurchased {
                AdmobController.shared.rewardedInterstitialAd?.present(fromRootViewController: viewController, userDidEarnRewardHandler: {
                    print("EarnReward 1")
                    if let _completion = completion {
                        _completion(1)
                    }
                })
            }
        }else{
            let isPurchased = getObject("kIsPurchaed") as? Bool ?? false
            if !isPurchased {
                loadRewardedInterstitialAd(viewController, isShow: true)
            }
            log("app is not active")
        }
    }
    */
    
    func showAdmobInterstitial(_ viewController:UIViewController){
        // if !Reachability.isConnected() { return }
        if isAlreadyShowingAd { return }
        let request = Request()
        InterstitialAd.load(with:admobAdKey, request: request) { ad, error in
            if let error = error {
                self.admobCompletion?(error)
                return log("Failed to load interstitial ad with error: \(error.localizedDescription)")
            }

            //self.loadAdmobOn(viewController)
            AdmobController.shared.interstitialAd = ad
            AdmobController.shared.interstitialAd?.fullScreenContentDelegate = self
            AdmobController.shared.interstitialAd?.present(from: viewController)
            currentAdUnit = .APP_OPEN
            log("currentAdUnit:\(currentAdUnit) admobAdKey::\(admobAdKey)")
        }
    }
    
    func showAdmobAppOpenAd(_ viewController:UIViewController){
        // if !Reachability.isConnected() { return }
        if isAlreadyShowingAd { return }
        let request = Request()
        AppOpenAd.load(with:appOpenAdKey, request: request) { ad, error in
            if let error = error {
                self.admobCompletion?(error)
                return log("Failed to load open ad with error: \(error.localizedDescription)")
            }

            
            //self.loadAdmobOn(viewController)
            AdmobController.shared.appOpenAd = ad
            AdmobController.shared.appOpenAd?.fullScreenContentDelegate = self
            AdmobController.shared.appOpenAd?.present(from: viewController)
            currentAdUnit = .INTERSTITIAL
            log("currentAdUnit:\(currentAdUnit)")
        }
    }
    
    func showNativeAd(_ viewController:UIViewController){
        // if !Reachability.isConnected() { return }
//        let request = Request()
//        AppOpenAd.load(with:appOpenAdKey, request: request) { ad, error in
//            if let error = error {
//                return log("Failed to load interstitial ad with error: \(error.localizedDescription)")
//            }
//
//            self.loadAdmobOn(viewController)
//            AdmobController.shared.appOpenAd = ad
//            AdmobController.shared.appOpenAd?.fullScreenContentDelegate = self
//            AdmobController.shared.appOpenAd?.present(from: viewController)
//        }
        
        refreshAd()
        
    }
    
    //MARK: - ADMOB DELEGATE METHODS
    
    // Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        log("Ad did fail to present full screen content::\(error.localizedDescription)")
        
        AdmobController.shared.interstitialAd = nil
        AdmobController.shared.appOpenAd = nil
        AdmobController.shared.rewardedAd = nil
        adLoadingStatus = .NOT_REQUESTED
        admobCompletion?(error)
    }
    
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        log("adWillPresentFullScreenContent.\(ad)")
        savePreAdShownTime()
        adLoadingStatus = .SHOWING
        isAlreadyShowingAd = true
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        log("Ad did dismiss full screen content.:\(ad)")
        AdmobController.shared.interstitialAd = nil
        AdmobController.shared.rewardedAd = nil
        adLoadingStatus = .NOT_REQUESTED
        admobCompletion?(nil)
        isAlreadyShowingAd = false
    }
    
    func adDidRecordClick(_ ad: FullScreenPresentingAd) {
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
        //umpParams.isTaggedForUnderAgeOfConsent = false
        
        
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
            MobileAds.shared.start()
            
            // TODO: Request an ad.
            // GADInterstitialAd.load(...)
        }
    }
}

//MARK: - NATIVE AD DELEGATE METHODS
extension AdmobController: VideoControllerDelegate {
   func videoControllerDidEndVideoPlayback(_ videoController: VideoController) {
        videoStatusLabel.text = "Video playback has ended."
   }
}

extension AdmobController: @preconcurrency AdLoaderDelegate {
    func adLoader(_ adLoader: AdLoader, didFailToReceiveAdWithError error: Error) {
         print("\(adLoader) failed with error: \(error.localizedDescription)")
         refreshAdButton.isEnabled = true
    }
}

extension AdmobController: NativeAdLoaderDelegate {

// [START display_native_ad]
func adLoader(_ adLoader: AdLoader, didReceive nativeAd: NativeAd) {
  // [START_EXCLUDE]
  refreshAdButton.isEnabled = true
  // [END_EXCLUDE]

  // Set ourselves as the native ad delegate to be notified of native ad events.
  nativeAd.delegate = self

  // Populate the native ad view with the native ad assets.
  // The headline and mediaContent are guaranteed to be present in every native ad.
  (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
  // [START set_media_content]
  nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent
  // [END set_media_content]

  // Some native ads will include a video asset, while others do not. Apps can use the
  // GADVideoController's hasVideoContent property to determine if one is present, and adjust their
  // UI accordingly.
  let mediaContent = nativeAd.mediaContent
  if mediaContent.hasVideoContent {
    // By acting as the delegate to the GADVideoController, this ViewController receives messages
    // about events in the video lifecycle.
    mediaContent.videoController.delegate = self
    videoStatusLabel.text = "Ad contains a video asset."
  } else {
    videoStatusLabel.text = "Ad does not contain a video."
  }

  // This app uses a fixed width for the GADMediaView and changes its height to match the aspect
  // ratio of the media it displays.
  if let mediaView = nativeAdView.mediaView, nativeAd.mediaContent.aspectRatio > 0 {
    let aspectRatioConstraint = NSLayoutConstraint(
      item: mediaView,
      attribute: .width,
      relatedBy: .equal,
      toItem: mediaView,
      attribute: .height,
      multiplier: CGFloat(nativeAd.mediaContent.aspectRatio),
      constant: 0)
    mediaView.addConstraint(aspectRatioConstraint)
    nativeAdView.layoutIfNeeded()
  }

  // These assets are not guaranteed to be present. Check that they are before
  // showing or hiding them.
  (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
  nativeAdView.bodyView?.isHidden = nativeAd.body == nil

  (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
  nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil

  (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
  nativeAdView.iconView?.isHidden = nativeAd.icon == nil

  (nativeAdView.starRatingView as? UIImageView)?.image = imageOfStars(from: nativeAd.starRating)
  nativeAdView.starRatingView?.isHidden = nativeAd.starRating == nil

  (nativeAdView.storeView as? UILabel)?.text = nativeAd.store
  nativeAdView.storeView?.isHidden = nativeAd.store == nil

  (nativeAdView.priceView as? UILabel)?.text = nativeAd.price
  nativeAdView.priceView?.isHidden = nativeAd.price == nil

  (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
  nativeAdView.advertiserView?.isHidden = nativeAd.advertiser == nil

  // In order for the SDK to process touch events properly, user interaction should be disabled.
  nativeAdView.callToActionView?.isUserInteractionEnabled = false

  // Associate the native ad view with the native ad object. This is
  // required to make the ad clickable.
  // Note: this should always be done after populating the ad views.
  nativeAdView.nativeAd = nativeAd
}
// [END display_native_ad]
}

// MARK: - GADNativeAdDelegate implementation
extension AdmobController: @preconcurrency NativeAdDelegate {

func nativeAdDidRecordClick(_ nativeAd: NativeAd) {
  print("\(#function) called")
}

func nativeAdDidRecordImpression(_ nativeAd: NativeAd) {
  print("\(#function) called")
}

func nativeAdWillPresentScreen(_ nativeAd: NativeAd) {
  print("\(#function) called")
}

func nativeAdWillDismissScreen(_ nativeAd: NativeAd) {
  print("\(#function) called")
}

func nativeAdDidDismissScreen(_ nativeAd: NativeAd) {
  print("\(#function) called")
}

func nativeAdWillLeaveApplication(_ nativeAd: NativeAd) {
  print("\(#function) called")
}
}
