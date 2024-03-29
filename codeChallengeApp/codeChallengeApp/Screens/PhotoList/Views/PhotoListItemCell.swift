//
//  PhotoListItemCell.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit
import Kingfisher

/// the collection view cell of a photo list item
class PhotoListItemCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 4
            imageView.layer.masksToBounds = true
        }
    }
    
    var viewModel: PhotoListItemCellViewModelProtocol? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
    }
    
    private func updateUI() {
        if let url = viewModel?.imageUrl {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
}
