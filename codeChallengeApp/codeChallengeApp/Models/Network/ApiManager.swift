//
//  ApiManager.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

/// protocol of api manager
protocol ApiManagerProtocol {
    init(networkManager: NetworkManagerProtocol)
    func getPhotos(completion:@escaping (Result<[Photo], Error>) -> Void)
}

/// api manager manage all the api calls
final class ApiManager: ApiManagerProtocol {
    
    private var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    /// get photos from server
    ///
    /// - parameter completion: a Result object, contains response data or error
    func getPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        networkManager.request(endpoint: .photos, responseType: [Photo].self) { (photos, error) in
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
