//
//  ApiError.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

enum ApiError: String, Error {
    case general
    
    var localizedDescription: String {
        switch self {
        case .general:
            return Localized(key: "msg_general_api_error")
        }
    }
}
