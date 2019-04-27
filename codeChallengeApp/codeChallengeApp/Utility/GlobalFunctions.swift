//
//  GlobalFunctions.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation

/// Get the localized string by a key
///
/// - parameter key: The key for the localized string
/// - returns: Localized string
func Localized(key: String) -> String {
    return NSLocalizedString(key, comment: key)
}
