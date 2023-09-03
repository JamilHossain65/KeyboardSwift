//
//  FBAudienceNetwork.swift
//  KeyboardSwift
//
//  Created by Jamil on 17/3/22.
//

import UIKit
import FBAudienceNetwork

class FBAudienceNetwork: UIViewController, FBRewardedVideoAdDelegate {
    public static let sharedInstance = FBAudienceNetwork()
    //typealias admobCompletion = (_ success:Bool) -> Void
    
    private var rewardedVideoAd: FBRewardedVideoAd?
    
    //app setting:: 200
    var admobAdKey: String {
        get {
            let langName = getString(SelectedLanguage)
            
            switch langName {
            case Bangla:
                return ""
            case BanglaGoti:
                return ""
            case BanglaDruti:
                return "ca-app-pub-9133033983333483/9411877271"
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
            case Portuguese:
                return ""
            case JpHiragana:
                return "ca-app-pub-9133033983333483/4102060257"
            case JpKatakana:
                return "ca-app-pub-9133033983333483/4102060257"
            default://English
                return "ca-app-pub-9133033983333483/9411877271"
            }
        }
    }

    //var void (^adFailWithCompletion)(BOOL success);

    private var isMobileAdsStartCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect.zero
        self.view.backgroundColor = .red
        
        let isPurchased = getObject("kIsPurchaed") as? Bool ?? false
        if !isPurchased{
            // Instantiate an rewarded video object.
              // NOTE: the placement ID will eventually identify this as your app. You can ignore it while you are testing
              // and replace it later when you have signed up.
              // While you are using this temporary code you will only get test ads and if you release
              // your code like this to the App Store your users will not receive ads (you will get a 'No Fill' error).
              let rewardedVideoAd = FBRewardedVideoAd(placementID: "YOUR_PLACEMENT_ID")
              rewardedVideoAd.delegate = self
              
              // For auto play video ads, it's recommended to load the ad at least 30 seconds before it is shown
              rewardedVideoAd.load(withBidPayload: "")
              
              self.rewardedVideoAd = rewardedVideoAd
        }
        
        //GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["06fa119d4743dd21237899a32e0d1031"]
    }
    
    func showOn(_ viewController:UIViewController){
        let adVC = FBAudienceNetwork(nibName: "FBAudienceNetwork", bundle: nil)
        viewController.view.addSubview(adVC.view)
        viewController.addChild(adVC)
    }
    
    @objc func showMetaRewardedAd(){
        guard let rewardedVideoAd = rewardedVideoAd, rewardedVideoAd.isAdValid else {
            return
          }
          rewardedVideoAd.show(fromRootViewController: self)
    }
        
    //MARK: - DELEGATE METHODS
    
    func rewardedVideoAdDidLoad(_ rewardedVideoAd: FBRewardedVideoAd) {
      print("Video ad is loaded and ready to be displayed")
    }

    func rewardedVideoAd(_ rewardedVideoAd: FBRewardedVideoAd, didFailWithError error: Error) {
      print("Rewarded video ad failed to load")
    }

    func rewardedVideoAdDidClick(_ rewardedVideoAd: FBRewardedVideoAd) {
      print("Video ad clicked")
    }

    func rewardedVideoAdDidClose(_ rewardedVideoAd: FBRewardedVideoAd) {
      print("Rewarded Video ad closed - this can be triggered by closing the application, or closing the video end card")
    }

    func rewardedVideoAdVideoComplete(_ rewardedVideoAd: FBRewardedVideoAd) {
      print("Rewarded Video ad video completed - this is called after a full video view, before the ad end card is shown. You can use this event to initialize your reward")
    }
}
