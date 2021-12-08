//
//  US1S3EmailIsRequiredUITests.swift
//  SignUpSampleUITests
//
//  Created by Nam Tran on 12/5/21.
//
//  US1 - User story 1 : Sign Up
//
//  As a guest user,
//  I want to create my account
//  so that I can login to the system.
//
//  Entering the email
//
//  US1-S3 - Scenario 3: The email is required.
//
//  Given I started the sign up wizard
//  and I went to the step to enter the email
//  and the email text field was focused on
//  and the keyboard was presented
//  then the next button are disabled.
//

import XCTest

class US1S3EmailIsRequiredUITests: US1SignUpXCTestCase {
    func testScenario() throws {
        // Given
        firstNameField.typeText("Nam Tran")

        // When
        nextButton.tap()

        // then the email text field should be showed
        XCTAssertTrue(emailLabel.exists)
        XCTAssertTrue(emailField.exists)
        XCTAssertEqual(emailField.value(forKey: "hasKeyboardFocus") as? Bool, true)
        XCTAssertTrue(nextButton.exists)
        XCTAssertFalse(nextButton.isEnabled)
    }
}
