//
//  PhotoListCoordinator.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

/// the coordinator for photo list screen
class PhotoListCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: PhotoListViewController.STORYBOARD_ID) as! PhotoListViewController
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension PhotoListCoordinator: PhotoListViewControllerDelegate {
    func showDetail(_ photo: Photo) {
        PhotoDetailCoordinator(navigationController: navigationController, photo: photo).start()
    }
}
