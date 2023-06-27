//
//  AdManager.swift
//  KeyboardSwift
//
//  Created by Jamil on 18/3/22.
//

import UIKit

class AdManager: UIViewController {
    public static let shared = AdManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showAdMobAdsOnParrent(_ viewController:UIViewController){
        /*
        FirebaseHelper *firebaseHelper = [FirebaseHelper sharedInstance];
        AdmobAd *adVC = [[AdmobAd alloc]initWithNibName:@"AdmobAd" bundle:nil];
        adVC.admobAdKey = [firebaseHelper getValue:kADMOBE_AD_KEY];
        adVC.adFailWithCompletion = ^(BOOL success){
            self.completionHandlerAdmob(success);
        };
        [viewController.view addSubview:adVC.view];
        [viewController addChildViewController:adVC];
         */
        
        //app setting::7
        let admobController = AdmobController()
        admobController.showOn(viewController)
    }
    
    func requestConsentInfo(){
        let admobController = AdmobController()
        admobController.requestConsentInfoUpdate()
    }
    
    func loadConsentForm(){
        let admobController = AdmobController()
        admobController.loadForm()
    }
    
    //MARK: - Appodeal
    func appodealInitializeSDK(){
        let appodealController = AdAppodeal()
        appodealController.initializeAppodealSDK()
    }
    func showAppodealAdsOnParrent(_ viewController:UIViewController){
        let appodealController = AdAppodeal()
        appodealController.showOn(viewController)
    }
    
}
