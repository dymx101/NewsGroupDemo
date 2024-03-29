//
//  PhotoListItemCellViewModel.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

protocol PhotoListItemCellViewModelProtocol {
    var photo: Photo? {get set}
    var imageUrl: URL? {get}
    var title: String {get}
}

/// the view model for photo list item cell
final class PhotoListItemCellViewModel: PhotoListItemCellViewModelProtocol {
    var photo: Photo?
    
    var imageUrl: URL? {
        guard let url = photo?.thumbnailUrl else {return nil}
        
        return URL(string: url)
    }
    
    var title: String {
        return photo?.title ?? ""
    }
}
