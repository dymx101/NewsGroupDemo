//
//  ApplicationCoordinator.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/27.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

/// the coordinator of the application
class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let navigationController: UINavigationController
    var listCoordinator: PhotoListCoordinator?
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = navigationController
        listCoordinator = PhotoListCoordinator(navigationController: navigationController)
        listCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
