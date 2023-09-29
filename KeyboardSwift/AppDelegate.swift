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
import UserNotifications
import AdSupport
import UserMessagingPlatform

@main

//MARK: -
/*
Disable unwanted log print in xcode simulator
1 - From Xcode menu open: Product > Scheme > Edit Scheme

2 - On your Environment Variables set OS_ACTIVITY_MODE = disable
*/

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //GADMobileAds.sharedInstance().start(completionHandler: nil)
        FirebaseApp.configure()
        AdManager.shared.appodealInitializeSDK()
//        let adManager = AdManager()
//        adManager.requestConsentInfo()
        GADMobileAds.sharedInstance().start()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        setNotification()
    }
    
    @objc func adAcknoledge(){
        if #available(iOS 15.0, *) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    print("requestTrackingAuthorization completed...")
                })
            }
        }
    }
    
    func setNotification(){
        //Ask for notification permission
        let n = NotificationHandler()
        n.askNotificationPermission {
            //n.scheduleAllNotifications()
            
            //IMPORTANT: wait for 1 second to display another alert
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if #available(iOS 14, *) {
                  ATTrackingManager.requestTrackingAuthorization { (status) in
                    //print("IDFA STATUS: \(status.rawValue)")
                    //FBAdSettings.setAdvertiserTrackingEnabled(true)
                  }
                }
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
            //adManager.showAdMobAdsOnParrent(rootVC)
            return true
        }
    
}

class NotificationHandler{
    //Permission function
    func askNotificationPermission(completion: @escaping ()->Void){
        
        //Permission to send notifications
        let center = UNUserNotificationCenter.current()
        // Request permission to display alerts and play sounds.
        center.requestAuthorization(options: [.alert, .badge, .sound])
        { (granted, error) in
            // Enable or disable features based on authorization.
            completion()
        }
    }
}

