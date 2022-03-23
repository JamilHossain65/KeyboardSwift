//
//  AppDelegate.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

import Appodeal
import FirebaseCore
import FirebaseAuth
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        //[FIRApp configure];
        FirebaseApp.configure()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        perform(#selector(adAcknoledge), with: nil, afterDelay: 5)
    }
    
    @objc func adAcknoledge(){
        if #available(iOS 15.0, *) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    
                })
            }
        }
    }

    //MARK: - Life Cycle
    
    //test for open continer app
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        print("url1::\(url)")
        return true
        }

        func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
            print("url2::\(url)")
            return true
        }

        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            
            print("url3::\(url)")
            
            guard let rootVC:UIViewController =  UIApplication.shared.windows.first?.rootViewController else { return true }
            
            print("rootVC::\(rootVC)")
            
            let adManager = AdManager()
            adManager.showAdMobAdsOnParrent(rootVC)
            
            return true
        }
    
}

