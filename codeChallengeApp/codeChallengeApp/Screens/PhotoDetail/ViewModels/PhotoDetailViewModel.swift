//
//  PhotoDetailViewModel.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

protocol PhotoDetailViewModelProtocol {
    var photo: Photo? {get set}
    var imageUrl: URL? {get}
    var title: String {get}
}

/// the view model of the photo detail view controller
final class PhotoDetailViewModel: PhotoDetailViewModelProtocol {
    var photo: Photo?
    
    var imageUrl: URL? {
        guard let url = photo?.url else {return nil}
        
        return URL(string: url)
    }
    
    var title: String {
        return photo?.title ?? ""
    }
}
