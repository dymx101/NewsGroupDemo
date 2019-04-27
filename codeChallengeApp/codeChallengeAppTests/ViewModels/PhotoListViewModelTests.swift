//
//  PhotoListViewModelTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class PhotoListViewModelTests: XCTestCase {

    var testObject: PhotoListViewModelProtocol!
    
    override func setUp() {
        let apiManager = ApiManager(networkManager: NetworkManager())
        let databaseManager = DatabaseManager(type: .memory)
        testObject = PhotoListViewModel(apiManager: apiManager, databaseManager: databaseManager)
    }

    func test_title_should_notBeNil() {
        XCTAssertNotNil(testObject.title, "title should not be nil")
    }
    
    func test_photos_should_notBeNil() {
        XCTAssertNotNil(testObject.photos, "photos array should not be nil")
    }

    func test_getPhotos_should_succeed() {
        let expect = expectation(description: "request should be complete")
        
        testObject.getPhotos(refresh: false) { (error) in
            expect.fulfill()
            
            XCTAssertNil(error, "get photo list should not have error")
        }
        
        wait(for: [expect], timeout: EXPECTATION_TIME_OUT)
    }
}
