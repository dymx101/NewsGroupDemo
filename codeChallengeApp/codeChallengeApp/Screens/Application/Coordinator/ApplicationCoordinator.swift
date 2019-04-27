//
//  ApplicationCoordinator.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/27.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let navigationController: UINavigationController
    
    let photoListCoordinator: PhotoListCoordinator
    
    init(window: UIWindow) {
        
        self.window = window
        navigationController = UINavigationController()
        
        photoListCoordinator = PhotoListCoordinator(navigationController: navigationController)
    }
    
    func start() {
        window.rootViewController = navigationController
        photoListCoordinator.start()
    }
}
