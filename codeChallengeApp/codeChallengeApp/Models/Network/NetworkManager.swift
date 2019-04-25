//
//  NetworkManager.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation
import Alamofire

public typealias NetworkCompletion<T: Decodable> = (T?, Error?) -> Void
public typealias ProgressHandler = (Double) -> Void

protocol NetworkManagerProtocol {
    func get<T: Decodable>(endpoint: Endpoint, responseType: T.Type, completion: @escaping NetworkCompletion<T>)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let `default` = NetworkManager()
    
    private var sessionManager: SessionManager = {
        let sm = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
        return sm
    }()
    
    func get<T: Decodable>(endpoint: Endpoint, responseType: T.Type, completion: @escaping NetworkCompletion<T>) {
        guard let urlRequest = try? endpoint.asURLRequest() else {return}
        
        sessionManager.request(urlRequest).responseData { (response) in
            guard let data = response.result.value else {
                completion(nil, response.result.error)
                return
            }
            
            do {
                let object = try JSONDecoder().decode(responseType, from: data)
                completion(object, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
}
