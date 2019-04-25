//
//  PhotoDetailViewModel.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

protocol PhotoDetailViewModelProtocol {
    var imageUrl: String {get}
    var title: String {get}
}

final class PhotoDetailViewModel: PhotoDetailViewModelProtocol {
    var photo: Photo?
    
    var imageUrl: String {
        return photo?.url ?? ""
    }
    
    var title: String {
        return photo?.title ?? ""
    }
}
