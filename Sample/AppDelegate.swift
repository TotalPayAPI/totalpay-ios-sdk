//
//  AppDelegate.swift
//  Sample
//
//  Created by Bodia on 10.03.2021.
//

import UIKit
import AkuratecoSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let credentials = AkuratecoCredential(clientKey: "481305b8-2fd4-11eb-a102-4a8510033d01",
                                              clientPass: "7ccfbb194e7646a30a18d74422d40e7d",
                                              paymentUrl: "https://api.rafinita.com/post")
        AkuratecoSDK.config(credentials)
        
        return true
    }
}
