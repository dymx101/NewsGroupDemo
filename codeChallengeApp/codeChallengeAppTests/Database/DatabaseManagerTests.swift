//
//  DatabaseManagerTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class DatabaseManagerTests: XCTestCase {

    var testObject: DatabaseManagerProtocol!
    
    override func setUp() {
        // create an in memory database here, so that it will not mess up the app database
        testObject = DatabaseManager(type: .memory)
    }
    
    override func tearDown() {
        testObject.removeAllPhotos()
        testObject = nil
    }
    
    func test_saveAndLoadPhoto_succeed() {
        XCTAssertTrue(testObject.loadAllPhotos().count == 0, "should have no photos at first")
        
        let photo = generatePhotos().first!
        testObject.savePhoto(photo)
        
        XCTAssertTrue(testObject.loadAllPhotos().count == 1, "should have one photos after saving")
        XCTAssertEqual(testObject.loadAllPhotos().first!.id, photo.id, "saved photo should have correct id")
    }
    
    func test_saveAndLoadPhotos_succeed() {
        XCTAssertTrue(testObject.loadAllPhotos().count == 0, "should have no photos at first")
        
        let photos = generatePhotos()
        testObject.savePhotos(photos)
        
        XCTAssertTrue(testObject.loadAllPhotos().count == 3, "should have one photos after saving")
    }
    
    func test_updatePhoto_succeed() {
        XCTAssertTrue(testObject.loadAllPhotos().count == 0, "should have no photos at first")
        
        let title1 = "Test Title 1"
        let title2 = "Test Title 2"
        var photo = generatePhotos().first!
        photo.title = title1
        testObject.savePhoto(photo)
        
        XCTAssertTrue(testObject.loadAllPhotos().count == 1, "should have one photos after saving")
        XCTAssertEqual(testObject.loadAllPhotos().first!.id, photo.id, "saved photo should have correct id")
        XCTAssertEqual(testObject.loadAllPhotos().first!.title, title1, "saved photo should have correct title")
        
        photo = generatePhotos().first!
        photo.title = title2
        testObject.savePhoto(photo)
        
        XCTAssertTrue(testObject.loadAllPhotos().count == 1, "should have one photos after saving")
        XCTAssertEqual(testObject.loadAllPhotos().first!.id, photo.id, "saved photo should have correct id")
        XCTAssertEqual(testObject.loadAllPhotos().first!.title, title2, "saved photo should have correct title")
    }
    
    func test_removePhotoWithId_succeed() {
        XCTAssertTrue(testObject.loadAllPhotos().count == 0, "should have no photos at first")
        
        let photos = generatePhotos()
        testObject.savePhotos(photos)
        
        XCTAssertTrue(testObject.loadAllPhotos().count == 3, "should have one photos after saving")
        
        testObject.removePhoto(id: 1)

        XCTAssertTrue(testObject.loadAllPhotos().count == 2, "should have one photos after saving")
    }
    
    func test_removeAllPhotos_succeed() {
        XCTAssertTrue(testObject.loadAllPhotos().count == 0, "should have no photos at first")
        
        let photos = generatePhotos()
        testObject.savePhotos(photos)
        
        XCTAssertTrue(testObject.loadAllPhotos().count == 3, "should have one photos after saving")
        
        testObject.removeAllPhotos()
        
        XCTAssertTrue(testObject.loadAllPhotos().count == 0, "should have no photos at first")
    }
    
    
    
    
    private func generatePhotos() -> [Photo] {
        let photosJson = """
[{
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "officia porro iure quia iusto qui ipsa ut modi",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355"
  }]
"""
        
        let jsonData = photosJson.data(using: .utf8)
        
        return try! JSONDecoder().decode([Photo].self, from: jsonData!)
    }
}
