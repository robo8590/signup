//
//  US1S7PasswordIsRequiredUITests.swift
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
//  Entering the password
//
//  US1-S7 - Scenario 7: The password is required.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  then the next button are disabled.
//

import XCTest

class US1S7PasswordIsRequiredUITests: US1SignUpXCTestCase {
    func testScenario() throws {
        // Given
        firstNameField.typeText("Nam Tran")
        nextButton.tap()
        emailField.typeText("robo8590@gmail.com")
        nextButton.tap()

        // Then
        XCTAssertTrue(passwordLabel.exists)
        XCTAssertTrue(passwordField.exists)
        XCTAssertEqual(passwordField.value as? String, "")
        XCTAssertEqual(passwordField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)
        XCTAssertFalse(nextButton.isEnabled)
    }
}
