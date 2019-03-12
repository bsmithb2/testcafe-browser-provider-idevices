//
//  testApplicationUITests.swift
//  testApplicationUITests
//
//  Created by Bradley Smith on 11/3/19.
//  Copyright © 2019 Bradley Smith. All rights reserved.
//

import XCTest

class testApplicationUITests: XCTestCase {

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRunCleanSafariAndExecuteTestCafe() {
        var urlValue = "www.bradleysmith.dev"
        if let value = ProcessInfo.processInfo.environment["TESTCAFE_URL"] {
            print("testcafe url: " + value + "\r\n")
            urlValue = value
        }
        print("testcafe url: " + urlValue + "\r\n")
        Springboard().resetLocationAndPrivacySettings()
        Springboard().openSafari(url: urlValue)
    }

}
