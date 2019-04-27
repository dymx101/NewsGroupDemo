//
//  PhotoListItemCellViewModelTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class PhotoListItemCellViewModelTests: XCTestCase {

    func test_init_should_haveCorrectData() {
        let photo = Photo()
        photo.id = 1
        photo.title = "test title"
        photo.albumId = 1
        photo.url = "http://www.youtube.com"
        photo.thumbnailUrl = "http://www.google.com"
        
        let testObject = PhotoListItemCellViewModel()
        testObject.photo = photo
        
        XCTAssertEqual(testObject.title, photo.title, "should have the same title as photo")
        XCTAssertEqual(testObject.imageUrl?.absoluteString, photo.thumbnailUrl, "should have the correct image url")
    }
}
