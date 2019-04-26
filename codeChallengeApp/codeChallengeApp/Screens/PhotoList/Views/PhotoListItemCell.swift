//
//  PhotoListItemCell.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

class PhotoListItemCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel: PhotoListItemCellViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
