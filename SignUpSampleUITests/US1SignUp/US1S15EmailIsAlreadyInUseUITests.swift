//
//  US1S15EmailIsAlreadyInUseUITests.swift
//  SignUpSampleUITests
//
//  Created by Nam Tran on 12/5/21.
//
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//
//  Submitting
//
//  US1-S15 - Scenario 15: The email is already in use.
//
//  Given I submitted the sign up form
//  and the loading indicator is showing
//  when the app receive error about "The email is already in use"
//  then the email field is showed
//  and the error message "The email is already in use" is showed
//  and the loading indicator is hiding.
//

import XCTest

class US1S15EmailIsAlreadyInUseUITests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
