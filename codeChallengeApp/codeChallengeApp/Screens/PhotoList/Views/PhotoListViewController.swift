//
//  PhotoListViewController.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

class PhotoListViewController: BaseViewController {

    let viewModel = DependencyInjector.shared.resolve(PhotoListViewModelProtocol.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        viewModel?.getPhotos(refresh: false, completion: { [weak self] (error) in
//            
//        })
    }
}
