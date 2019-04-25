//
//  PhotoTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/25.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class PhotoTests: XCTestCase {
    
    var photo: Photo?

    func testDecodingIsSuccess() {
        let jsonString = """
{
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  }
"""
        let jsonData = jsonString.data(using: .utf8)
        do {
            photo = try JSONDecoder().decode(Photo.self, from: jsonData!)
            XCTAssertNotNil(photo, "photo should be decoded correctly")
            XCTAssertEqual(photo?.albumId, 1, "albumId should be correct")
            XCTAssertEqual(photo?.id, 1, "id should be correct")
            XCTAssertEqual(photo?.url, "https://via.placeholder.com/600/92c952", "url should be correct")
            XCTAssertEqual(photo?.thumbnailUrl, "https://via.placeholder.com/150/92c952", "thumbnailUrl should be correct")
        } catch let error {
            XCTFail("decode should be success, error:\(error.localizedDescription)")
        }
    }
}
