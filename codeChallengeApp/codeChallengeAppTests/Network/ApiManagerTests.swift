//
//  ApiManagerTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class ApiManagerTests: XCTestCase {
    var testObject: ApiManager!
    
    override func setUp() {
        let networkManager = NetworkManager()
        testObject = ApiManager(networkManager: networkManager)
    }
    
    func test_getPhotos_succeed() {
        let expect = expectation(description: "request should be complete")
        
        testObject.getPhotos { (results) in
            expect.fulfill()
            
            do {
                let photos = try results.get()
                XCTAssertNotNil(photos, "photo list should not be nil")
            } catch {
                XCTFail("there should be any errors")
            }
        }
        
        wait(for: [expect], timeout: EXPECTATION_TIME_OUT)
    }
}
