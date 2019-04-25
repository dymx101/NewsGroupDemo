//
//  NetworkManagerTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class NetworkManagerTests: XCTestCase {
    
    var testObject: NetworkManagerProtocol!

    override func setUp() {
        testObject = NetworkManager()
    }

    func test_getMethod_works() {
        let expect = expectation(description: "request should be complete")
        
        testObject.get(endpoint: Endpoint.photos, responseType: [Photo].self) { (photoList, error) in
            expect.fulfill()
            
            XCTAssertNil(error, "there should be not error")
            XCTAssertNotNil(photoList, "photo list should not be nil")
            XCTAssertFalse(photoList!.isEmpty, "photo list should not be empty")
        }
        
        wait(for: [expect], timeout: 30)
    }
}
