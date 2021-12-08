//
//  US1S4EmailIsInvalidUITests.swift
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
//  US1-S4 - Scenario 4: The email is invalid.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the email
//  and the email text field was focused on
//  and the keyboard was presented
//  when I enter an invalid email
//  then the error message "The email is invalid" is showed
//  and the next button are still disabled.
//

import XCTest

class US1S4EmailIsInvalidUITests: US1SignUpXCTestCase {
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
        emailField.typeText("robo8590@gmail")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, "The email is invalid.")
        XCTAssertFalse(nextButton.isEnabled)

        // When
        emailField.clearText()
        emailField.typeText("robo$8590@gmail.com")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, "The email is invalid.")
        XCTAssertFalse(nextButton.isEnabled)

        // When
        emailField.clearText()
        emailField.typeText("robo%8-5+9.0@gm*ail.com")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, "The email is invalid.")
        XCTAssertFalse(nextButton.isEnabled)

        // When
        emailField.clearText()
        emailField.typeText("robo%8-5+9.0@gm.ai-9l.c")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, "The email is invalid.")
        XCTAssertFalse(nextButton.isEnabled)

        // When
        emailField.clearText()
        emailField.typeText("robo%8-5+9.0@gm.ai-9l.com3")

        // Then
        XCTAssertTrue(errorLabel.exists)
        XCTAssertEqual(errorLabel.label, "The email is invalid.")
        XCTAssertFalse(nextButton.isEnabled)
    }
}
