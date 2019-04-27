//
//  AppDelegate.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var applicationCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ReachabilityManager.shared.startListening { (status) in
            if status == .notReachable {
                SVProgressHUD.showInfo(withStatus: status.statusString)
            }
        }
        
        customNavigationBar()
        
        start()
        
        return true
    }
    
    /// start the application coordinator
    private func start() {
        applicationCoordinator = ApplicationCoordinator()
        self.window = applicationCoordinator?.window
        applicationCoordinator?.start()
    }
    
    /// customize the navigation bar
    private func customNavigationBar() {
        UINavigationBar.appearance().backgroundColor = UIColor.primary
        UINavigationBar.appearance().barTintColor = UIColor.primary
        UINavigationBar.appearance().tintColor = UIColor.accent
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.accent]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage()
    }
}

