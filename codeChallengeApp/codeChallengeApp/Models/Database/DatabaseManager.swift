//
//  DatabaseManager.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation
import RealmSwift

/// protocol of database manager
protocol DatabaseManagerProtocol {
    
    init(type: DatabaseType)
    
    /// save a photo to the database
    func savePhoto(_ photo: Photo)
    
    /// save a list of photos to the database
    func savePhotos(_ photos: [Photo])
    
    /// load a photo from the database by id
    func loadPhoto(id: Int) -> Photo?
    
    /// load all the photos from database
    func loadAllPhotos() -> [Photo]
    
    /// remove a photo from the database by id
    func removePhoto(id: Int)
    
    /// remove all the photos from database
    func removeAllPhotos()
}

enum DatabaseType {
    case standard
    case memory
}

final class DatabaseManager: DatabaseManagerProtocol {
    
    static let `default` = DatabaseManager()
    
    private var realm: Realm?
    
    init(type: DatabaseType = .standard) {
        realm = try? DatabaseManager.createRealm(type: type)
    }
    
    private static func createRealm(type: DatabaseType) throws -> Realm {
        switch type {
        case .standard:
            return try Realm()
        case .memory:
            return try Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm"))
        }
    }
    
    func savePhoto(_ photo: Photo) {
        do {
            try realm?.write {
                realm?.add(photo, update: true)
            }
        } catch let error {
            print("savePhoto Error: \(error.localizedDescription)")
        }
    }
    
    func savePhotos(_ photos: [Photo]) {
        do {
            try realm?.write {
                realm?.add(photos, update: true)
            }
        } catch let error {
            print("savePhotos Error: \(error.localizedDescription)")
        }
    }
    
    func loadPhoto(id: Int) -> Photo? {
        return realm?.objects(Photo.self).filter("id == %@", id).first
    }
    
    func loadAllPhotos() -> [Photo] {
        return realm?.objects(Photo.self).map{$0} ?? []
    }
    
    func removePhoto(id: Int) {
        guard let photo = loadPhoto(id: id) else {return}
        
        do {
            try realm?.write {
                realm?.delete(photo)
            }
        } catch let error {
            print("removePhoto Error: \(error.localizedDescription)")
        }
    }
    
    func removeAllPhotos() {
        // We don't convert Results to Array, to improve efficiency since Results is a lazy collection
        guard let allPhotos = realm?.objects(Photo.self) else {return}
        
        do {
            try realm?.write {
                realm?.delete(allPhotos)
            }
        } catch let error {
            print("removeAllPhotos Error: \(error.localizedDescription)")
        }
    }
}
