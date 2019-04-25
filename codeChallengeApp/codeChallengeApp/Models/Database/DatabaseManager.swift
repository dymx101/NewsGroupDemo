//
//  DatabaseManager.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import Foundation
import RealmSwift

protocol DatabaseManagerProtocol {
    
    init(type: DatabaseType)
    
    func savePhoto(_ photo: Photo)
    func savePhotos(_ photos: [Photo])
    
    func loadPhoto(id: Int) -> Photo?
    func loadAllPhotos() -> [Photo]
    
    func removePhoto(id: Int)
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
