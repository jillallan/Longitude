//
//  BaseUITestCase.swift
//  LongitudeUITests
//
//  Created by Jill Allan on 06/07/2023.
//

import XCTest

class BaseUITestCase: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        app = XCUIApplication()
//        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        
    }
}
