//
//  AppDelegate.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        uiSetup()
        return true
    }
    func uiSetup()
    {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
}

