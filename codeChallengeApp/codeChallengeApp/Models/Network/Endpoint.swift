//
//  Endpoint.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint: URLRequestConvertible {
    
    case photos
    
    func asURLRequest() throws -> URLRequest {
        let url = try Endpoint.baseURLPath.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
    static let baseURLPath = "http://jsonplaceholder.typicode.com"
    
    var method: HTTPMethod {
        switch self {
        case .photos:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .photos:
            return [:]
        }
    }
}
