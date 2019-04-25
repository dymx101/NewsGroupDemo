//
//  EndpointTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class EndpointTests: XCTestCase {
    
    func test_getPhotos_suceedAndHasCorrectData() {
        let endpoint = Endpoint.photos
        XCTAssertEqual(endpoint.method.rawValue, "GET", "http method should be correct")
        XCTAssertEqual(endpoint.path, "/photos", "http path should be correct")
        do {
            let request = try endpoint.asURLRequest()
            XCTAssertNotNil(request.url?.absoluteString, "url string should not be empty")
            XCTAssertTrue(request.url!.absoluteString.contains(Endpoint.baseURLPath), "base url should be correct")
            XCTAssertTrue(request.url!.absoluteString.contains(endpoint.path), "endpoint path should be correct")
            XCTAssertEqual(request.httpMethod, endpoint.method.rawValue, "http method should be correct")
            
        } catch {
            XCTFail("should be able to convert as URLRequest")
        }
    }
}
