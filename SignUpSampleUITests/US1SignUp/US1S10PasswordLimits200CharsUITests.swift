//
//  US1S10PasswordLimits200CharsUITests.swift
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
//  US1-S10 - Scenario 10: The password limits 200 characters.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  when I enter more than 200 characters
//  then the password field only accepts 200 characters.
//

import XCTest

class US1S10PasswordLimits200CharsUITests: US1SignUpXCTestCase {
    func testScenario() throws {
        // Given
        firstNameField.typeText("Nam")
        nextButton.tap()
        emailField.typeText("robo8590@gmail.com")
        nextButton.tap()
        XCTAssertTrue(passwordField.exists)
        XCTAssertEqual(passwordField.value as? String, "")
        XCTAssertEqual(passwordField.value(forKey: "hasKeyboardFocus") as? Bool, true)

        // When
        let input = "Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam"
        + "Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!NamNam!Nam!Na"
        + "Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!Nam!NamNam!Nam!Na"
        passwordField.typeText(input)

        // Then
        XCTAssertFalse(errorLabel.exists)
        XCTAssertEqual((passwordField.value as? String)?.count, 200)
        XCTAssertTrue(nextButton.exists)
        XCTAssertTrue(nextButton.isEnabled)
    }
}
