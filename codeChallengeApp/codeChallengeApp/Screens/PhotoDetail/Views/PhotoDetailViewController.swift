//
//  PhotoDetailViewController.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit
import Kingfisher

/// the view controller of the photo detail screen
class PhotoDetailViewController: BaseViewController {

    var viewModel = DependencyInjector.shared.resolve(PhotoDetailViewModelProtocol.self)!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleContainerView: UIView! {
        didSet {
            titleContainerView.backgroundColor = UIColor.maskDark
        }
    }
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        lblTitle.text = viewModel.title
        if let url = viewModel.imageUrl {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
}
