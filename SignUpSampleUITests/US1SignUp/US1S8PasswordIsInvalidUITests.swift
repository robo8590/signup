//
//  US1S8PasswordIsInvalidUITests.swift
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
//  US1-S8 - Scenario 8: The password is invalid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the password
//  and the password field was focused on
//  and the keyboard was presented
//  when I enter an invalid password
//  then the error message "The password must have 6 to 200 characters, 1 lowercase, 1 uppercase and 1 special character." is showed
//  and the next button are still disabled.
//

import XCTest

class US1S8PasswordIsInvalidUITests: US1SignUpXCTestCase {
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
        passwordField.typeText("nam123")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, errorMessage)
        XCTAssertFalse(nextButton.isEnabled)

        // When
        passwordField.clearText()
        passwordField.typeText("Nam123")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, errorMessage)
        XCTAssertFalse(nextButton.isEnabled)

        // When
        passwordField.clearText()
        passwordField.typeText("nam12!")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, errorMessage)
        XCTAssertFalse(nextButton.isEnabled)
    }
}
