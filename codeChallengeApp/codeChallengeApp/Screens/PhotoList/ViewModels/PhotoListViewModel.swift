//
//  PhotoListViewModel.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

protocol PhotoListViewModelProtocol {
    var title: String {get set}
    var photos: [Photo] {get}
    
    init(apiManager: ApiManagerProtocol, databaseManager: DatabaseManagerProtocol)
    func getPhotos(refresh: Bool, completion: @escaping (Error?) -> Void)
}

final class PhotoListViewModel: PhotoListViewModelProtocol {
    var title: String = Localized(key: "Gallery")
    var photos: [Photo] = []
    
    private var apiManager: ApiManagerProtocol
    private var databaseManager: DatabaseManagerProtocol
    
    init(apiManager: ApiManagerProtocol, databaseManager: DatabaseManagerProtocol) {
        self.apiManager = apiManager
        self.databaseManager = databaseManager
    }
    
    func getPhotos(refresh: Bool = false, completion: @escaping (Error?) -> Void) {

        if (!refresh) {
            let photos = databaseManager.loadAllPhotos()
            if (!photos.isEmpty) {
                self.photos = photos
                completion(nil)
                return
            }
        }
        
        apiManager.getPhotos { [weak self] (results) in
            switch results {
            case .success(let data):
                self?.photos = data
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
