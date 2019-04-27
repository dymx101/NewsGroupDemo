//
//  PhotoDetailCoordinator.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

class PhotoDetailCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private var photo: Photo?
    
    init(navigationController: UINavigationController, photo: Photo) {
        self.navigationController = navigationController
        self.photo = photo
    }
    
    func start() {
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: PhotoDetailViewController.STORYBOARD_ID) as! PhotoDetailViewController
        vc.viewModel.photo = photo
        navigationController.pushViewController(vc, animated: true)
    }
}
