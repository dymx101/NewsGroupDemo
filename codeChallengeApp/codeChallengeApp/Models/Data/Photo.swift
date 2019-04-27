//
//  Photo.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation
import RealmSwift

/// the model class for `Photo`
class Photo: Object, Decodable {
    
    @objc dynamic var albumId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var thumbnailUrl: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
