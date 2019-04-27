//
//  codeChallengeAppUITests.swift
//  codeChallengeAppUITests
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import XCTest

class codeChallengeAppUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["ResetDefaults", "NoAnimations", "UserHasRegistered"]
        app.launch()
    }

    func test_ShouldShowDetail() {
        let photoListRootView = app.otherElements.element(matching: .other, identifier: "id_photo_list_view")
        
        waitForElementToAppear(element: photoListRootView)
        
        XCTAssert(photoListRootView.exists)
        
        let firstCell = app.cells.element(matching: .cell, identifier: "id_list_cell_0")
        
        waitForElementToAppear(element: firstCell)
        
        XCTAssert(firstCell.exists)
        
        firstCell.tap()
        
        let titleLabel = app.staticTexts.element(matching: .any, identifier: "id_photo_detail_label")
        
        XCTAssertEqual(titleLabel.label, "accusamus beatae ad facilis cum similique qui sunt")
        
        app.buttons["Photo Gallery"].tap()
        
        waitForElementToAppear(element: photoListRootView)
        
        XCTAssert(photoListRootView.exists)
    }
    
    private func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            }
        }
    }
}
