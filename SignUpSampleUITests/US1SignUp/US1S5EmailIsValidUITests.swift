//
//  US1S5EmailIsValidUITests.swift
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
//  Entering the email
//
//  US1-S5 - Scenario 5: The email is valid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the email
//  and the email text field was focused on
//  and the keyboard was presented
//  when I enter a valid email
//  then no error message is showed
//  and the next button are enabled
//  when I tap to the next or go button
//  then the password field should be showed.
//

import XCTest

class US1S5EmailIsValidUITests: US1SignUpXCTestCase {
    func testScenario() throws {
        // Given
        firstNameField.typeText("Nam Tran")
        nextButton.tap()
        XCTAssertTrue(emailField.exists)
        XCTAssertEqual(emailField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)

        // When
        emailField.typeText("robo8590")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, "The email is invalid.")
        XCTAssertFalse(nextButton.isEnabled)

        // When
        emailField.clearText()
        emailField.typeText("robo%8-5+9.0@gm.ai-9l.co")

        // Then
        XCTAssertFalse(errorLabel.exists)
        XCTAssertTrue(nextButton.isEnabled)

        // When
        emailField.clearText()
        emailField.typeText("robo8590@gmail.com")
        nextButton.tap()

        // Then
        XCTAssertFalse(emailField.exists)
        XCTAssertFalse(errorLabel.exists)
        XCTAssertTrue(passwordLabel.exists)
        XCTAssertTrue(passwordField.exists)
        XCTAssertEqual(passwordField.value as? String, "")
        XCTAssertEqual(passwordField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)
        XCTAssertFalse(nextButton.isEnabled)
    }
}
