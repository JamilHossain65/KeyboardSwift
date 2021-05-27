//
//  AppDelegate.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    //MARK: - Life Cycle
    func applicationDidEnterBackground(_ application: UIApplication) {
        //
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //
    }
    
    /*
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
            
            return true
        }
 */
}

