//
//  codeChallengeAppTests.swift
//  codeChallengeAppTests
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest
@testable import codeChallengeApp

class codeChallengeAppTests: XCTestCase {

    let injector = DependencyInjector.shared

    func testResolveViewModels() {
        XCTAssertNotNil(injector.resolve(PhotoListViewModelProtocol.self), "PhotoListViewModelProtocol should be resolved")
        XCTAssertNotNil(injector.resolve(PhotoDetailViewModelProtocol.self), "PhotoListViewModelProtocol should be resolved")
        XCTAssertNotNil(injector.resolve(PhotoListItemCellViewModelProtocol.self), "PhotoListViewModelProtocol should be resolved")
        XCTAssertNotNil(injector.resolve(NetworkManagerProtocol.self), "PhotoListViewModelProtocol should be resolved")
    }

}
