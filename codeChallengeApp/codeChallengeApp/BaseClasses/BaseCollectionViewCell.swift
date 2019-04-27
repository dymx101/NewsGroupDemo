//
//  BaseCollectionViewCell.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/26.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    /// the reuse id for collection view
    static var REUSE_ID: String {
        return String(describing: self)
    }
    
    /// the id for registering nib in collection view
    static var REGISTER_ID: String {
        return String(describing: self)
    }
    
    /// the name for initialize a nib object
    static var NIB_NAME: String {
        return String(describing: self)
    }
}
