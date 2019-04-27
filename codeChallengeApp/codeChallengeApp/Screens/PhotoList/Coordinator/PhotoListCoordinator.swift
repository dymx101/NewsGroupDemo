//
//  PhotoListCoordinator.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

class PhotoListCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: PhotoListViewController.STORYBOARD_ID) as! PhotoListViewController
        navigationController.pushViewController(vc, animated: true)
    }
}
