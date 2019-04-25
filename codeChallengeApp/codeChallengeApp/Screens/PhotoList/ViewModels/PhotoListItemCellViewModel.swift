//
//  PhotoListItemCellViewModel.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

protocol PhotoListItemCellViewModelProtocol {
    var imageUrl: String {get}
    var title: String {get}
}

final class PhotoListItemCellViewModel: PhotoListItemCellViewModelProtocol {
    var photo: Photo?
    
    var imageUrl: String {
        return photo?.thumbnailUrl ?? ""
    }
    
    var title: String {
        return photo?.title ?? ""
    }
}
