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

/// protocol of network manager
protocol NetworkManagerProtocol {
    func request<T: Decodable>(endpoint: Endpoint, responseType: T.Type, completion: @escaping NetworkCompletion<T>)
}

/// network manager handles the general network request and response
class NetworkManager: NetworkManagerProtocol {
    
    static let `default` = NetworkManager()
    
    private var sessionManager: SessionManager = {
        let sm = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
        return sm
    }()
    
    /// send a request
    ///
    /// - parameter endpoint: the endpoint object of an api
    /// - parameter responseType: the type of the response object, must conform to `Decodable`
    /// - parameter completion: callback block when request got a response or error
    func request<T: Decodable>(endpoint: Endpoint, responseType: T.Type, completion: @escaping NetworkCompletion<T>) {
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
