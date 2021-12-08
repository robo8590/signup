//
//  US1S9PasswordIsValidUITests.swift
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
//  US1-S9 - Scenario 9: The password is valid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  when I enter a valid password
//  then the next and go button are enabled
//  when I tap to the next button
//  then the website field should be showed.
//

import XCTest

class US1S9PasswordIsValidUITests: US1SignUpXCTestCase {
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
        passwordField.typeText("Nam!")

        // Then
        let errorMessage = "The password must have 6 to 200 characters, "
        + "1 lowercase, 1 uppercase and 1 special character."
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, errorMessage)
        XCTAssertFalse(nextButton.isEnabled)

        // When
        passwordField.clearText()
        passwordField.typeText("Nam123!")

        // Then
        XCTAssertFalse(errorLabel.exists)
        XCTAssertTrue(nextButton.isEnabled)

        // When
        nextButton.tap()

        // Then
        XCTAssertFalse(passwordField.exists)
        XCTAssertTrue(websiteLabel.exists)
        XCTAssertTrue(websiteField.exists)
        XCTAssertEqual(websiteField.value as? String, "")
        XCTAssertEqual(websiteField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)
        XCTAssertTrue(nextButton.isEnabled)
    }
}
