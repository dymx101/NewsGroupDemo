//
//  PhotoListItemCell.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoListItemCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 4
            imageView.layer.masksToBounds = true
        }
    }
    
    var viewModel: PhotoListItemCellViewModelProtocol? {
        didSet {
            if let urlString = viewModel?.imageUrl, let url = URL(string: urlString) {
                imageView.kf.indicatorType = .activity
                imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
