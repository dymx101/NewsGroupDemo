//
//  BaseCollectionViewCell.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/26.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    static var REUSE_ID: String {
        return String(describing: self)
    }
    
    static var REGISTER_ID: String {
        return String(describing: self)
    }
    
    static var NIB_NAME: String {
        return String(describing: self)
    }
}
