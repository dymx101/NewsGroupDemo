//
//  ApiManager.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

protocol ApiManagerProtocol {
    init(networkManager: NetworkManagerProtocol)
    func getPhotos(completion:@escaping (Result<[Photo], Error>) -> Void)
}

final class ApiManager: ApiManagerProtocol {
    
    private var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        networkManager.get(endpoint: .photos, responseType: [Photo].self) { (photos, error) in
            if let photos = photos {
                completion(.success(photos))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(ApiError.general))
            }
        }
    }
}
